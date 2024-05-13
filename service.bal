import ballerina/http;
import ballerina/persist;
import product_catalog.cache;
import product_catalog.store;

service /shop on new http:Listener(9090) {

    private final cache:Client cache;
    private final store:Client store;
    http:Client shopClient = check new ("localhost:9090/shop");

    // Initialize the client API
    function init() returns error? {
        self.cache = check new();
        self.store = check new();
    }

    // Add sellers
    resource function post sellers(store:SellerInsert seller) returns http:Created & readonly
    |persist:Error|http:Conflict {
        int[]|persist:Error result = self.store->/sellers.post([seller]);
        if result is persist:Error {
            if result is persist:AlreadyExistsError {
                return http:CONFLICT;
            }
            return result;
        }
        return http:CREATED;
    }

    // Update seller
    resource function put sellers/[int id](store:SellerUpdate seller) returns Conflict|persist:Error|http:Ok & readonly {
        store:Seller|persist:Error result = self.store->/sellers/[id].put(seller);
        if result is persist:Error {
            if result is persist:ConstraintViolationError || result is persist:NotFoundError {
                Conflict response = {body: {message: result.message()}};
                return response;
            }
            return result;
        }
        return http:OK;
    }

    // Get seller info
    resource function get sellers/[int id]() returns persist:Error|http:NotFound|cache:Seller {
        cache:Seller|persist:Error sellerFromCache = self.cache->/sellers/[id];
        if sellerFromCache is persist:NotFoundError {
            store:Seller|persist:Error seller = self.store->/sellers/[id];
            if seller is persist:Error {
                if seller is persist:NotFoundError {
                    return {body: {message: seller.message()}};
                }
                return seller;
            }
            // Add the seller to cache
            _ = check self.cache->/sellers.post([seller]);
            return seller;
        }
        return sellerFromCache;
    }

    // Add products
    resource function post products(store:ProductInsert product) returns http:Created & readonly
    |persist:Error|http:Conflict {
        int[]|persist:Error result = self.store->/products.post([product]);
        if result is persist:Error {
            if result is persist:AlreadyExistsError {
                return http:CONFLICT;
            }
            return result;
        }
        return http:CREATED;
    }

    // Update a product
    resource function put products/[int id](store:ProductUpdate product) returns Conflict|persist:Error|http:Ok & readonly {
        cache:Product|persist:Error cachedResult = self.cache->/products/[id].delete;
        store:Product|persist:Error result = self.store->/products/[id].put(product);
        if result is persist:Error {
            if result is persist:ConstraintViolationError || result is persist:NotFoundError {
                Conflict response = {body: {message: result.message()}};
                return response;
            }
            return result;
        }
        return http:OK;
    }

    // Delete a product
    resource function delete products/[int id]() returns http:NoContent & readonly|persist:Error {
        cache:Product|persist:Error cachedResult = self.cache->/products/[id].delete;
        store:Product|persist:Error result = self.store->/products/[id].delete;
        if result is store:Product {
            return http:NO_CONTENT;
        }
        return result;
    }

    // Get product info
    resource function get products/[int id]() returns persist:Error|http:NotFound|Product {
        Product|persist:Error ProductFromCache = self.cache->/products/[id];
        if ProductFromCache is persist:NotFoundError {
            store:Product|persist:Error product = self.store->/products/[id];
            if product is persist:Error {
                if product is persist:NotFoundError {
                    return {body: {message: product.message()}};
                }
                return product;
            }

            cache:Seller _ = check self.updateSellerCache(product.sellerId);
            cache:Category _ = check self.updateCategoryCache(product.categoryId);

            // Add the product to cache
            _ = check self.cache->/products.post([product]);
            ProductFromCache = check self.cache->/products/[id];
        }
        return ProductFromCache;
    }

    private function updateSellerCache(int id) returns cache:Seller|persist:Error {
        cache:Seller|persist:Error sellerFromCache = self.cache->/sellers/[id]();
        if sellerFromCache is persist:NotFoundError {
            store:Seller|persist:Error seller = self.store->/sellers/[id];
            if seller is persist:Error {
                return seller;
            }
            // Add the seller info to cache
            _ = check self.cache->/sellers.post([seller]);
            return seller;
        }
        return sellerFromCache;
    }

    function updateCategoryCache(int id) returns cache:Category|persist:Error {
        cache:Category|persist:Error categoryFromCache = self.cache->/categories/[id]();
        if categoryFromCache is persist:NotFoundError {
            store:Category|persist:Error category = self.store->/categories/[id];
            if category is persist:Error {
                return category;
            }
            // Add the seller info to cache
            _ = check self.cache->/categories.post([category]);
            return category;
        }
        return categoryFromCache;
    }

    // Get all products
    resource function get products() returns Product[]|error {
        stream<Product, persist:Error?> products = self.store->/products;
        return from Product product in products
            select product;
    }

    // Add categories
    resource function post categories(store:CategoryInsert category) returns http:Created & readonly
    |persist:Error|http:Conflict {
        int[]|persist:Error result = self.store->/categories.post([category]);
        if result is persist:Error {
            if result is persist:AlreadyExistsError {
                return http:CONFLICT;
            }
            return result;
        }
        return http:CREATED;
    }

    // Get all products of category
    resource function get categories/[string category]/products() returns Product[]|error {
        stream<Product, persist:Error?> products = self.store->/products;
        return from Product product in products
            where product.category.name == category 
            select product;
    }

    // Get all products of category
    resource function get sellers/[int id]/products() returns Product[]|error {
        stream<Product, persist:Error?> products = self.store->/products;
        return from Product product in products
            where product.seller.id == id 
            select product;
    }
}

type Conflict record {|
    *http:Conflict;
    record {
        string message;
    } body;
|};

type Product record {|
    string name;
    float price;
    float rating;
    int totalSale;
    record {|
        string name;
    |} category;
    record {|
        int id;
        string name;
    |} seller;
|};

// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerinax/persist.redis as predis;
import ballerinax/redis;

const SELLER = "sellers";
const PRODUCT = "products";
const CATEGORY = "categories";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final redis:Client dbClient;

    private final map<predis:RedisClient> persistClients;

    private final record {|predis:RedisMetadata...;|} & readonly metadata = {
        [SELLER]: {
            entityName: "Seller",
            collectionName: "Seller",
            fieldMetadata: {
                id: {fieldName: "id", fieldDataType: predis:INT},
                name: {fieldName: "name", fieldDataType: predis:STRING},
                email: {fieldName: "email", fieldDataType: predis:STRING},
                contactNumber: {fieldName: "contactNumber", fieldDataType: predis:STRING},
                address: {fieldName: "address", fieldDataType: predis:STRING},
                logoUrl: {fieldName: "logoUrl", fieldDataType: predis:STRING},
                "products[].id": {relation: {entityName: "products", refField: "id", refFieldDataType: predis:INT}},
                "products[].name": {relation: {entityName: "products", refField: "name", refFieldDataType: predis:STRING}},
                "products[].description": {relation: {entityName: "products", refField: "description", refFieldDataType: predis:STRING}},
                "products[].price": {relation: {entityName: "products", refField: "price", refFieldDataType: predis:FLOAT}},
                "products[].availability": {relation: {entityName: "products", refField: "availability", refFieldDataType: predis:STRING}},
                "products[].categoryId": {relation: {entityName: "products", refField: "categoryId", refFieldDataType: predis:INT}},
                "products[].quantity": {relation: {entityName: "products", refField: "quantity", refFieldDataType: predis:INT}},
                "products[].rating": {relation: {entityName: "products", refField: "rating", refFieldDataType: predis:FLOAT}},
                "products[].totalSale": {relation: {entityName: "products", refField: "totalSale", refFieldDataType: predis:INT}},
                "products[].releaseDate": {relation: {entityName: "products", refField: "releaseDate", refFieldDataType: predis:DATE}},
                "products[].lastUpdated": {relation: {entityName: "products", refField: "lastUpdated", refFieldDataType: predis:TIME_OF_DAY}},
                "products[].sellerId": {relation: {entityName: "products", refField: "sellerId", refFieldDataType: predis:INT}}
            },
            keyFields: ["id"],
            refMetadata: {products: {entity: Product, fieldName: "products", refCollection: "Product", refFields: ["sellerId"], joinFields: ["id"], 'type: predis:MANY_TO_ONE}}
        },
        [PRODUCT]: {
            entityName: "Product",
            collectionName: "Product",
            fieldMetadata: {
                id: {fieldName: "id", fieldDataType: predis:INT},
                name: {fieldName: "name", fieldDataType: predis:STRING},
                description: {fieldName: "description", fieldDataType: predis:STRING},
                price: {fieldName: "price", fieldDataType: predis:FLOAT},
                availability: {fieldName: "availability", fieldDataType: predis:STRING},
                categoryId: {fieldName: "categoryId", fieldDataType: predis:INT},
                quantity: {fieldName: "quantity", fieldDataType: predis:INT},
                rating: {fieldName: "rating", fieldDataType: predis:FLOAT},
                totalSale: {fieldName: "totalSale", fieldDataType: predis:INT},
                releaseDate: {fieldName: "releaseDate", fieldDataType: predis:DATE},
                lastUpdated: {fieldName: "lastUpdated", fieldDataType: predis:TIME_OF_DAY},
                sellerId: {fieldName: "sellerId", fieldDataType: predis:INT},
                "category.id": {relation: {entityName: "category", refField: "id", refFieldDataType: predis:INT}},
                "category.name": {relation: {entityName: "category", refField: "name", refFieldDataType: predis:STRING}},
                "category.description": {relation: {entityName: "category", refField: "description", refFieldDataType: predis:STRING}},
                "seller.id": {relation: {entityName: "seller", refField: "id", refFieldDataType: predis:INT}},
                "seller.name": {relation: {entityName: "seller", refField: "name", refFieldDataType: predis:STRING}},
                "seller.email": {relation: {entityName: "seller", refField: "email", refFieldDataType: predis:STRING}},
                "seller.contactNumber": {relation: {entityName: "seller", refField: "contactNumber", refFieldDataType: predis:STRING}},
                "seller.address": {relation: {entityName: "seller", refField: "address", refFieldDataType: predis:STRING}},
                "seller.logoUrl": {relation: {entityName: "seller", refField: "logoUrl", refFieldDataType: predis:STRING}}
            },
            keyFields: ["id"],
            refMetadata: {
                category: {entity: Category, fieldName: "category", refCollection: "Category", refMetaDataKey: "product", refFields: ["id"], joinFields: ["categoryId"], 'type: predis:ONE_TO_MANY},
                seller: {entity: Seller, fieldName: "seller", refCollection: "Seller", refMetaDataKey: "products", refFields: ["id"], joinFields: ["sellerId"], 'type: predis:ONE_TO_MANY}
            }
        },
        [CATEGORY]: {
            entityName: "Category",
            collectionName: "Category",
            fieldMetadata: {
                id: {fieldName: "id", fieldDataType: predis:INT},
                name: {fieldName: "name", fieldDataType: predis:STRING},
                description: {fieldName: "description", fieldDataType: predis:STRING},
                "product[].id": {relation: {entityName: "product", refField: "id", refFieldDataType: predis:INT}},
                "product[].name": {relation: {entityName: "product", refField: "name", refFieldDataType: predis:STRING}},
                "product[].description": {relation: {entityName: "product", refField: "description", refFieldDataType: predis:STRING}},
                "product[].price": {relation: {entityName: "product", refField: "price", refFieldDataType: predis:FLOAT}},
                "product[].availability": {relation: {entityName: "product", refField: "availability", refFieldDataType: predis:STRING}},
                "product[].categoryId": {relation: {entityName: "product", refField: "categoryId", refFieldDataType: predis:INT}},
                "product[].quantity": {relation: {entityName: "product", refField: "quantity", refFieldDataType: predis:INT}},
                "product[].rating": {relation: {entityName: "product", refField: "rating", refFieldDataType: predis:FLOAT}},
                "product[].totalSale": {relation: {entityName: "product", refField: "totalSale", refFieldDataType: predis:INT}},
                "product[].releaseDate": {relation: {entityName: "product", refField: "releaseDate", refFieldDataType: predis:DATE}},
                "product[].lastUpdated": {relation: {entityName: "product", refField: "lastUpdated", refFieldDataType: predis:TIME_OF_DAY}},
                "product[].sellerId": {relation: {entityName: "product", refField: "sellerId", refFieldDataType: predis:INT}}
            },
            keyFields: ["id"],
            refMetadata: {product: {entity: Product, fieldName: "product", refCollection: "Product", refFields: ["categoryId"], joinFields: ["id"], 'type: predis:MANY_TO_ONE}}
        }
    };

    public isolated function init() returns persist:Error? {
        redis:Client|error dbClient = new (connectionConfig);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [SELLER]: check new (dbClient, self.metadata.get(SELLER), cacheConfig.maxAge),
            [PRODUCT]: check new (dbClient, self.metadata.get(PRODUCT), cacheConfig.maxAge),
            [CATEGORY]: check new (dbClient, self.metadata.get(CATEGORY), cacheConfig.maxAge)
        };
    }

    isolated resource function get sellers(SellerTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "query"
    } external;

    isolated resource function get sellers/[int id](SellerTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "queryOne"
    } external;

    isolated resource function post sellers(SellerInsert[] data) returns int[]|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(SELLER);
        }
        _ = check redisClient.runBatchInsertQuery(data);
        return from SellerInsert inserted in data
            select inserted.id;
    }

    isolated resource function put sellers/[int id](SellerUpdate value) returns Seller|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(SELLER);
        }
        _ = check redisClient.runUpdateQuery(id, value);
        return self->/sellers/[id].get();
    }

    isolated resource function delete sellers/[int id]() returns Seller|persist:Error {
        Seller result = check self->/sellers/[id].get();
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(SELLER);
        }
        _ = check redisClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get products(ProductTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "query"
    } external;

    isolated resource function get products/[int id](ProductTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "queryOne"
    } external;

    isolated resource function post products(ProductInsert[] data) returns int[]|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PRODUCT);
        }
        _ = check redisClient.runBatchInsertQuery(data);
        return from ProductInsert inserted in data
            select inserted.id;
    }

    isolated resource function put products/[int id](ProductUpdate value) returns Product|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PRODUCT);
        }
        _ = check redisClient.runUpdateQuery(id, value);
        return self->/products/[id].get();
    }

    isolated resource function delete products/[int id]() returns Product|persist:Error {
        Product result = check self->/products/[id].get();
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PRODUCT);
        }
        _ = check redisClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get categories(CategoryTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "query"
    } external;

    isolated resource function get categories/[int id](CategoryTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "queryOne"
    } external;

    isolated resource function post categories(CategoryInsert[] data) returns int[]|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(CATEGORY);
        }
        _ = check redisClient.runBatchInsertQuery(data);
        return from CategoryInsert inserted in data
            select inserted.id;
    }

    isolated resource function put categories/[int id](CategoryUpdate value) returns Category|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(CATEGORY);
        }
        _ = check redisClient.runUpdateQuery(id, value);
        return self->/categories/[id].get();
    }

    isolated resource function delete categories/[int id]() returns Category|persist:Error {
        Category result = check self->/categories/[id].get();
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(CATEGORY);
        }
        _ = check redisClient.runDeleteQuery(id);
        return result;
    }

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}


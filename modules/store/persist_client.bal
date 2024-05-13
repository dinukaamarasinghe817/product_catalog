// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const SELLER = "sellers";
const PRODUCT = "products";
const CATEGORY = "categories";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [SELLER]: {
            entityName: "Seller",
            tableName: "Seller",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                email: {columnName: "email"},
                contactNumber: {columnName: "contactNumber"},
                address: {columnName: "address"},
                logoUrl: {columnName: "logoUrl"},
                "products[].id": {relation: {entityName: "products", refField: "id"}},
                "products[].name": {relation: {entityName: "products", refField: "name"}},
                "products[].description": {relation: {entityName: "products", refField: "description"}},
                "products[].price": {relation: {entityName: "products", refField: "price"}},
                "products[].availability": {relation: {entityName: "products", refField: "availability"}},
                "products[].categoryId": {relation: {entityName: "products", refField: "categoryId"}},
                "products[].quantity": {relation: {entityName: "products", refField: "quantity"}},
                "products[].rating": {relation: {entityName: "products", refField: "rating"}},
                "products[].totalSale": {relation: {entityName: "products", refField: "totalSale"}},
                "products[].releaseDate": {relation: {entityName: "products", refField: "releaseDate"}},
                "products[].lastUpdated": {relation: {entityName: "products", refField: "lastUpdated"}},
                "products[].sellerId": {relation: {entityName: "products", refField: "sellerId"}}
            },
            keyFields: ["id"],
            joinMetadata: {products: {entity: Product, fieldName: "products", refTable: "Product", refColumns: ["sellerId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        },
        [PRODUCT]: {
            entityName: "Product",
            tableName: "Product",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                description: {columnName: "description"},
                price: {columnName: "price"},
                availability: {columnName: "availability"},
                categoryId: {columnName: "categoryId"},
                quantity: {columnName: "quantity"},
                rating: {columnName: "rating"},
                totalSale: {columnName: "totalSale"},
                releaseDate: {columnName: "releaseDate"},
                lastUpdated: {columnName: "lastUpdated"},
                sellerId: {columnName: "sellerId"},
                "category.id": {relation: {entityName: "category", refField: "id"}},
                "category.name": {relation: {entityName: "category", refField: "name"}},
                "category.description": {relation: {entityName: "category", refField: "description"}},
                "seller.id": {relation: {entityName: "seller", refField: "id"}},
                "seller.name": {relation: {entityName: "seller", refField: "name"}},
                "seller.email": {relation: {entityName: "seller", refField: "email"}},
                "seller.contactNumber": {relation: {entityName: "seller", refField: "contactNumber"}},
                "seller.address": {relation: {entityName: "seller", refField: "address"}},
                "seller.logoUrl": {relation: {entityName: "seller", refField: "logoUrl"}}
            },
            keyFields: ["id"],
            joinMetadata: {
                category: {entity: Category, fieldName: "category", refTable: "Category", refColumns: ["id"], joinColumns: ["categoryId"], 'type: psql:ONE_TO_MANY},
                seller: {entity: Seller, fieldName: "seller", refTable: "Seller", refColumns: ["id"], joinColumns: ["sellerId"], 'type: psql:ONE_TO_MANY}
            }
        },
        [CATEGORY]: {
            entityName: "Category",
            tableName: "Category",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                description: {columnName: "description"},
                "product[].id": {relation: {entityName: "product", refField: "id"}},
                "product[].name": {relation: {entityName: "product", refField: "name"}},
                "product[].description": {relation: {entityName: "product", refField: "description"}},
                "product[].price": {relation: {entityName: "product", refField: "price"}},
                "product[].availability": {relation: {entityName: "product", refField: "availability"}},
                "product[].categoryId": {relation: {entityName: "product", refField: "categoryId"}},
                "product[].quantity": {relation: {entityName: "product", refField: "quantity"}},
                "product[].rating": {relation: {entityName: "product", refField: "rating"}},
                "product[].totalSale": {relation: {entityName: "product", refField: "totalSale"}},
                "product[].releaseDate": {relation: {entityName: "product", refField: "releaseDate"}},
                "product[].lastUpdated": {relation: {entityName: "product", refField: "lastUpdated"}},
                "product[].sellerId": {relation: {entityName: "product", refField: "sellerId"}}
            },
            keyFields: ["id"],
            joinMetadata: {product: {entity: Product, fieldName: "product", refTable: "Product", refColumns: ["categoryId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [SELLER]: check new (dbClient, self.metadata.get(SELLER), psql:MYSQL_SPECIFICS),
            [PRODUCT]: check new (dbClient, self.metadata.get(PRODUCT), psql:MYSQL_SPECIFICS),
            [CATEGORY]: check new (dbClient, self.metadata.get(CATEGORY), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get sellers(SellerTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get sellers/[int id](SellerTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post sellers(SellerInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(SELLER);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from SellerInsert inserted in data
            select inserted.id;
    }

    isolated resource function put sellers/[int id](SellerUpdate value) returns Seller|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(SELLER);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/sellers/[id].get();
    }

    isolated resource function delete sellers/[int id]() returns Seller|persist:Error {
        Seller result = check self->/sellers/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(SELLER);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get products(ProductTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get products/[int id](ProductTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post products(ProductInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PRODUCT);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from ProductInsert inserted in data
            select inserted.id;
    }

    isolated resource function put products/[int id](ProductUpdate value) returns Product|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PRODUCT);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/products/[id].get();
    }

    isolated resource function delete products/[int id]() returns Product|persist:Error {
        Product result = check self->/products/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PRODUCT);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get categories(CategoryTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get categories/[int id](CategoryTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post categories(CategoryInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CATEGORY);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from CategoryInsert inserted in data
            select inserted.id;
    }

    isolated resource function put categories/[int id](CategoryUpdate value) returns Category|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CATEGORY);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/categories/[id].get();
    }

    isolated resource function delete categories/[int id]() returns Category|persist:Error {
        Category result = check self->/categories/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CATEGORY);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    remote isolated function queryNativeSQL(sql:ParameterizedQuery sqlQuery, typedesc<record {}> rowType = <>) returns stream<rowType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    remote isolated function executeNativeSQL(sql:ParameterizedQuery sqlQuery) returns psql:ExecutionResult|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}


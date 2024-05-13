// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/time;

public enum AvailabilityStatus {
    IN_STOCK,
    OUT_OF_STOCK
}

public type Seller record {|
    readonly int id;
    string name;
    string email;
    string contactNumber;
    string address;
    string logoUrl;

|};

public type SellerOptionalized record {|
    int id?;
    string name?;
    string email?;
    string contactNumber?;
    string address?;
    string logoUrl?;
|};

public type SellerWithRelations record {|
    *SellerOptionalized;
    ProductOptionalized[] products?;
|};

public type SellerTargetType typedesc<SellerWithRelations>;

public type SellerInsert Seller;

public type SellerUpdate record {|
    string name?;
    string email?;
    string contactNumber?;
    string address?;
    string logoUrl?;
|};

public type Product record {|
    readonly int id;
    string name;
    string description;
    float price;
    AvailabilityStatus availability;
    int categoryId;
    int quantity;
    float rating;
    int totalSale;
    time:Date releaseDate;
    time:TimeOfDay lastUpdated;
    int sellerId;
|};

public type ProductOptionalized record {|
    int id?;
    string name?;
    string description?;
    float price?;
    AvailabilityStatus availability?;
    int categoryId?;
    int quantity?;
    float rating?;
    int totalSale?;
    time:Date releaseDate?;
    time:TimeOfDay lastUpdated?;
    int sellerId?;
|};

public type ProductWithRelations record {|
    *ProductOptionalized;
    CategoryOptionalized category?;
    SellerOptionalized seller?;
|};

public type ProductTargetType typedesc<ProductWithRelations>;

public type ProductInsert Product;

public type ProductUpdate record {|
    string name?;
    string description?;
    float price?;
    AvailabilityStatus availability?;
    int categoryId?;
    int quantity?;
    float rating?;
    int totalSale?;
    time:Date releaseDate?;
    time:TimeOfDay lastUpdated?;
    int sellerId?;
|};

public type Category record {|
    readonly int id;
    string name;
    string description;

|};

public type CategoryOptionalized record {|
    int id?;
    string name?;
    string description?;
|};

public type CategoryWithRelations record {|
    *CategoryOptionalized;
    ProductOptionalized[] product?;
|};

public type CategoryTargetType typedesc<CategoryWithRelations>;

public type CategoryInsert Category;

public type CategoryUpdate record {|
    string name?;
    string description?;
|};


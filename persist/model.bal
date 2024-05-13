import ballerina/persist as _;
import ballerina/time;

enum AvailabilityStatus {
    IN_STOCK,
    OUT_OF_STOCK
}

type Seller record {|
    readonly int id;
    string name;
    string email;
    string contactNumber;
    string address;
    string logoUrl;
    Product[] products;
|};

type Product record {|
    readonly int id;
    string name;
    string description;
    float price;
    AvailabilityStatus availability;
    Category category;
    int quantity;
    float rating;
    int totalSale;
    time:Date releaseDate;
    time:TimeOfDay lastUpdated;
	Seller seller;
|};

type Category record {|
    readonly int id;
    string name;
    string description;
	Product[] product;
|};

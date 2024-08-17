class Product {
  String? name;
  int? price;
  int? rating;
  String? description;

  Product({this.name, this.price, this.rating, this.description});
   Product.fromJson(json){
    name = json['name'];
    rating = json['rating'];
    price = json['price'];
    description = json['description'];
  }
}
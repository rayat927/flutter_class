class Product {
  String? name;
  int? price;
  int? rating;
  String? description;
  String? image;
  int? quantity;

  Product({this.name, this.price, this.rating, this.description, this.image, this.quantity});
   Product.fromJson(json){
    name = json['name'];
    rating = json['rating'];
    price = json['price'];
    description = json['description'];
    image = json['image_url'];
    quantity = 0;
  }
}
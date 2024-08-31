import 'package:flutter/material.dart';
import 'package:flutter_class2/components/Product.dart';

class ProductVM with ChangeNotifier{
  List list = [];

  add(image, name, price, rating, description, ){
    list.add(Product(image: image, name: name, price: price, rating: rating, description: description));
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List _cart = [];
  int cartQuantity = 0;

  List get cart => _cart;

  void addToCart(product){
    if(_cart.contains(product)){
      product.quantity++;
      cartQuantity++;
    }else{
      _cart.add(product);
      product.quantity++;
      cartQuantity++;
    }

    notifyListeners();
  }

  void removeFromCart(product){
    if(product.quantity > 0){

      product.quantity--;
      cartQuantity--;
    }

    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen
    );
  }


}
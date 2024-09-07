part of 'cart_bloc.dart';

 class CartState {
   List? cart = [];
   int? cartQuantity = 0;

   CartState({this.cart, this.cartQuantity});

   @override
   List get props => [cart, cartQuantity];
 }

class CartInitial extends CartState {

}
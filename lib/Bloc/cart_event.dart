part of 'cart_bloc.dart';

sealed class CartEvent {}

class AddToCart extends CartEvent {
  late final Product product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  late final Product product;
  RemoveFromCart(this.product);
}
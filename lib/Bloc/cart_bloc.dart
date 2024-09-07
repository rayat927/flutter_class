

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_class2/components/Product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
    CartBloc() : super(CartState(cart: [], cartQuantity: 0)) {
        on<AddToCart>((event, emit) {
            List cartCopy = state.cart!;

            if(state.cart!.contains(event.product)){
                event.product.quantity = event.product.quantity! + 1;

                var newCartQuantity = state.cartQuantity! + 1;
                emit(CartState(cart: cartCopy, cartQuantity: newCartQuantity));
            }else{
                cartCopy.add(event.product);
                event.product.quantity = event.product.quantity! + 1;
                var newCartQuantity = state.cartQuantity! + 1;
                emit(CartState(cart: cartCopy, cartQuantity: newCartQuantity));
            }
        });
        on<RemoveFromCart>((event, emit) {
            List cartCopy = state.cart!;
            var index = cartCopy.indexOf(event.product);
            if(cartCopy[index].quantity > 0){
            cartCopy[index].quantity--;
            var newCartQuantity = state.cartQuantity! - 1;
            emit(CartState(cart: cartCopy, cartQuantity: newCartQuantity));
        }
        });


    }


}

// @override
// Stream<CartState> mapEventToState(
//     event
//     ) async* {
//     if(event is AddToCart){
//         if(cart.contains(event.product)){
//             event.product.quantity = event.product.quantity! + 1;
//             cartQuantity++;
//         }else{
//             cart.add(event.product);
//             event.product.quantity = event.product.quantity! + 1;
//             cartQuantity++;
//         }
//     }
//     else if(event is RemoveFromCart){
//
//     }
// }
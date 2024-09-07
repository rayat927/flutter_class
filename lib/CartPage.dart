import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_class2/Bloc/cart_bloc.dart';
// import 'package:flutter_class2/Bloc/cart_event.dart';
import 'package:flutter_class2/Providers/CartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    // final cartList = provider.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),

      ),

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            children: state.cart!.map((el) {
              return Card(
                child: Column(
                  children: [
                    Text('${el.name}'),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          BlocProvider.of<CartBloc>(context).add(RemoveFromCart(el));
                        }, child: Text('minus')),
                        Text('${el.quantity}'),
                        ElevatedButton(onPressed: (){
                          BlocProvider.of<CartBloc>(context).add(AddToCart(el));
                        }, child: Text('add')),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          );
        }
      ),
    );
  }
}

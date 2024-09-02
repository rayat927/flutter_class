import 'package:flutter/material.dart';
import 'package:flutter_class2/Providers/CartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartList = provider.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),

      ),

      body: Column(
        children: cartList.map((el) {
          return Card(
            child: Column(
              children: [
                Text('${el.name}'),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      provider.removeFromCart(el);
                    }, child: Text('minus')),
                    Text('${el.quantity}'),
                    ElevatedButton(onPressed: (){
                      provider.addToCart(el);
                    }, child: Text('add')),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

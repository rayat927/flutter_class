import 'package:flutter/material.dart';
import 'package:flutter_class2/CartPage.dart';
import 'package:flutter_class2/Home.dart';
import 'package:flutter_class2/Profile.dart';
import 'package:flutter_class2/Providers/CartProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>  MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider())
        ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/cart': (context) => CartPage(),
        '/profile': (context) => Profile(),
      },
    ),
  );
}



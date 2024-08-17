import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_class2/Job.dart';
import 'package:flutter_class2/components/Product.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List products = [];

  void apiCall() async {
    final url = Uri.parse('http://68.178.163.174:5501/product');

    Response res = await get(url);

    if(res.statusCode == 201){
      List jsonData = jsonDecode(res.body);

      setState(() {
        products = jsonData.map((e) => Product.fromJson(e)).toList();
      });
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: products.map((i) {
              return Card(
                elevation: 3,
                child: Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Column(
                    children: [
                      Text('Product Name: ${i.name}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Product Description: ${i.description}'),
                      Text('Product Rating: ${i.rating}'),
                      Text('Product PRice: ${i.price} tk'),

                      SizedBox(height: 10,),

                      GestureDetector(
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Apply'),
                              Icon(Icons.done)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

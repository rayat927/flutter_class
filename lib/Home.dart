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


// import 'package:flutter/material.dart';
// import 'package:flutter2/components/CustomAppBar.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class FarmarPrfile extends StatefulWidget {
//   const FarmarPrfile({super.key});

//   @override
//   State<FarmarPrfile> createState() => _FarmarPrfileState();
// }

// class _FarmarPrfileState extends State<FarmarPrfile> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   final _formKey = GlobalKey<FormState>();

//   String _farmarName = '';
//   String _location = '';
//   String _address = '';
//   String _mobileNumber = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Farmar Info'),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     _showPicker(context);
//                   },
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Color(0xffFDCF09),
//                     child: _image != null
//                         ? ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: Image.file(
//                         _image!,
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.fitHeight,
//                       ),
//                     )
//                         : Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(50)),
//                       width: 100,
//                       height: 100,
//                       child: Icon(
//                         Icons.camera_alt,
//                         color: Colors.grey[800],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Farmar Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 // validator: (value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return 'Please enter farmar name';
//                 //   }
//                 //   return null;
//                 // },
//                 onSaved: (value) => _farmarName = value!,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Location',
//                   border: OutlineInputBorder(),
//                 ),

//                 onSaved: (value) => _location = value!,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Address',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _address = value!,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Mobile Number',
//                   border: OutlineInputBorder(),
//                 ),

//                 onSaved: (value) => _mobileNumber = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Save the form data to your database or API
//                     print('Form data: $_farmarName, $_location, $_address, $_mobileNumber');
//                   }
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Photo Library'),
//                       onTap: () {
//                         _imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   _imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         _image = null;
//       }
//     });
//   }

//   _imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         _image = null;
//       }
//     });
//   }
// }

// MultipartRequest request = MultipartRequest('POST', Uri.parse('http://68.178.163.174:5000/breeding/treatment'));
//
// // print(MultipartFile('file', imageFile!.readAsBytes().asStream(), imageFile!.lengthSync()));
//
//
// // request.files.add(MultipartFile('file', imageFile!.readAsBytes().asStream(), imageFile!.lengthSync(), filename: imageFile!.path.split('/').last));
// final uploadList = <MultipartFile>[];
// for (final imageFile in imageFiles!) {
// uploadList.add(
// await MultipartFile(
// 'files',
// imageFile!.readAsBytes().asStream(),
// imageFile.lengthSync(),
// filename: imageFile.path
//     .split('/')
//     .last,
// ),
// );
// }
//
// request.files.addAll(uploadList);
//
// Map<String, String> _fields = Map();
//
// _fields.addAll({
// 'shed_id': shed_id!,
// 'seat_id': seat_id!,
// 'cow_id': cow_id!,
// 'disease_desc': diseases_description.text,
// 'farm_id': farm_id!,
// });
//
// request.fields.addAll(_fields);
//
// StreamedResponse res = await request.send();
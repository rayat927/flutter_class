import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Map data = {};

  File? image;

  void getData() async {
    final url = Uri.parse('http://68.178.163.174:5501/user/?id=1');

    Response res = await get(url);
    print(res.body);

    setState(() {
      data = jsonDecode(res.body)[0];
    });
  }

  void chooseFromGallery() async {
    var image_picker = await ImagePicker();

    var file = await image_picker.pickImage(source: ImageSource.gallery);

    if(file != null){
      File? img = File(file.path);
       cropImageAndUpload(img);
      setState(() {
        image = img;
      });
    }
  }

  void cropImageAndUpload(File imageFile) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: imageFile.path);
    if(croppedImage == null) return null;
    var img = File(croppedImage.path);

    var request = MultipartRequest('PUT', Uri.parse('http://68.178.163.174:5501/user/profile_pic_update?id=1'));

    request.files.add(await MultipartFile.fromPath('image', img.path));

    StreamedResponse res = await request.send();

    print(res.statusCode);

    getData();
    // return File(croppedImage.path);
  }

  void updateProfile() async {
    var url = Uri.parse('http://68.178.163.174:5501/user/update?id=1');

    Map body = {
      'name': 'Admin Rayat',
      'email': 'admin@gmail.com'
    };

    Response res = await put(url, body: body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile edit'),
      ),

      body: SingleChildScrollView(
        child: data.isNotEmpty == true ? Column(
          children: [
            Stack(
              children: [

                Container(
                  margin: EdgeInsets.all(20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: data['profile_picture'] == null ? Image.asset('assets/defautl_pic.jpg') : Image.network('${data['profile_picture']}', fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                        chooseFromGallery();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),

                        child: Icon(CupertinoIcons.camera_circle_fill, )),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {
              updateProfile();
            }, child: Text('update'))

          ],
        ): CircularProgressIndicator(),
      ),
    );
  }
}

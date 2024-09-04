import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Map data = {};

  void getData() async {
    final url = Uri.parse('http://68.178.163.174:5501/user/?id=1');

    Response res = await get(url);
    print(res.body);

    setState(() {
      data = jsonDecode(res.body)[0];
    });
  }

  void updateProfilePic() async {

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
            )
          ],
        ): CircularProgressIndicator(),
      ),
    );
  }
}

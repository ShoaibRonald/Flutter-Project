import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shoaibronald/Login.dart';
import 'package:shoaibronald/Product.dart';
import 'package:uuid/uuid.dart';

import 'Addscreen.dart';
import 'BnB/main_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscreen (),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController name = TextEditingController();

  TextEditingController Gender = TextEditingController();

  TextEditingController Email = TextEditingController();

  TextEditingController Password = TextEditingController();

  bool isloading = false;

  File? imageFile;

  void imageUpload () async{
    setState((){
      isloading != isloading;
    });
    UploadTask uploadTask = FirebaseStorage.instance
    .ref()
    .child("UserImage")
    .child(const Uuid().v1())
    .putFile(imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String imgUrl = await taskSnapshot.ref.getDownloadURL();
    setState((){
      isloading != isloading;
    });

  }

  void adduser()async {
  var userid = const Uuid ().v1();
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email.text, password: Password.text);
    FirebaseFirestore.instance.collection("userData").doc(userid).set({
      "ID": userid,
      "name": name.text,
      "Email": Email.text,
      "Password": Password.text,

    });
  } catch (e) {
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black,
          )),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            controller: Gender,
            decoration: InputDecoration(hintText: "Gender"),
          ),
          TextFormField(
            controller: Email,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: Password,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen() ,));}, child: Text("Register")),
        ],
      ),
    ));
  }
}

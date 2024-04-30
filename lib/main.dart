import 'dart:convert';
import 'dart:developer';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Addscreen (),
    );
  }
}

class MyHome extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
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

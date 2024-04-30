import 'package:flutter/material.dart';
import 'package:shoaibronald/main.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:
    Container(margin: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        SizedBox(height: 10),
        TextFormField(controller: username, decoration: InputDecoration(hintText: "User ID"),),
        TextFormField(controller: Password, decoration: InputDecoration(hintText: "Password"),),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome(),));}, child: Text("Login")),

      ],
    ),),
    );
  }
}

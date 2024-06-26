import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoaibronald/main.dart';

class Addscreen extends StatefulWidget {
  Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {

  TextEditingController ProductName = TextEditingController();
  TextEditingController Price = TextEditingController();

  File? productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,

              ),
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              Positioned(
                  left: 300,
                  top: 180,
                  child: GestureDetector(
                    onTap: ()async{
                      XFile? SelectImage=await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(SelectImage != null){
                        File convertedImage = File(SelectImage.path);
                        setState(() {
                          productImage = convertedImage;
                        });
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(8),

                      ),
                        child: Icon(Icons.add,color: Colors.white,)
                    ),
                  ),
              )
            ],
          ),
          TextFormField(
            controller: ProductName,
            decoration: InputDecoration(hintText: "product"),
          ),
          TextFormField(
            controller: Price,
            decoration: InputDecoration(hintText: "price"),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoaibronald/BnB/Cart.dart';
import 'package:shoaibronald/BnB/Contact.dart';
import 'package:shoaibronald/BnB/Home.dart';
import 'package:shoaibronald/BnB/Product.dart';

class myscreen extends StatefulWidget {
  const myscreen({super.key});

  @override
  State<myscreen> createState() => _myscreenState();
}

class _myscreenState extends State<myscreen> {

  int currentIndex = 0;

  void pageshifter(index){
    setState(() {
      currentIndex = index;
    });
  }
  List<Widget> myscreens = [
    Home_screen(),
    Product_screen(),
    Contact_screen(),
    Cart_screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myscreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: pageshifter,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}


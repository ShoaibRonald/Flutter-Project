import 'package:flutter/material.dart';

class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   GridView.count(
          crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 250/300,
        children: List.generate(10, (index) => Container(
          width: 200,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("data:image/jpeg;base64,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"))
                ),
              ),
              Text("Iphone 15 pro max"),
              Text("150.00"),
              ElevatedButton(onPressed: (){}, child: Text("View Details"))
            ],
          ),
        )),
      ),
    );
  }
}

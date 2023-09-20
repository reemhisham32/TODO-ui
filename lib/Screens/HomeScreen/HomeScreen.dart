import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 10
      ),
      height: 100,
      width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.blue,
      ) ,
      child: Text("TO DO List",style:TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.white) ,),


    )
  ],
),
    );
  }
}

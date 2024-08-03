import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food.dart';

class DetailFood extends StatefulWidget {
  const DetailFood({super.key, required this.food});

  final Food food;

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
           child: Image.asset(
            widget.food.imagePath.toString(),
            fit: BoxFit.cover,
           ),

          )
        ],
      ),
    );
  }
}
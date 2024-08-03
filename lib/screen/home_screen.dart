import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../models/food.dart';
import 'detail_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> food = [];

  Future<void> loadFoodData() async {
    String jsonData = await rootBundle.loadString('assets/json/food.json');
    List<dynamic> jsonMap = json.decode(jsonData);
    setState(() {
      food = jsonMap.map((json) => Food.fromJson(json)).toList();
    });
    print(food[0].name);
  }

  @override
  void initState() {
    loadFoodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sushiman',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 15),
                Text('Jakarta, Indonesia',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
                height: 200,
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage('assets/images/sushi2.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken))),
                child: Stack(
                  children: [
                    const Text('Get Promo 70%\nSushi Nigiri',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
                    Positioned(
                      bottom: 0,
                      child: CupertinoButton(
                        color: Colors.red.withOpacity(0.8),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Redeem'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 12,
          ),

          //search bar
          SearchBar(
            hintText: 'Search Food',
            hintStyle: WidgetStateProperty.all(const TextStyle(
              color: Colors.grey,
            )),
            leading: const Icon(CupertinoIcons.search),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
            elevation: WidgetStateProperty.all(0),
          ),

          const SizedBox(
            height: 12,
          ),

          //best seller
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Best Seller',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            food[2].imagePath.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                                Colors.transparent
                              ])),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food[2].name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              '${food[2].price} IDR',
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),

         //Popular Food
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular Food',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: food.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailFood(
                            food: food[index],
                          );
                        }));
                      },
                      child: Container(
                        width: 140,
                        margin: EdgeInsets.only(
                          left: index == 0 ? 0 : 0,
                          right: 10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.only(right: 16),
                              color: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  food[index].imagePath.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              food[index].name.toString(),
                               overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14
                        
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${food[index].price} IDR',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold 
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              
            ],
          ),
        
        ],
      ),
    );
  }
}

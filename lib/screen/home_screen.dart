import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        ],
      ),
    );
  }
}

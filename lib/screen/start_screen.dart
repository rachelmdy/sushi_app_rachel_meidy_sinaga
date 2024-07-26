import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sushi_app/screen/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Sushiman',
            style: TextStyle(color: Colors.white, fontSize: 35)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/sushi.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text('JAPANESE TASTE OF JAPANASE FOOD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const Text(
                    'feel the taste of the most popular japanese food from anywhere and anytime',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(20),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Started'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

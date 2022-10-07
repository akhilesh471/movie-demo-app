
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_app/view/dummy_screen/dummy_screen.dart';
import 'package:demo_app/view/homescreen/homepage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  final screen=[HomePage(),DummyScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.black,
        index: selectedindex,
        items: [
          navicons(Icons.home),
          navicons(Icons.favorite_rounded,)
        ],onTap: (index){
        // setState(() {
        //     selectedindex=index;
        // });
          },
      ),
      body: screen[selectedindex],
    );
  }

  Icon navicons(IconData icn) {
    return Icon(icn,
          size: 30,
        );
}
}
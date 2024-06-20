import 'package:e_commerce_app/presentation/home_page.dart';
import 'package:e_commerce_app/presentation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final displays = [HomePage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: displays[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: GNav(
            tabBackgroundColor: Colors.blue.shade400,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            iconSize: 35,
            padding: const EdgeInsets.all(8),
            gap:10,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'PRODUCTS',
              ),
              GButton(
                icon: Icons.description,
                text: 'CHECKOUT',
              ),

            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

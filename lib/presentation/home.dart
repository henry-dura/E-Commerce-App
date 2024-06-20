
import 'package:e_commerce_app/presentation/home_page.dart';
import 'package:flutter/material.dart';


class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white,fontSize: 18))
          // MaterialStateProperty.resolveWith<TextStyle>(
          //       (Set<MaterialState> states) => states.contains(MaterialState.selected)
          //       ? const TextStyle(color: Colors.white,fontSize: 18)
          //       : const TextStyle(color: Colors.black),
          // ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Colors.black,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.pinkAccent,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              // selectedIcon: Icon(Icons.home),
              icon: Text('Product',style: TextStyle(color: Colors.white),),
              label: 'Home',
              tooltip: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Business',
              tooltip: 'Business',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: 'School',
              tooltip: 'School',
            ),
          ],
        ),
      ),
      body: <Widget>[
        const HomePage(),
        const Text('second'),
        const Text('Third')
      ][currentPageIndex],
    );
  }
}
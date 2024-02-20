import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petshop_app/screens/catalog_details.dart';
import 'package:flutter_petshop_app/screens/catalog_page.dart';
import '../app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = <Widget>[
    HomePageContent(),
    CatalogPage(),
    CatalogDetails(),
    //Text('Cart Placeholder'),
    Text('Profile Placeholder'),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Store'),
          //   centerTitle: true,
          //   surfaceTintColor: Colors.transparent,
          // ),
          body: Center(
            child: widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.book_fill),
                  label: 'Catalog',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart_fill),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_circle_fill),
                  label: 'Profile',
                ),
              ],
              currentIndex: selectedIndex,
              unselectedItemColor: darkGrey,
              selectedItemColor: goldYellow,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 12.0,
              iconSize: 30,
              onTap: onItemTapped,
            ),
          )),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Placeholder(child: Text('Home Page Placeholder'))],
      ),
    );
  }
}

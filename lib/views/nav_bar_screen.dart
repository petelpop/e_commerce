

import 'package:e_commerce/views/cart/cart_screen.dart';
import 'package:e_commerce/views/favorite_screen.dart';
import 'package:e_commerce/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 2;
  List screens = const [
              Scaffold(),
              FavoriteScreen(),
              HomeScreen(),
              CartScreen(),
              Scaffold()
            ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffff660e),
        child: const Icon(Icons.home,
        color: Colors.white,
        size: 35
        ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (){
          setState(() {
            currentIndex = 0;
          });
              }, 
              icon: Icon(
                currentIndex == 0 ? Icons.grid_view_sharp : Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
            IconButton(
              onPressed: (){
          setState(() {
            currentIndex = 1;
          });
              }, 
              icon: Icon(
                currentIndex == 1 ? Icons.favorite:Icons.favorite_border ,
                size: 30,
                color: currentIndex == 1 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
                SizedBox(width: 14),
            IconButton(
              onPressed: (){
          setState(() {
            currentIndex = 3;
          });
              }, 
              icon: Icon(
                currentIndex == 3 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 3 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
            IconButton(
              onPressed: (){
          setState(() {
            currentIndex = 4;
          });
              }, 
              icon: Icon(
                currentIndex == 4 ? Icons.person : Icons.person_outline,
                size: 30,
                color: currentIndex == 4 ? Color(0xffff660e):Colors.grey.shade400,
                )
                )
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
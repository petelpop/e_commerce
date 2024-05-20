import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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
              onPressed: (){}, 
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
                SizedBox(width: 14),
            IconButton(
              onPressed: (){}, 
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 2 ? Color(0xffff660e):Colors.grey.shade400,
                )
                ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 3 ? Color(0xffff660e):Colors.grey.shade400,
                )
                )
          ],
        ),
      ),
    );
  }
}
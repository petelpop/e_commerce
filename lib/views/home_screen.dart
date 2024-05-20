import 'package:e_commerce/widget/home_app_bar.dart';
import 'package:e_commerce/widget/search_bar.dart';
import 'package:e_commerce/widget/slider_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const CustomAppBar(),
              const SizedBox(height: 20),
              const CustomSearchBar(),
              const SizedBox(height: 20),
              ImageSlider(currentSlide: currentSlider, 
              onChange: (value){
                setState(() {
                  currentSlider = value;
                });
              })


            ],
          ),
        ),
      ),
    );
  }
}
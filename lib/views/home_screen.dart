import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/widget/category.dart';
import 'package:e_commerce/widget/home_app_bar.dart';
import 'package:e_commerce/widget/product_card.dart';
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
              _imageSlider(),
              const SizedBox(height: 20),
              const Categories(),
              _specialForYou(),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2, 
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                  ), 
                  itemCount: productList.length,
                itemBuilder: (context, index){
                  return ProductCard(product: productList[index]);
                })
            ],
          ),
        ),
      ),
    );
  }

  Row _specialForYou() {
    return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special For You",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54
                    ),
                  ),
              ],
            );
  }

  ImageSlider _imageSlider() {
    return ImageSlider(currentSlide: currentSlider, 
            onChange: (value){
              setState(() {
                currentSlider = value;
              });
            });
  }
}
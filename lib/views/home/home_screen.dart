import 'package:e_commerce/model/category.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/views/home/widget/home_app_bar.dart';
import 'package:e_commerce/views/home/widget/product_card.dart';
import 'package:e_commerce/views/home/widget/search_bar.dart';
import 'package:e_commerce/views/home/widget/slider_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      productList,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];

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
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedIndex == index
                                ? Color(0xffff660e)
                                : Colors.transparent),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          categoriesList[index].image),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              categoriesList[index].title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _specialForYou(),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: selectedCategories[selectedIndex].length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: selectedCategories[selectedIndex][index]);
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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        Text(
          "See All",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  ImageSlider _imageSlider() {
    return ImageSlider(
        currentSlide: currentSlider,
        onChange: (value) {
          setState(() {
            currentSlider = value;
          });
        });
  }
}

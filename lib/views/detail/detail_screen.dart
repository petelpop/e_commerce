import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/views/detail/widget/app_bar.dart';
import 'package:e_commerce/views/detail/widget/image_slider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const DetailAppBar(),
            DetailImageSlider(
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                image: widget.product.image),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => AnimatedContainer(
                          duration: const Duration(microseconds: 300),
                          width: currentImage == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentImage == index
                                  ? Colors.black
                                  : Colors.transparent,
                              border: Border.all(color: Colors.black)),
                        ))),
            
          ],
        ),
      ),
    );
  }
}

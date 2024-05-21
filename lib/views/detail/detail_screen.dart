import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/views/detail/widget/addto_cart.dart';
import 'package:e_commerce/views/detail/widget/app_bar.dart';
import 'package:e_commerce/views/detail/widget/description.dart';
import 'package:e_commerce/views/detail/widget/image_slider.dart';
import 'package:e_commerce/views/detail/widget/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            const DetailAppBar(),
            Hero(
              tag: widget.product.image,
              child: DetailImageSlider(
                  onChange: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  image: widget.product.image),
            ),
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
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetails(product: widget.product),
                  const SizedBox(height: 20),
                  const Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 20),
                  _listColors(),
                  const SizedBox(height: 20),
                  DetailDescription(text: widget.product.description)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _listColors() {
    return Row(
                  children: 
                    List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: currentColor == index ? Colors.white : widget.product.colors[index],
                                    shape: BoxShape.circle,
                                    border: currentColor == index ? Border.all(color: widget.product.colors[index]) : null
                                  ),
                                  padding: currentColor == index ? const EdgeInsets.all(2) : null,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: widget.product.colors[index],
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                            )
                            ),
                );
  }
}

import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetails extends StatelessWidget {
  final Product product;

  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffff660e)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      product.review,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Text.rich(
                TextSpan(
                  children: [
                TextSpan(
                  text: "Seller : ", 
                  style: TextStyle(
                    fontSize: 16
                    )
                  ),
                  TextSpan(
                  text: product.seller, 
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                    )
                  )
                  ]
                  )
                )
          ],
        )
      ],
    );
  }
}

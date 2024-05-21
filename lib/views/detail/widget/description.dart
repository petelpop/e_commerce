import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  final String text;

  const DetailDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xffff660e),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            Text(
                "Specifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            Text(
                "Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          text, 
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,

         )
        )
      ],
    );
  }
}
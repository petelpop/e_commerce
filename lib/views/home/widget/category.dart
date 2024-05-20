import 'package:e_commerce/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:AssetImage(categoriesList[index].image),
                    fit: BoxFit.cover 
                    )
                ),
              ),
              const SizedBox(height: 5),
              Text(
                categoriesList[index].title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20)
        ),
    );
  }
}
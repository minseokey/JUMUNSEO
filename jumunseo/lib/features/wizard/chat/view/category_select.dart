import 'package:flutter/material.dart';
import 'package:just_ham/config/theme/app_color.dart';

class Category extends StatelessWidget {
  final String imageName;
  final String categoryName;

  const Category(
    this.imageName,
    this.categoryName,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: AssetImage(imageName), radius: 24.0,)
          ),
          Text(categoryName, style: const TextStyle(color: ColorStyles.mainColor, fontSize: 12.0, fontWeight: FontWeight.bold),),
      ],),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/wizard/chat/view/category_select.dart';
import 'package:jumunseo/features/wizard/chat/view/gradient_button.dart';

import '../cubit/wizard_cubit.dart';

class CategoryView extends StatefulWidget{
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> images = ['assets/images/categories/1.png',
                        'assets/images/categories/2.png',
                        'assets/images/categories/3.png',
                        'assets/images/categories/4.png',
                        'assets/images/categories/5.png',
                        'assets/images/categories/6.png',
                        'assets/images/categories/7.png',
                        'assets/images/categories/8.png',
                        'assets/images/categories/9.png',
                        'assets/images/categories/10.png',
                        'assets/images/categories/11.png',
                        'assets/images/categories/12.png',
                        'assets/images/categories/13.png',
                        'assets/images/categories/14.png',
                        'assets/images/categories/15.png',
                        'assets/images/categories/16.png',];
  List<String> names = ['카테고리1','카테고리2','카테고리3','카테고리4',
                        '카테고리1','카테고리2','카테고리3','카테고리4',
                        '카테고리1','카테고리2','카테고리3','카테고리4',
                        '카테고리1','카테고리2','카테고리3','카테고리4',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "카테고리를 선택해주세요!",
          style: TextStyle(
            color: ColorStyles.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                itemCount: images.length,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12.0, crossAxisCount: 2, crossAxisSpacing: 12.0, childAspectRatio: (158 / 90),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTapUp: (details) {
                      setState(() {
                        context.read<WizardCubit>().setCateogry(names[index]);
                      });
                    },
                    child: Category(images[index], names[index])
                  );
                })
              ),
            ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        onButtonPress: () {context.read<WizardCubit>().toWhen(context); },
                        message: 'Continue',
                      ),
                    ),
                  ]
                ),
              ),
              const Blank(0, 20),
            ],
          ),
        ]
      ),
    );
  }
}
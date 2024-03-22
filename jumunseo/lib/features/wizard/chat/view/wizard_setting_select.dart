import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WizardSet extends StatelessWidget {
  final String imageName;
  final String setName;
  final List<String> setList;

  const WizardSet(
    this.imageName,
    this.setName,
    this.setList,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Column(
            children: [
              ExtendedImage.asset(imageName, width: 24.0, height: 24.0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  setName,
                  style: const TextStyle(
                    color: Color.fromARGB(0xff, 0x3f, 0x3f, 0x3f),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          children: List.generate(setList.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0xff, 0xf4, 0xf4, 0xf4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.5),
                    child: Text(
                      setList[index],
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        )
    ],);
  }
}
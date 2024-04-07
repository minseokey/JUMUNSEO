import 'package:flutter/material.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';

class WizardMenu extends StatelessWidget {
  const WizardMenu({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorStyles.mainColor,
            ColorStyles.secondMainColor,
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("마법사", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),),
            Blank(0, 5),
            Text("마이크로 법률 사무소", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0),),
            Blank(0, 26),
            Text("법적인 문제를 해결해 드립니다.", style: TextStyle(color: Colors.white, fontSize: 12.0),),
          ],
        ),
      ),
    );
  }
}
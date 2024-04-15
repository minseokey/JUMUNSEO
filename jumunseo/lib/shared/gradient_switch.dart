import 'package:flutter/material.dart';
import 'package:jumunseo/config/theme/app_color.dart'; 

// You can also use stateful builder instead of stateful widget 
class GradientSwitch extends StatefulWidget { 
  const GradientSwitch({Key? key}) : super(key: key); 

  @override 
  State<GradientSwitch> createState() => _GradientSwitchState(); 
} 

class _GradientSwitchState extends State<GradientSwitch> { 
  bool isSwitchOn = false; 
  @override 
  Widget build(BuildContext context) { 
    return GestureDetector( 
      onTap: () { 
        setState(() { 
          isSwitchOn = !isSwitchOn; 
        }); 
      }, 

      child: Stack( 
        alignment: 
          isSwitchOn ? Alignment.centerRight : Alignment.centerLeft, 
        children: [ 
          Container(  
            width: 70, 
            height: 40, 
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient( 
              colors: isSwitchOn 
                ? [ 
                  ColorStyles.mainColor, 
                  ColorStyles.secondMainColor, 
                  ] 
                : [Colors.grey, Colors.grey], 
              ), 
              borderRadius: 
                const BorderRadius.all(Radius.circular(40)), 
            ), 
          ), 
          Container( 
            height: 40, 
            width: 40, 
            decoration: const BoxDecoration( 
              shape: BoxShape.circle, color: Colors.white
            ), 
          ), 
        ], 
      ), 
    );
  } 
}

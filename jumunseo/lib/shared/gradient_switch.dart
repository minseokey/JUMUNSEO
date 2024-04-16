import 'package:flutter/material.dart';
import 'package:jumunseo/config/theme/app_color.dart'; 

// You can also use stateful builder instead of stateful widget 
class GradientSwitch extends StatefulWidget { 
  final bool isSwitchOn;
  final ValueChanged<bool> onChange;

  const GradientSwitch({
    Key? key,
    required this.isSwitchOn,
    required this.onChange,
  }) : super(key: key); 

  @override 
  State<GradientSwitch> createState() => _GradientSwitchState(); 
} 

class _GradientSwitchState extends State<GradientSwitch> {
  @override 
  Widget build(BuildContext context) { 
    return GestureDetector( 
      onTap: () { 
        widget.onChange(!widget.isSwitchOn);
      }, 
      child: Stack(
        children: [ 
          AnimatedContainer(  
            width: 70, 
            height: 40,
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient( 
              colors: widget.isSwitchOn 
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
          AnimatedPositioned(
            left: widget.isSwitchOn? 30 : 0,
            duration: const Duration(milliseconds: 200),
            child: Container( 
              height: 40, 
              width: 40, 
              decoration: const BoxDecoration( 
                shape: BoxShape.circle, color: Colors.white
              ), 
            ),
          ), 
        ], 
      ), 
    );
  } 
}

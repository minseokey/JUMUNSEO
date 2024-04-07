import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DilemmaChatScreen extends StatefulWidget {
  const DilemmaChatScreen({super.key});

  @override
  State<DilemmaChatScreen> createState() => _DilemmaChatScreenState();
}

class _DilemmaChatScreenState extends State<DilemmaChatScreen> {
  @override
  Widget build(BuildContext context) {
    LottieComposition? composition;
    return Scaffold(
      appBar: AppBar(
        title: const Text('토론방'),
      ),
      body: Center(
        child: RotatedBox(
            quarterTurns: 1,
            child: Lottie.asset(
              'assets/animations/punch_lottie.json',
              repeat: false,
              onLoaded: (p0) {},
            )),
      ),
    );
  }
}

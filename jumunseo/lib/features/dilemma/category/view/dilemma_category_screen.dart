import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:lottie/lottie.dart';

class DilemmaCategoryScreen extends StatefulWidget {
  const DilemmaCategoryScreen({super.key});

  @override
  State<DilemmaCategoryScreen> createState() => _DilemmaCategoryScreenState();
}

class _DilemmaCategoryScreenState extends State<DilemmaCategoryScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('토론방'),
      ),
      body: Center(
        child: RotatedBox(
            quarterTurns: 1,
            child: Lottie.asset(
              'assets/animations/punch_lottie.json',
              controller: _controller,
              repeat: false,
              onLoaded: (composition) {
                logger.d(composition.duration);
                _controller
                  ..duration = const Duration(seconds: 2)
                  ..forward(from: 0.4).whenComplete(() => {context.pop()});
              },
            )),
      ),
    );
  }
}

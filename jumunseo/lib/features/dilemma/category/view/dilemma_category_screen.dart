import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/dilemma/category/bloc/dilemma_category_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:yoda/yoda.dart';

class DilemmaCategoryScreen extends StatefulWidget {
  const DilemmaCategoryScreen({super.key});

  @override
  State<DilemmaCategoryScreen> createState() => _DilemmaCategoryScreenState();
}

class _DilemmaCategoryScreenState extends State<DilemmaCategoryScreen> {
  late final YodaController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YodaController()..addStatusListener((status, context) {});
    Timer.periodic(Duration(seconds: 2), (timer) {
      _controller.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DilemmaCategoryBloc, DilemmaCategoryState>(
      listener: (context, state) {
        if (state.status == DilemmaCategoryStatus.loading) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return LoadingAnimationWidget.discreteCircle(
                  color: Colors.white, size: 100.0);
            },
          );
          context.read<DilemmaCategoryBloc>().add(DilemmaCategoryLoaded());
        }
      },
      builder: (BuildContext context, DilemmaCategoryState state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Yoda(
                yodaEffect: YodaEffect.Explosion,
                controller: _controller,
                animParameters: AnimParameters(
                    yodaBarrier: const YodaBarrier(),
                    fractionalCenter: const Offset(0.5, 1.0),
                    hTiles: 20,
                    vTiles: 20,
                    effectPower: 0,
                    gravity: 2,
                    blurPower: 0,
                    randomness: 80),
                child: TextButton(
                    onPressed: () {
                      context
                          .read<DilemmaCategoryBloc>()
                          .add(DilemmaCategoryLoadingDialog());
                    },
                    child: Text('loading dialog')),
              )
            ],
          ),
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

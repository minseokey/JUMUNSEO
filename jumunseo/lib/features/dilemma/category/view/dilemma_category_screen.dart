import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/dilemma/category/bloc/dilemma_category_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DilemmaCategoryScreen extends StatefulWidget {
  const DilemmaCategoryScreen({super.key});

  @override
  State<DilemmaCategoryScreen> createState() => _DilemmaCategoryScreenState();
}

class _DilemmaCategoryScreenState extends State<DilemmaCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DilemmaCategoryBloc, DilemmaCategoryState>(
      builder: (BuildContext context, DilemmaCategoryState state) {
        return Scaffold(
          body: Column(
            children: [
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: LoadingAnimationWidget.discreteCircle(
                                color: Colors.blue, size: 200.0),
                          );
                        });
                  },
                  child: Text('loading dialog'))
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

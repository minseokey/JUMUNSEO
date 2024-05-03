import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/home/home.dart';
import 'package:jumunseo/features/auth/auth.dart';

class DilemmaScreen extends StatefulWidget {
  const DilemmaScreen({super.key});

  @override
  State<DilemmaScreen> createState() => _DilemmaScreenState();
}

class _DilemmaScreenState extends State<DilemmaScreen> {
  @override
  Widget build(BuildContext context) {
    final int test = context.select((HomeCubit bloc) => bloc.state.testNum);
    final testIsLogin =
        context.select((AuthCubit cubit) => cubit.state.isLogin);
    return Scaffold(
      appBar: AppBar(
        title: const Text('토론방'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('토론방 로그인 상태 : $testIsLogin'),
            Text('$test'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<HomeCubit>().testIncrement(context);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

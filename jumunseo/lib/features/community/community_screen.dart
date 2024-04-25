import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/home/cubit/home_cubit.dart';
import 'package:jumunseo/features/login/cubit/login_cubit.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    final test = context.select((HomeCubit bloc) => bloc.state.testNum);
    final testIsLogin =
        context.select((LoginCubit cubit) => cubit.state.isLogin);
    return Scaffold(
      appBar: AppBar(
        title: const Text('커뮤니티'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('커뮤니티 로그인 상태 : $testIsLogin'),
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

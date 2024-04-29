import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/login/cubit/login_cubit.dart';

class JoinView extends StatelessWidget {
  const JoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('회원가입'),
        ),
        body: Column(
          children: [
            
          ],
        ),
      ),
      onWillPop: () async {
        context.read<LoginCubit>().disposeJoin();
        return true;
      },
    );
  }
}

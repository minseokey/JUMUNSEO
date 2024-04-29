import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/login/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient( 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            ColorStyles.mainColor,
            ColorStyles.secondMainColor
          ], 
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Column(
          children: [
            const DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              child: Text('주문서(Jumunseo)'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 70, right: 70),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            context.read<LoginCubit>().login();
                            context.read<LoginCubit>().goToHome(context);
                          },
                          child: const Text('주문서 계정으로 로그인하기'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            context.read<LoginCubit>().guestLogin();
                            context.read<LoginCubit>().goToHome(context);
                          },
                          child: const Text('둘러보기'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        child: Text('아직 계정이 없으신가요?'),
                      ),
                      TextButton(
                        onPressed: (){
                          context.read<LoginCubit>().goToJoin(context);
                        }, 
                        child: const DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.white, fontSize: 12, 
                            decoration: TextDecoration.underline,
                          ),
                          child: Text(
                            '회원가입',
                          ),
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

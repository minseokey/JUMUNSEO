import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/login/cubit/login_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('회원가입'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: '이메일',
                        hintText: "이메일을 입력해 주세요.",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: '비밀번호',
                        hintText: "비밀번호를 입력해 주세요.",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  TextField(
                    controller: rePasswordController,
                    decoration: const InputDecoration(
                      labelText: '비밀번호 확인',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: ColorStyles.mainColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().signUp(context);
                      },
                      child: const Text('회원가입'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        context.read<LoginCubit>().disposeJoin();
        return true;
      },
    );
  }
}

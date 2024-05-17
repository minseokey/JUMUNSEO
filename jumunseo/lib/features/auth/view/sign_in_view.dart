import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/auth/cubit/auth_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    ValueNotifier<bool> loading = ValueNotifier<bool>(false);
    ValueNotifier<bool> signInSuccess = ValueNotifier<bool>(true);

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('로그인'),
        ),
        body: ValueListenableBuilder<bool>(
          valueListenable: loading,
          builder: (BuildContext context, bool value, Widget? child) {
            if(value) {
              return const Center(child: CircularProgressIndicator());
            } 
            else {
              return GestureDetector(
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
                      ValueListenableBuilder(valueListenable: signInSuccess, builder: (context, value, child) {
                        if(!value) {
                          return const Text(
                            '이메일을 확인해 주세요',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        }
                        else {
                          return const Blank(0, 0);
                        }
                      },),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
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
                        ),
                      ),
                      ValueListenableBuilder(valueListenable: signInSuccess, builder: (context, value, child) {
                        if(!value) {
                          return const Text(
                            '비밀번호를 확인해 주세요',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        }
                        else {
                          return const Blank(0, 0);
                        }
                      },),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().login(context, emailController.text, passwordController.text)
                            .then((value) {
                              if(value != null){
                                if(value) {
                                  loading.value = true;
                                }
                                
                                signInSuccess.value = value;
                              }
                            });
                          },
                          child: const Text('로그인'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            }
          }
        ),
      ),
      onWillPop: () async {
        context.read<AuthCubit>().disposeSignIn();
        return true;
      },
    );
  }
}

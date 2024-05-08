import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/auth/cubit/auth_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  ValueNotifier<int> duplicate = ValueNotifier<int>(0);
  ValueNotifier<bool> passwordOk = ValueNotifier<bool>(true);
  ValueNotifier<bool> nameOk = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Row(
                      children: [
                        Expanded(
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
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().duplicateEmail(emailController.text)
                            .then((value) {
                              if(value) {
                                duplicate.value = 1;
                              }
                              else {
                                duplicate.value = 2;
                              }
                            });
                          },
                          child: const Text('중복 검사'),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder<int> (
                    valueListenable: duplicate,
                    builder: (context, value, child) {
                      if(value == 0) {
                        return const Blank(0, 0);
                      }
                      else if(value == 1) {
                        return const Text(
                          '중복된 이메일입니다.',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        );
                      }
                      else{
                        return const Text(
                          '사용 가능한 이메일입니다.',
                          style: TextStyle(
                            color: ColorStyles.mainColor,
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: '닉네임',
                        hintText: "닉네임을 입력해 주세요.",
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
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  ValueListenableBuilder(valueListenable: nameOk, builder: (context, value, child) {
                    if(!value) {
                      return const Text(
                        '닉네임을 입력해 주세요.',
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
                  ValueListenableBuilder(valueListenable: passwordOk, builder: (context, value, child) {
                    if(!value) {
                      return const Text(
                        '비밀번호를 확인해 주세요.',
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
                    child: ValueListenableBuilder<int>(
                      valueListenable: duplicate,
                      builder: (context, value, child) {
                        if(value == 0 || value == 1) {
                          return const ElevatedButton(
                            onPressed: null,
                            child: Text('회원가입'),
                          );
                        }
                        else {
                          return ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().signUp(
                                context, 
                                nameController.text, 
                                emailController.text, 
                                passwordController.text, 
                                rePasswordController.text
                              )
                              .then((value) {
                                if(value == 0) {
                                  passwordOk.value = true;
                                  nameOk.value = true;
                                }
                                else if(value == 1){
                                  passwordOk.value = true;
                                  nameOk.value = false;
                                }
                                else if(value == 2) {
                                  passwordOk.value = false;
                                  nameOk.value = true;
                                }
                                else {
                                  //서버 오류
                                }
                              });
                            },
                            child: const Text('회원가입'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        context.read<AuthCubit>().disposeJoin();
        return true;
      },
    );
  }
}
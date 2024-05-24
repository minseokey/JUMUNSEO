import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/auth/cubit/auth_cubit.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController nameController = TextEditingController();
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
          title: const Text('프로필 수정'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
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
                  TextField(
                    controller: rePasswordController,
                    obscureText: true,
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
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().editProfile(
                          context, 
                          nameController.text, 
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
                      child: const Text('수정하기'),
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
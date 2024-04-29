import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/login_status.dart';
import 'package:jumunseo/features/login/view/login_ask_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(
            email: '', password: '', error: '', isLogin: LoginStatus.isLogin));

  bool checkLogin() {
    return state.isLogin;
  }

  void signUp(BuildContext context) {
    context.pop();
  }

  void login() {
    LoginStatus.isLogin = true;
    emit(state.copyWith(isLogin: LoginStatus.isLogin));
  }

  void guestLogin() {
    LoginStatus.isGeust = true;
  }

  void askToLogin(BuildContext context) {
    //show dialog if you want to login
    showDialog(context: context, builder: (context) => loginAskDialog(context));
  }

  void goToHome(BuildContext context) {
    context.go('/');
  }

  void goTologin(BuildContext context) {
    context.pop();
    context.push('/auth');
  }

  void goToJoin(BuildContext context) {
    LoginStatus.joining = true;
    context.push('/auth/signUp');
  }

  void disposeJoin() {
    LoginStatus.joining = false;
  }
  
  // void loginWithCredentials() async {
  //   emit(state.copyWith(status: FormStatus.loading));
  //   try {
  //     await _authRepository.loginWithEmailAndPassword(
  //       email: state.email,
  //       password: state.password,
  //     );
  //     emit(state.copyWith(status: FormStatus.success));
  //   } on Exception catch (e) {
  //     emit(state.copyWith(status: FormStatus.error, error: e.toString()));
  //   }
  // }
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/login_status.dart';
import 'package:jumunseo/features/auth/data/repository/auth_repository.dart';
import 'package:jumunseo/features/auth/model/logout_model.dart';
import 'package:jumunseo/features/auth/model/sign_in_model.dart';
import 'package:jumunseo/features/auth/model/sign_up_model.dart';
import 'package:jumunseo/features/auth/model/user_delete_model.dart';
import 'package:jumunseo/features/auth/view/delete_user_ask_dialog.dart';
import 'package:jumunseo/features/auth/view/login_ask_dialog.dart';
import 'package:jumunseo/features/auth/view/logout_ask_dialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
            name: '', accessToken: '', email: '', password: '', error: '', isLogin: LoginStatus.isLogin));

  bool checkLogin() {
    return state.isLogin;
  }

  Future<void> signUp(BuildContext context, String name, String email, String password, String repassword) async {
    if(password == repassword) {
      final baseOptions = BaseOptions(
        baseUrl: 'http://10.0.2.2:8080',
        contentType: Headers.jsonContentType,
        validateStatus: (int? status) {
          return status != null;
        },
      );

      Dio dio = Dio(baseOptions);
      dio.interceptors.addAll(
        [
          const Interceptor(),
        ]
      );

      AuthRepository repo = AuthRepository(dio);
      SignUpModel signup = SignUpModel(email: email, password: password, name: name);
      final response = await repo.postSignUp(signup);

      if(response.code == 'SUCCESS') {
        context.pop();
      }
    }
  }

  Future<void> login(BuildContext context, String email, String password) async {
    final baseOptions = BaseOptions(
        baseUrl: 'http://10.0.2.2:8080',
        contentType: Headers.jsonContentType,
        validateStatus: (int? status) {
          return status != null;
        },
      );

      Dio dio = Dio(baseOptions);
      dio.interceptors.addAll(
        [
          const Interceptor(),
        ]
      );

    AuthRepository repo = AuthRepository(dio);
    SignInModel signin = SignInModel(email: email, password: password);
    final response = await repo.getLogin(signin);

    if(response.code == 'SUCCESS') {
      LoginStatus.signining = false;
      LoginStatus.isLogin = true;
      emit(state.copyWith(email: email, password: password, accessToken: response.data.accessToken, isLogin: LoginStatus.isLogin));
      context.go('/');
    }
  }

  void logoutMethod(BuildContext context) {
    showDialog(context: context, builder: (context) => logoutAskDialog(context));
  }

  void deleteUserMethod(BuildContext context) {
    showDialog(context: context, builder: (context) => deleteUserAskDialog(context));
  }

  Future<void> logout(BuildContext context) async {
    if(!LoginStatus.isGeust){
      final baseOptions = BaseOptions(
        baseUrl: 'http://10.0.2.2:8080',
        contentType: Headers.jsonContentType,
        validateStatus: (int? status) {
          return status != null;
        },
      );

      Dio dio = Dio(baseOptions);
      dio.interceptors.addAll(
        [
          const Interceptor(),
        ]
      );

      AuthRepository repo = AuthRepository(dio);
      LogoutModel response = await repo.logout(state.accessToken);

      if(response.code == 'SUCCESS') {
        LoginStatus.isLogin = false;
        emit(state.copyWith(name: "", email: "", password: "", accessToken: "", isLogin: LoginStatus.isLogin));
        LoginStatus.isGeust = false;
        context.go('/auth');
      }
    }
    else {
      LoginStatus.isGeust = false;
      context.go('/auth');
    }
  }

  Future<void> deleteUser(BuildContext context) async {
    if(!LoginStatus.isGeust){
      final baseOptions = BaseOptions(
        baseUrl: 'http://10.0.2.2:8080',
        contentType: Headers.jsonContentType,
        validateStatus: (int? status) {
          return status != null;
        },
      );

      Dio dio = Dio(baseOptions);
      dio.interceptors.addAll(
        [
          const Interceptor(),
        ]
      );

      AuthRepository repo = AuthRepository(dio);
      UserDeleteModel response = await repo.deleteUser(state.accessToken);

      if(response.code == 'SUCCESS') {
        LoginStatus.isLogin = false;
        emit(state.copyWith(name: "", email: "", password: "", accessToken: "", isLogin: LoginStatus.isLogin));
        LoginStatus.isGeust = false;
        context.go('/auth');
      }
    }
    else {
      LoginStatus.isGeust = false;
      context.go('/auth');
    }
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

  void goToSignIn(BuildContext context) {
    LoginStatus.signining = true;
    context.push('/auth/signIn');
  }

  void disposeJoin() {
    LoginStatus.joining = false;
  }

  void disposeSignIn() {
    LoginStatus.signining = false;
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

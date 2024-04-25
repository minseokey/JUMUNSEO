part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;

  final bool isLogin;

  const LoginState({
    required this.email,
    required this.password,
    required this.error,
    required this.isLogin,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      error: '',
      isLogin: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
    bool? isLogin,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object> get props => [email, password, error, isLogin];
}

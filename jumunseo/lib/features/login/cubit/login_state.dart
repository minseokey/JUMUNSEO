part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String name;
  final String accessToken;
  final String email;
  final String password;
  final String error;

  final bool isLogin;

  const LoginState({
    required this.name,
    required this.accessToken,
    required this.email,
    required this.password,
    required this.error,
    required this.isLogin,
  });

  factory LoginState.initial() {
    return const LoginState(
      name: '',
      accessToken: '',
      email: '',
      password: '',
      error: '',
      isLogin: false,
    );
  }

  LoginState copyWith({
    String? name,
    String? accessToken,
    String? email,
    String? password,
    String? error,
    bool? isLogin,
  }) {
    return LoginState(
      name: name ?? this.name,
      accessToken: accessToken ?? this.accessToken,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object> get props => [email, password, error, isLogin];
}

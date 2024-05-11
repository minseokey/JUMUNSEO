part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String name;
  final String accessToken;
  final String email;
  final String password;
  final String error;

  final bool isLogin;

  final CookieJar cookJar;

  const AuthState({
    required this.name,
    required this.accessToken,
    required this.email,
    required this.password,
    required this.error,
    required this.isLogin,
    required this.cookJar,
  });

  factory AuthState.initial() {
    return AuthState(
      name: '',
      accessToken: '',
      email: '',
      password: '',
      error: '',
      isLogin: false,
      cookJar: CookieJar(),
    );
  }

  AuthState copyWith({
    String? name,
    String? accessToken,
    String? email,
    String? password,
    String? error,
    bool? isLogin,
  }) {
    return AuthState(
      name: name ?? this.name,
      accessToken: accessToken ?? this.accessToken,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      isLogin: isLogin ?? this.isLogin,
      cookJar: cookJar,
    );
  }

  @override
  List<Object> get props => [name, accessToken, email, password, error, isLogin];
}

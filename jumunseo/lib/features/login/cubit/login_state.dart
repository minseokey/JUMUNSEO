part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;

  const LoginState({
    required this.email,
    required this.password,
    required this.error,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      error: '',
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [email, password, error];
}

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String password;

  final String username;

  const LoginEntity({required this.password, required this.username});

  @override
  List<Object> get props => [password, username];

  LoginEntity copyWith({String? password, String? username}) {
    return LoginEntity(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}

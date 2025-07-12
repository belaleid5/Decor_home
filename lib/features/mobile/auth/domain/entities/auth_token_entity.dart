import 'package:equatable/equatable.dart';

class AuthTokenEntity extends Equatable {
  final String userName;
  final String email;
  final String accessToken;
  final String refreshToken;

 const AuthTokenEntity({required this.userName, required this.email, required this.accessToken, required this.refreshToken});
  
  @override
  List<Object?> get props => [
    userName,
      email,
      accessToken,
      refreshToken,
  ];


  AuthTokenEntity copyWith({
    String? userName,
    String? email,
    String? accessToken,
    String? refreshToken,
  }) =>AuthTokenEntity(
    userName: userName ?? this.userName,
    email: email ?? this.email,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
  );
}

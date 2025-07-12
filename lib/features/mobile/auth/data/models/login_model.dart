import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.password, required super.username});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(password: json['password'], username: json['username']);

  Map<String, dynamic> toJson() => {'password': password, 'username': username};

  factory LoginModel.fromEntity(LoginEntity entity) =>
      LoginModel(password: entity.password, username: entity.username);
}

import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  const AuthTokenModel({
    required super.userName,
    required super.email,
    required super.accessToken,
    required super.refreshToken,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    final user = json["user"];
    final access = json['access_token'];
    final refresh = json['refresh_token'];

    if (user == null || access == null || refresh == null) {
      throw Exception("Parsing failed: missing required fields in AuthTokenModel");
    }

    return AuthTokenModel(
      userName: user['username'] ?? '',
      email: user['email'] ?? '',
      accessToken: access,
      refreshToken: refresh,
    );
  }



  Map<String, dynamic> toJson() => {
        "user": {
          "username": userName,
          "email": email,
        },
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };



  factory AuthTokenModel.fromEntity(AuthTokenEntity entity) => AuthTokenModel(
        userName: entity.userName,
        email: entity.email,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  AuthTokenEntity toEntity() => AuthTokenEntity(
        userName: userName,
        email: email,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  const AuthTokenModel({
    required super.userName,
    required super.email,
    required super.accessToken,
    required super.refreshToken,
  });

  /// ✅ Parsing JSON Response from API
  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    final user = json["user"];
    final access = json['access'];
    final refresh = json['refresh'];

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

  /// 🔁 Convert to JSON (if needed for caching or sending)
  Map<String, dynamic> toJson() => {
        "user": {
          "username": userName,
          "email": email,
        },
        "access": accessToken,
        "refresh": refreshToken,
      };

  /// 🔁 Convert from domain entity to model
  factory AuthTokenModel.fromEntity(AuthTokenEntity entity) => AuthTokenModel(
        userName: entity.userName,
        email: entity.email,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  /// 🔁 Convert back to domain entity
  AuthTokenEntity toEntity() => AuthTokenEntity(
        userName: userName,
        email: email,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

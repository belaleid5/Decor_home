import 'package:equatable/equatable.dart';

class AuthCredentialEntity extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String userName;
  final String confirmPassword;
  final String mobilePhone;
  final String dateOfBirth;

  const AuthCredentialEntity({required this.fullName, required this.email, required this.password, required this.userName, required this.confirmPassword, required this.mobilePhone, required this.dateOfBirth});

  @override
  List<Object?> get props => [
    fullName,
      email,
      password,
      userName,
      confirmPassword,
      mobilePhone,
      dateOfBirth
  ];



AuthCredentialEntity copyWith({
   String? fullName,
    String? email,
    String? password,
    String? userName,
    String? confirmPassword,
    String? mobilePhone,
    String? dateOfBirth,
  }) => AuthCredentialEntity(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    password: password ?? this.password,
    userName: userName ?? this.userName,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    mobilePhone: mobilePhone ?? this.mobilePhone,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
);

}


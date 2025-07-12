
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';

class CredentialModel extends AuthCredentialEntity{
  const CredentialModel({required super.fullName, required super.email, required super.password, required super.userName, required super.confirmPassword, required super.mobilePhone, required super.dateOfBirth});

 factory CredentialModel.fromJson(Map<String, dynamic> map) {
    return CredentialModel(
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userName: map['userName'] as String,
      confirmPassword: map['confirmPassword'] as String,
      mobilePhone: map['mobilePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
    );
  }

 factory CredentialModel.formEntity(AuthCredentialEntity entity){
  return  CredentialModel(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
      userName: entity.userName,
      confirmPassword: entity.confirmPassword,
      mobilePhone: entity.mobilePhone,
      dateOfBirth: entity.dateOfBirth,
    );
 }

 Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'userName': userName,
      'confirmPassword': confirmPassword,
      'mobilePhone': mobilePhone,
      'dateOfBirth': dateOfBirth,
    };
  }

}

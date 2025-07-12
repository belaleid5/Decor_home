import 'package:decor_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final RequestState status;
  final String message;
  final bool isLoading;
  final String accessToken;
  final String refreshToken;

  const AuthState({
    this.status = RequestState.initial,
    this.message = '',
    this.isLoading = false,
    this.accessToken = '',
    this.refreshToken = '',
  });

  AuthState copyWith({
    RequestState? status,
    String? message,
    bool? isLoading,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  List<Object> get props => [status, message, isLoading, accessToken, refreshToken];
}

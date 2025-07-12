import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}


import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/api_setting_entity.dart';

abstract class BaseApiSettingRepo{
  Future<Either<Failure,ApiSettingEntity>> fetchApiSettingData();

}
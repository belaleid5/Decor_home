import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/api_setting_entity.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_api_setting_repo.dart';

class ApiSettingRepoImpl extends BaseApiSettingRepo {
  final BaseApiSettingRemoteDataSource apiSettingRemoteDataSource;

  ApiSettingRepoImpl({required this.apiSettingRemoteDataSource});

  @override
  Future<Either<Failure, ApiSettingEntity>> fetchApiSettingData() async {
    try {
      final result = await apiSettingRemoteDataSource.fetchApiSettingData();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

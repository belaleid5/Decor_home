import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/api_setting_entity.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_api_setting_repo.dart';

class ApiSettingUseCase extends BaseUseCase<ApiSettingEntity, NoParams> {
  final BaseApiSettingRepo apiSettingRepo;

  ApiSettingUseCase({required this.apiSettingRepo});

  @override
  Future<Either<Failure, ApiSettingEntity>> call( NoParams params,) async {
    return await apiSettingRepo.fetchApiSettingData();
  }
}

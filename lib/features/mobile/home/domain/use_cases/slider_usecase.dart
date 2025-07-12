import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';

class GetSliderUseCase extends BaseUseCase<List<SliderEntity>, NoParams> {
  final BaseHomeRepository baseHomeRepository;

  GetSliderUseCase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, List<SliderEntity>>> call( NoParams params,) async {
    return await baseHomeRepository.getSlider();
  }
}

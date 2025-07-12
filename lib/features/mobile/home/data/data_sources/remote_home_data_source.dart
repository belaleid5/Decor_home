import 'package:decor_app/core/error/server_exceprion.dart';
import 'package:decor_app/core/model/product_model.dart';
import 'package:decor_app/core/network/api_constant.dart';
import 'package:decor_app/core/network/error_message_model.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/mobile/home/data/models/bestseller_model.dart';
import 'package:decor_app/features/mobile/home/data/models/categories_model.dart';
import 'package:decor_app/features/mobile/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<SliderModel>> getSlider();
  Future<List<CategoriesModel>> getCategories();
  Future<List<BestSellerModel>> getBestSeller();
  Future<List<ProductModel>> getCollection();
}

class RemoteHomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<List<SliderModel>> getSlider() async {
    final response = await sl<Dio>().get(ApiConstant.getNewCollection);
    if (response.statusCode == 200) {
      return List<SliderModel>.from(
        (response.data["data"] as List).map((e) => SliderModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await sl<Dio>().get(ApiConstant.getCategories);
    if (response.statusCode == 200) {
      return List<CategoriesModel>.from(
        (response.data["data"] as List).map((e) => CategoriesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<BestSellerModel>> getBestSeller() async {
    final response = await sl<Dio>().get(ApiConstant.getBestSeller);
    if (response.statusCode == 200) {
      return List<BestSellerModel>.from(
        (response.data["data"] as List).map((e) => BestSellerModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProductModel>> getCollection() async {
    final response = await sl<Dio>().get(ApiConstant.getNewCollection);
    if (response.statusCode == 200) {
      return List<ProductModel>.from(
        (response.data["data"] as List).map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}


import 'package:decor_app/features/mobile/search/domain/entities/api_setting/price_range_entity.dart';

class PriceRangeModel extends PriceRangeEntity {
  const PriceRangeModel({
    required super.minPrice,
    required super.maxPrice,
  });

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) {
    return PriceRangeModel(
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
    );
  }
}

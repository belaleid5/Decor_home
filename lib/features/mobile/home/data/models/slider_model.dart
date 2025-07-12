import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';

// ignore: must_be_immutable
class SliderModel extends SliderEntity{
  const  SliderModel({required super.id, required super.image});

  factory SliderModel.fromJson(Map<String , dynamic> json) {
    return SliderModel(
      id: json['id'] as int,
      image: json['image'] as String,
    );
  }

}
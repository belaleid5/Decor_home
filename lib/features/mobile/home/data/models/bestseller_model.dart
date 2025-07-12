import 'package:decor_app/features/mobile/home/domain/entities/bestseller_entity.dart';

class BestSellerModel extends BestSellerEntity {
  const BestSellerModel( {
    required super.id,

    required super.name,
    required super.description,

    required super.image,
    required super.rate,
     required super.color,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      color: json['color'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      rate: json['rate'] ,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,


      'name': name,
      'description': description,

      'image': image,
      'rate': rate,
    };
  }
}



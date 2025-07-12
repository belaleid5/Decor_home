import 'package:equatable/equatable.dart';

class SubCategoriesEntity extends Equatable {
  final int id;
  final String name;
  final String icon;
  final int mainCategoryId;

  const SubCategoriesEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.mainCategoryId,

  });

  @override
  List<Object?> get props => [
    id,
    name,
    icon,
    mainCategoryId,
  ];
}

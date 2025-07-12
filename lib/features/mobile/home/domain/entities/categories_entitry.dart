import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final int id;
  final String name;
  final String icon;

 const  CategoriesEntity({required this.id, required this.name, required this.icon});
  
  @override
  List<Object?> get props =>[
    id,name,icon,
  ];
}


import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final int id;
  final String name;
  final String hexColor;

  const ColorEntity({
    required this.id,
    required this.name,
    required this.hexColor,

  });

  @override
  List<Object?> get props => [
    id,
    name,
    hexColor,
  ];
}
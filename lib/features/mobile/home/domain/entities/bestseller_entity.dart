class BestSellerEntity {
  final int id;

  final String name;
  final String description;

  final String image;
  final double rate;
  final String color;

  const BestSellerEntity( {
    required this.id,
    required this.color,
    required this.name,
    required this.description,

    required this.image,
    required this.rate,
  });
}

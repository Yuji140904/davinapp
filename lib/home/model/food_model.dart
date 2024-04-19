class FoodModel{
  final int id;
  final String name;
  final double price;
  late bool favorite;
  final String image;
  final String description;
  late int counter;

  FoodModel({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.image,
    required this.description,
    required this.favorite, 
    required this.counter,
    
    });
}
final List<FoodModel> listFood=[
  FoodModel(
    id: 1,
    name: 'Big mac',
    price: 10,
    image: 'asset/images/thooyamalli-min_optimized.png',
    description: 'vea kur oy jg c ',
    favorite: false,
    counter: 1,
    
  ),
  FoodModel(
    id: 2,
    name: 'Big mac',
    price: 10,
    image: 'asset/images/thooyamalli-min_optimized.png',
    description: 'vea kur oy jg c ',
    favorite: false,
    counter: 1,
    
  ),
  FoodModel(
    id: 3,
    name: 'Big mac',
    price: 10,
    image: 'asset/images/thooyamalli-min_optimized.png',
    description: 'vea kur oy jg c ',
    favorite: false,
    counter: 1,
    
  )
];
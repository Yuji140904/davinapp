class ProfileModel{
  final int id;
  final String name;
  final String image;

  ProfileModel({required this.id, required this.name, required this.image});

 Map<String, dynamic> fromJSon() {
    return ({
      'id': id,
      'name': name,
      'image': image,
    });
  }
}
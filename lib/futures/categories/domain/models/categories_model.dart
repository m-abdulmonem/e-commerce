class CategoriesModel {
  final String name, img;

  CategoriesModel({required this.name, required this.img});

  CategoriesModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'];

  Map<String, String> toMap() => {'name': name, "img": img};
}

class ProductModel {

  final int? id;
  final String? title;
   var price;
  final String? description;
  final String? category;
  final String? image;
  var rate;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rate: json["rating"]["rate"],
    );
  }

}


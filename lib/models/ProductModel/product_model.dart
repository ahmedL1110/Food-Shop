class ProductModel {
  dynamic title;
  dynamic rating;
  dynamic name;
  dynamic mass;
  dynamic uId;
  dynamic image;

  ProductModel({
    this.title,
    this.rating,
    this.name,
    this.mass,
    this.uId,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    name = json['name'];
    mass = json['mass'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'rating': rating,
      'name': name,
      'mass': mass,
      'uId': uId,
      'image': image,
    };
  }
}

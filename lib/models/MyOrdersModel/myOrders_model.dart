class MyOrdersModel {
  dynamic title;
  dynamic rating;
  dynamic name;
  dynamic date;
  dynamic uId;
  dynamic image;

  MyOrdersModel({
    this.title,
    this.rating,
    this.name,
    this.date,
    this.uId,
    this.image,
  });

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    name = json['name'];
    date = json['date'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'rating': rating,
      'name': name,
      'date': date,
      'uId': uId,
      'image': image,
    };
  }
}

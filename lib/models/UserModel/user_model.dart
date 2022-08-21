class UserModel {
  dynamic email;
  dynamic password;
  dynamic name;
  dynamic phone;
  dynamic uId;
  dynamic image;

  UserModel({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.uId,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'uId': uId,
      'image': image,
    };
  }
}

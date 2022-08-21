class NotificationModel {
  dynamic title;
  dynamic name;
  dynamic time;
  dynamic uId;
  dynamic image;

  NotificationModel({
    this.title,
    this.time,
    this.name,
    this.uId,
    this.image,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'name': name,
      'uId': uId,
      'image': image,
    };
  }
}

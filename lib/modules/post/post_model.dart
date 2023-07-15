class PostModel {
  String? id;
  String? username;
  String? petName;
  String? desc;

  PostModel({this.id, this.username, this.petName, this.desc});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    petName = json['petName'];
    petName = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['petName'] = petName;
    data['desc'] = desc;
    return data;
  }
}

class UserModel {
  String? id;
  String? username;
  String? fullname;
  String? phone;

  UserModel({this.id, this.username, this.fullname, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullname'] = fullname;
    data['phone'] = phone;
    return data;
  }
}

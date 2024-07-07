class UserLoginModel {
  UserLogin? user;
  String? token;
  bool? status;

  UserLoginModel({this.user, this.token, this.status, required String name});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserLogin.fromJson(json['user']) : null;
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['status'] = this.status;
    return data;
  }
}

class UserLogin {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  UserLogin({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  UserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

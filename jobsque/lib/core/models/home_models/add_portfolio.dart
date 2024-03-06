class AddPortfolioModel {
  bool? status;
  AddPortData? data;

  AddPortfolioModel({this.status, this.data});

  AddPortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new AddPortData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddPortData {
  String? name;
  String? cvFile;
  String? image;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddPortData(
      {this.name,
      this.cvFile,
      this.image,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  AddPortData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cvFile = json['cv_file'];
    image = json['image'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cv_file'] = this.cvFile;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

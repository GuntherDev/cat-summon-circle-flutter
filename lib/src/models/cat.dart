class CatModel {
  String? id;
  String? createdAt;
  List<String>? tags;
  String? url;

  CatModel({this.id, this.createdAt, this.tags, this.url});

  CatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    tags = json['tags'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['tags'] = this.tags;
    data['url'] = this.url;
    return data;
  }
}
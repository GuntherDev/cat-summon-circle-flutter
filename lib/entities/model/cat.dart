class Cat {
  String? _id;
  String? _createdAt;
  List<String>? _tags;
  String? _url;

  //defining named parameters
  Cat({String? id, String? createdAt, List<String>? tags, String? url})
      : _id = id,
        _createdAt = createdAt,
        _tags = tags,
        _url = url;

  Cat.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _createdAt = json["createdAt"];
    _tags = json["tags"];
    _url = json["url"];
  }

  String? get id => _id;
  String? get createdAt => _createdAt;
  List<String>? get tags => _tags;
  String? get url => _url;
}

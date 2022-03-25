class BaseModel {
  String collection;

  BaseModel({
    required this.collection,
  });

  Map<String, dynamic> toMap() {
    throw "NOT IMPLEMENTED";
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    throw "NOT IMPLEMENTED";
  }
}

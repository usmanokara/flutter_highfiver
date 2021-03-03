class CategoryModel {
  String id;
  String categoryName;
  String imageUrl;

  CategoryModel({this.id, this.categoryName, this.imageUrl});

  CategoryModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.categoryName = map['categoryName'];
    this.imageUrl = map['imageUrl'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, categoryName: $categoryName, imageUrl: $imageUrl}';
  }
}

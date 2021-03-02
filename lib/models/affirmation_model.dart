import 'package:dailyhive/models/category_model.dart';

class AffirmationModel {
  String id;
  String authorName;
  String affirmation;
  CategoryModel category;

  AffirmationModel({this.id, this.authorName, this.affirmation, this.category});

  AffirmationModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.authorName = map['authorName'];
    this.affirmation = map['affirmation'];
    this.category = CategoryModel.fromMap(map['category']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorName'] = this.authorName;
    data['affirmation'] = this.affirmation;
    data['category'] = this.category.toMap();
    return data;
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, categoryName: $authorName, imageUrl: $affirmation, categoryId: $category}';
  }
}

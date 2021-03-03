class AffirmationModel {
  String id;
  String authorName;
  String affirmation;
  String categoryId;
  String imageUrl;
  List userIDs = [];

  AffirmationModel(
      {this.id,
      this.authorName,
      this.affirmation,
      this.categoryId,
      this.imageUrl});

  AffirmationModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.authorName = map['authorName'];
    this.affirmation = map['affirmation'];
    this.categoryId = map['categoryId'];
    this.imageUrl = map['imageUrl'];
    this.userIDs = map['userIDs'] ?? [];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorName'] = this.authorName;
    data['affirmation'] = this.affirmation;
    data['categoryId'] = this.categoryId;
    data['imageUrl'] = this.imageUrl;
    data['userIDs'] = this.userIDs ?? [];
    return data;
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, categoryName: $authorName, imageUrl: $affirmation, categoryId: $categoryId}, userIDs: $userIDs';
  }
}

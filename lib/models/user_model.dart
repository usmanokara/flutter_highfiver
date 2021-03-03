class UserModel {
  String uid;
  String displayName;
  String email;
  String photoUrl;

  UserModel({this.uid, this.displayName, this.email, this.photoUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.uid = json['uid'];
    this.displayName = json['displayName'];
    this.email = json['email'];
    this.photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, displayName: $displayName, email: $email, photoUrl: $photoUrl}';
  }
}

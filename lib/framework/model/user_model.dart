class UserModel {
  final String uid;
  final String? name;
  final String? email;

  UserModel({this.name,this.email,required this.uid});

  // Convert User object to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {'name': name,'email': email,'uid':uid};
  }

  // Factory method to create a User object from a Map<String, dynamic>
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }
}
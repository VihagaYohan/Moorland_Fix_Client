class UserEntity {
  String uid;
  String name;
  String email;
  String photoUrl;
  bool isAdmin;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.isAdmin
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'isAdmin': isAdmin
    };
  }

  // fromJson
  factory UserEntity.fromJson(Map<String,dynamic> json) {
    return UserEntity(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      isAdmin: json['isAdmin'] ?? false,
    );
  }
}

import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';

class UserModel {
  String uid;
  String name;
  String email;
  String photoUrl;
  bool isAdmin;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.isAdmin
  });

  UserEntity toEntity() {
    return UserEntity(uid: uid, name: name, email: email, photoUrl: photoUrl, isAdmin: isAdmin);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_apirest/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String name,
    required String email,
    required String photoUrl,
  }) : super(
          id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
        );

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      name: data['name'] as String,
      email: data['email'] as String,
      photoUrl: data['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['photoUrl'] = photoUrl;

    return map;
  }

  static List<UserModel?> fromJsonList(List list) {
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}

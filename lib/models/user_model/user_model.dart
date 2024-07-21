import 'address.dart';

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;

  UserModel({this.id, this.name, this.username, this.email, this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toJson(),
      };
}

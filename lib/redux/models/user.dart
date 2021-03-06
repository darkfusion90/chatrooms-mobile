import 'package:flutter/cupertino.dart';

class UserModel {
  static const UserModel deleted =
      UserModel('spaceboy', username: '[deleted]');
  final String id;
  final String username;

  const UserModel(this.id, {@required this.username})
      : assert(username != null);

  factory UserModel.fromJson(Map<String, dynamic> json) => json == null
      ? UserModel.deleted
      : UserModel(json['_id'], username: json['username']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
      };

  bool get isDeleted => this == deleted;

  @override
  bool operator ==(other) =>
      other is UserModel &&
      other.id == this.id &&
      other.username == this.username;

  @override
  int get hashCode => id.hashCode ^ username.hashCode;

  @override
  String toString() => 'UserModel(id: $id, username: $username)';
}

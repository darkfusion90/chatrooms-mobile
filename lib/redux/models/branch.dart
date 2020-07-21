import 'package:chatrooms/redux/models/room.dart';

class BranchModel {
  static const String _MAIN_BRANCH_NAME = 'main';
  final String id;
  final String name;
  final RoomModel room;
  final DateTime createdAt;

  const BranchModel({this.id, this.name, this.room, this.createdAt});

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json['_id'],
        name: json['name'],
        room: RoomModel.fromJson(json['room']),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  bool get isMainBranch => name == _MAIN_BRANCH_NAME;

  @override
  String toString() => 'BranchModel(\n'
      'id: $id,\n'
      'name: $name,\n'
      'room: $room,\n'
      'createdAt: $createdAt\n'
      ')\n';

  @override
  bool operator ==(other) => other is BranchModel && other.id == id;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ room.hashCode ^ createdAt.hashCode;
}

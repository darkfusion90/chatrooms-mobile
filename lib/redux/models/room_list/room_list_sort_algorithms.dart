import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/shared/enums/enum_sort_order.dart';
import 'package:chatrooms/shared/typedefs/typedef_sort_algorithm.dart';

abstract class RoomListSortAlgorithm {
  static final SortAlgorithm<RoomModel> _alphabetical =
      (RoomModel room, RoomModel otherRoom) =>
          room.name.toLowerCase().compareTo(otherRoom.name.toLowerCase());

  static final SortAlgorithm<RoomModel> _creationDate =
      (RoomModel room, RoomModel otherRoom) =>
          otherRoom.createdAt.compareTo(room.createdAt);

  static final SortAlgorithm<RoomModel> alphabeticalAsc =
      (RoomModel room, RoomModel otherRoom) => _alphabetical(room, otherRoom);

  static final SortAlgorithm<RoomModel> alphabeticalDesc =
      (RoomModel room, RoomModel otherRoom) => _alphabetical(otherRoom, room);

  static final SortAlgorithm<RoomModel> creationDateAsc =
      (RoomModel room, RoomModel otherRoom) => _creationDate(room, otherRoom);

  static final SortAlgorithm<RoomModel> creationDateDesc =
      (RoomModel room, RoomModel otherRoom) => _creationDate(otherRoom, room);
}

enum RoomListSortFactor { alphabetical, creationDate }

extension BoolGetters on RoomListSortFactor {
  bool _matches(RoomListSortFactor factor) => this == factor;

  bool get isAlphabetical => _matches(RoomListSortFactor.alphabetical);

  bool get isByCreationDate => _matches(RoomListSortFactor.creationDate);
}

class UnknownRoomListSortFactorException implements Exception {
  final RoomListSortFactor sortFactor;

  UnknownRoomListSortFactorException(this.sortFactor);

  @override
  String toString() => 'Unknown RoomListSortFactor: $sortFactor';
}

class UnknownSortOrderException implements Exception {
  final SortOrder sortOrder;

  UnknownSortOrderException(this.sortOrder);

  @override
  String toString() => 'Unknown RoomListSortFactor: $sortOrder';
}

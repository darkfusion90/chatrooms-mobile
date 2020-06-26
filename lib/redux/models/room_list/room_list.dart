import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/models/room_list/room_list_sort_algorithms.dart';
import 'package:chatrooms/shared/enums/enum_sort_order.dart';
import 'package:chatrooms/utils/safe_regex.dart';

typedef ListWhereClauseTest<T> = bool Function(T val);

class RoomListModel {
  static const RoomListFilter _noFilter = RoomListFilter();
  final List<RoomModel> rooms;
  final RoomListFilter filter;

  RoomListModel(this.rooms, {this.filter = _noFilter}) {
    this.sort();
  }

  @override
  bool operator ==(other) => other is RoomListModel && rooms == other.rooms;

  @override
  int get hashCode => rooms.hashCode;

  @override
  String toString() => '$rooms';

  factory RoomListModel.empty() => RoomListModel([]);

  RoomModel getById(String id) => rooms.singleWhere((room) => room.id == id);

  int get length => rooms.length;

  List<RoomModel> get filtered => roomsWithFilter();

  RoomModel operator [](int index) => rooms[index];

  void replaceMatching(RoomModel toReplace) {
    rooms.forEach((room) => room == toReplace ? toReplace : room);
  }

  List<RoomModel> roomsWithFilter() {
    if (filter == _noFilter || filter.query == null) return rooms;

    final RegExp _regex = safeRegex(filter.query, caseSensitive: false);
    return rooms.where((room) => _regex.hasMatch(room.name)).toList();
  }

  void sort({
    RoomListSortFactor factor = RoomListSortFactor.alphabetical,
    SortOrder order = SortOrder.ascending,
  }) {
    switch (factor) {
      case RoomListSortFactor.alphabetical:
        _sortAlphabetically(order);
        break;
      case RoomListSortFactor.creationDate:
        _sortByCreationDate(order);
        break;
      default:
        throw UnknownRoomListSortFactorException(factor);
    }
  }

  void _sortAlphabetically(SortOrder order) {
    switch (order) {
      case SortOrder.ascending:
        rooms.sort(RoomListSortAlgorithm.alphabeticalAsc);
        break;
      case SortOrder.descending:
        rooms.sort(RoomListSortAlgorithm.alphabeticalDesc);
        break;
    }
  }

  void _sortByCreationDate(SortOrder order) {
    switch (order) {
      case SortOrder.ascending:
        rooms.sort(RoomListSortAlgorithm.creationDateAsc);
        break;
      case SortOrder.descending:
        rooms.sort(RoomListSortAlgorithm.creationDateDesc);
        break;
    }
  }
}

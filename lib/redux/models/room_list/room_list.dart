import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/redux/models/room_list/room_list_filter.dart';
import 'package:chatrooms/redux/models/room_list/room_list_sort_algorithms.dart';
import 'package:chatrooms/shared/enums/enum_sort_order.dart';
import 'package:chatrooms/shared/typedefs/typedef_sort_algorithm.dart';
import 'package:chatrooms/utils/safe_regex.dart';

typedef ListWhereClauseTest<T> = bool Function(T val);

class RoomListModel {
  final List<RoomModel> rooms;

  RoomListModel(this.rooms) {
    this.sort();
  }

  RoomModel operator [](int index) => rooms[index];

  RoomListModel operator +(RoomListModel other) =>
      RoomListModel(List.from(rooms)..addAll(other.rooms));

  @override
  bool operator ==(other) => other is RoomListModel && rooms == other.rooms;

  @override
  int get hashCode => rooms.hashCode;

  @override
  String toString() => '$rooms';

  factory RoomListModel.empty() => RoomListModel([]);

  RoomModel getById(String id) => rooms.singleWhere((room) => room.id == id);

  int get length => rooms.length;

  void replaceMatching(RoomModel toReplace) {
    rooms.forEach((room) => room == toReplace ? toReplace : room);
  }

  RoomListModel applyFilter(RoomListFilter filter) {
    if (filter == RoomListFilter.noFilter) return this;

    final RegExp _regex = safeRegex(filter.query, caseSensitive: false);
    return RoomListModel(
      rooms.where((room) => _regex.hasMatch(room.name)).toList(),
    );
  }

  void sort({
    RoomListSortFactor factor = RoomListSortFactor.alphabetical,
    SortOrder order = SortOrder.ascending,
  }) =>
      rooms.sort(_getSortAlgorithm(factor, order));
}

SortAlgorithm<RoomModel> _getSortAlgorithm(
  RoomListSortFactor sortFactor,
  SortOrder order,
) {
  switch (order) {
    case SortOrder.ascending:
      return _ascendingSortAlgorithm(sortFactor);
    case SortOrder.descending:
      return _descendingSortAlgorithm(sortFactor);
    default:
      throw UnknownSortOrderException(order);
  }
}

SortAlgorithm<RoomModel> _ascendingSortAlgorithm(
        RoomListSortFactor sortFactor) =>
    sortFactor.isAlphabetical
        ? RoomListSortAlgorithm.alphabeticalAsc
        : RoomListSortAlgorithm.creationDateAsc;

SortAlgorithm<RoomModel> _descendingSortAlgorithm(
        RoomListSortFactor sortFactor) =>
    sortFactor.isAlphabetical
        ? RoomListSortAlgorithm.alphabeticalDesc
        : RoomListSortAlgorithm.creationDateDesc;

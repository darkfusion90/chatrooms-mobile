import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/models/room.dart';
import 'package:chatrooms/services/api/api.dart';
import 'package:chatrooms/services/api/api-rooms.dart';

class ApiBranch {
  static final String rootUrl = '${ApiRooms.root}/:roomId/branch/:branchId';

  static String root(
    RoomModel room, {
    BranchModel branch,
    String baseUrl,
    bool includeBranch = true,
    bool isMainBranch = false,
  }) {
    final String base = baseUrl ?? rootUrl;
    final String withRoom = base.replaceAll(':roomId', room.id);

    if (branch == null || branch?.id == null) {
      final String toReplace =
          includeBranch ? ':branchId' : '/branch/:branchId';

      return withRoom.replaceAll(toReplace, isMainBranch ? 'main' : '');
    } else {
      return withRoom.replaceAll(':branchId', branch.id);
    }
  }

  Future<List<BranchModel>> ofRoom(RoomModel room) async {
    final String url = root(room);

    final Map<String, dynamic> json = await Api.getJson(url);
    print('branches response json: , $json');
    final List<dynamic> branches = json['branches'];

    return List<BranchModel>.generate(
      branches.length,
      (index) => BranchModel.fromJson(branches[index]),
    );
  }

  Future<BranchModel> mainBranch(RoomModel room) async =>
      BranchModel.fromJson(await Api.getJson(root(room, isMainBranch: true)));
}

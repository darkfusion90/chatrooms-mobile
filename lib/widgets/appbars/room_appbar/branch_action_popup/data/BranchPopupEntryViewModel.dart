import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/data/BranchPopupAction.dart';

class BranchPopupEntryViewModel {
  final BranchModel branch;
  final BranchPopupAction action;

  const BranchPopupEntryViewModel({this.branch, this.action});

  bool get hasAction => action != null;
}

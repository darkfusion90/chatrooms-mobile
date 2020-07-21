import 'package:chatrooms/redux/models/branch.dart';
import 'BranchPopupAction.dart';

class BranchPopupEntryViewModel {
  final BranchModel branch;
  final BranchPopupAction action;

  const BranchPopupEntryViewModel({this.branch, this.action});

  bool get hasAction => action != null;
}

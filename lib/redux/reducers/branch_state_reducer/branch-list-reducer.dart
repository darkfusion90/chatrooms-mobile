import 'package:chatrooms/redux/actions/branch_actions/update-branch-list.dart';
import 'package:chatrooms/redux/models/branch.dart';
import 'package:redux/redux.dart';

List<BranchModel> _reducer(_, SetBranchList action) => action.branches;

final Reducer<List<BranchModel>> branchListReducer = combineReducers([
  TypedReducer<List<BranchModel>, SetBranchList>(_reducer),
]);

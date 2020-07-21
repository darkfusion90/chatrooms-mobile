import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/branch_actions/update-current-branch.dart';
import 'package:chatrooms/redux/models/branch.dart';

BranchModel _reducer(_, SetCurrentBranch action) => action.branch;

final Reducer<BranchModel> currentBranchReducer = combineReducers([
  TypedReducer<BranchModel, SetCurrentBranch>(_reducer),
]);

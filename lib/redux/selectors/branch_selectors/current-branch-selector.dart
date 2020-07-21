import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/branch-state-selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/state/BranchState.dart';


final Selector<AppState, BranchModel> currentBranchSelector = createSelector1(
  branchStateSelector,
  (BranchState state) => state.currentBranch,
);

import 'package:reselect/reselect.dart';

import 'package:chatrooms/redux/models/branch.dart';

import 'package:chatrooms/redux/selectors/branch_selectors/branch-list-selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/branch-state-selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/current-branch-selector.dart';

import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/redux/state/BranchState.dart';

final Selector<AppState, BranchModel> mainBranchSelector = createSelector2(
  (AppState state) => state,
  branchStateSelector,
  (AppState state, BranchState branchState) {
    final BranchModel currentBranch = currentBranchSelector(state);
    if (currentBranch != null && currentBranch.isMainBranch) {
      return currentBranch;
    }

    return filterMainBranch(branchListSelector(state));
  },
);

BranchModel filterMainBranch(List<BranchModel> branches) =>
    branches.singleWhere(
      (branch) => branch.isMainBranch,
      orElse: () => null,
    );

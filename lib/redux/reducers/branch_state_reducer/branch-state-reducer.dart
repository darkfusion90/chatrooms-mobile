import 'package:chatrooms/redux/reducers/branch_state_reducer/branch-list-reducer.dart';
import 'package:chatrooms/redux/reducers/branch_state_reducer/current-branch-reducer.dart';
import 'package:chatrooms/redux/state/BranchState.dart';

BranchState branchStateReducer(BranchState state, dynamic action) =>
    BranchState(
      currentBranch: currentBranchReducer(state.currentBranch, action),
      branches: branchListReducer(state.branches, action),
    );

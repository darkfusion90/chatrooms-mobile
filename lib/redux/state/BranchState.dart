import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/state/state_interface.dart';
import 'package:flutter/cupertino.dart';

class BranchState extends ReduxState {
  final BranchModel currentBranch;
  final List<BranchModel> branches;

  BranchState({@required this.currentBranch, @required this.branches});

  factory BranchState.init() => BranchState(
        currentBranch: null,
        branches: const <BranchModel>[],
      );

  @override
  bool compareState(other) =>
      other is BranchState &&
      other.currentBranch == currentBranch &&
      other.branches == branches;

  @override
  int getHashCode() => currentBranch.hashCode ^ branches.hashCode;
}

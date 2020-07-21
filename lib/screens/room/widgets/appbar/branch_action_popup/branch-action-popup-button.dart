import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/utils/AssetsProvider.dart';

import 'package:chatrooms/widgets/icon-content.dart';
import 'package:chatrooms/connector_widgets/RoomBranchConnector.dart';

import 'branch-action-popup-item.dart';
import 'data/BranchPopupAction.dart';
import 'data/BranchPopupEntryViewModel.dart';

const int kMaxBranchesInPopup = 5;
const ImageProvider kBranchImage = AssetImage(AssetKeyProvider.branchIcon);

class RoomAppBarBranchAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomBranchConnector(
      builder: (_, viewModel) => _RoomAppBarBranchAction(
        viewModel: viewModel,
        branchList: BranchListViewModel(
          branches: List<BranchModel>.from(viewModel.branches),
          currentBranch: viewModel.currentBranch,
        ),
      ),
    );
  }
}

class _RoomAppBarBranchAction extends StatelessWidget {
  final RoomBranchConnectorViewModel viewModel;
  final BranchListViewModel branchList;

  const _RoomAppBarBranchAction({
    @required this.viewModel,
    @required this.branchList,
  });

  @override
  Widget build(BuildContext context) {
    final BranchModel currentBranch = viewModel.currentBranch;

    return PopupMenuButton<BranchPopupEntryViewModel>(
      child: IconContent(
        icon: ImageIcon(kBranchImage),
        content: Text(currentBranch == null ? '' : '(${currentBranch.name})'),
      ),
      tooltip: 'Find and create branches',
      offset: Offset(0, 36),
      itemBuilder: _popupItems,
      onSelected: (entry) => _onPopupItemSelected(context, entry),
    );
  }

  void _onPopupItemSelected(
    BuildContext context,
    BranchPopupEntryViewModel entry,
  ) {
    if (entry.action != null) {
      _handlePopupAction(context, entry);
    } else if (entry.branch != viewModel.currentBranch) {
      viewModel.setCurrentBranch(entry.branch);
    }
  }

  void _handlePopupAction(
    BuildContext context,
    BranchPopupEntryViewModel entry,
  ) {
    switch (entry.action) {
      case BranchPopupAction.showMoreOptions:
        Flushbar(message: 'Show More Branches!', duration: Duration(seconds: 2))
            .show(context);
    }
  }

  PopupMenuItemBuilder<BranchPopupEntryViewModel> get _popupItems =>
      (BuildContext context) {
        List<PopupMenuEntry<BranchPopupEntryViewModel>> popups = [
          _popupHeader(context),
          PopupMenuDivider(),
        ]
          ..addAll(_popupItemsLimited)
          ..addAll([PopupMenuDivider(), _showMoreBranchesPopupItem]);

        return popups;
      };

  List<PopupMenuEntry<BranchPopupEntryViewModel>> get _popupItemsLimited {
    return branchList.limitedBranches
        .map((branch) => _popupItem(branch))
        .toList();
  }

  PopupMenuEntry<BranchPopupEntryViewModel> _popupItem(
    BranchModel branch, [
    BranchPopupAction action,
  ]) =>
      PopupMenuItem(
        value: BranchPopupEntryViewModel(branch: branch, action: action),
        child: BranchPopupItem(
          branch: branch,
          selectedBranch: viewModel.currentBranch,
          action: action,
        ),
      );

  PopupMenuEntry<BranchPopupEntryViewModel> _popupHeader(
    BuildContext context,
  ) {
    final int branchLength = viewModel.branches.length;
    final int branchesShown = min(kMaxBranchesInPopup, branchLength);

    String countInfo = '$branchesShown of $branchLength';

    return PopupMenuItem(
      child: BranchPopupItem.buildRow(
        ImageIcon(
          kBranchImage,
          color: Theme.of(context).primaryColor,
        ),
        Text('Branches ($countInfo)'),
      ),
    );
  }

  PopupMenuEntry<BranchPopupEntryViewModel> get _showMoreBranchesPopupItem =>
      _popupItem(null, BranchPopupAction.showMoreOptions);
}

class BranchListViewModel {
  final List<BranchModel> branches;
  final BranchModel currentBranch;

  BranchListViewModel({this.currentBranch, this.branches}) {
    _shuffleCurrentBranchToTop();
  }

  void _shuffleCurrentBranchToTop() {
    branches.remove(currentBranch);
    branches.insert(0, currentBranch);
  }

  List<BranchModel> get limitedBranches => branches.sublist(
        0,
        min(kMaxBranchesInPopup, branches.length),
      );
}

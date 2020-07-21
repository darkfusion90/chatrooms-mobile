import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/utils/AssetsProvider.dart';

import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/branch-action-popup-item.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/data/BranchPopupAction.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/data/BranchPopupEntryViewModel.dart';
import 'package:chatrooms/connector_widgets/RoomBranchConnector.dart';

const int kMaxBranchesInPopup = 2;

class RoomAppBarBranchAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomBranchConnector(
      builder: (_, viewModel) => _RoomAppBarBranchAction(viewModel: viewModel),
    );
  }
}

class _RoomAppBarBranchAction extends StatelessWidget {
  final RoomBranchConnectorViewModel viewModel;

  const _RoomAppBarBranchAction({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    print('current${viewModel.currentBranch}');
    return PopupMenuButton<BranchPopupEntryViewModel>(
      icon: ImageIcon(AssetImage(AssetKeyProvider.branchIcon)),
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
      case BranchPopupAction.showMoreBranches:
        Flushbar(message: 'Show More Branches!', duration: Duration(seconds: 2))
            .show(context);
    }
  }

  PopupMenuItemBuilder<BranchPopupEntryViewModel> get _popupItems =>
      (BuildContext context) {
        List<PopupMenuEntry<BranchPopupEntryViewModel>> popups =
            _popupItemsLimited;
        if (viewModel.branches.length > kMaxBranchesInPopup) {
          popups.addAll([PopupMenuDivider(), _showMoreBranchesPopupItem]);
        }

        return popups;
      };

  List<PopupMenuEntry<BranchPopupEntryViewModel>> get _popupItemsLimited {
    final List<BranchModel> branches =
        viewModel.branches.sublist(0, kMaxBranchesInPopup);

    return branches.map((branch) => _popupItem(branch)).toList();
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

  PopupMenuEntry<BranchPopupEntryViewModel> get _showMoreBranchesPopupItem =>
      _popupItem(null, BranchPopupAction.showMoreBranches);
}

import 'package:flutter/material.dart';

import 'package:chatrooms/redux/models/branch.dart';

import 'package:chatrooms/widgets/TextTag.dart';
import 'package:chatrooms/widgets/appbars/room_appbar/branch_action_popup/data/BranchPopupAction.dart';
import 'package:chatrooms/widgets/least_space_container.dart';

class BranchPopupItem extends StatelessWidget {
  final BranchModel branch;
  final BranchModel selectedBranch;
  final BranchPopupAction action;

  const BranchPopupItem({this.branch, this.selectedBranch, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _branchSelectedIcon(context),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Text(action?.title ?? branch.name),
              color: Colors.red,
            ),
            flex: 1,
          ),
          SizedBox(width: 30),
          _defaultBranchIcon(context),
        ],
      ),
    );
  }

  Widget _branchSelectedIcon(BuildContext context) => Icon(
        branch != null && branch == selectedBranch ? Icons.done : null,
        color: Theme.of(context).iconTheme.color,
      );

  Widget _defaultBranchIcon(BuildContext context) {
    if (branch == null) return LeastSpaceContainer();
    if (!branch.isMainBranch) return Icon(null);

    return TextTag(
      child: Text(
        'default',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
      ),
    );
  }
}

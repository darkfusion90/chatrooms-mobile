import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:chatrooms/redux/actions/branch_actions/update-branch-list.dart';
import 'package:chatrooms/redux/actions/branch_actions/update-current-branch.dart';
import 'package:chatrooms/redux/models/branch.dart';
import 'package:chatrooms/redux/selectors/active_room_selectors/active_room_selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/branch-list-selector.dart';
import 'package:chatrooms/redux/selectors/branch_selectors/current-branch-selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';

import 'package:chatrooms/connector_widgets/ActiveRoomConnector.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';

typedef UpdateBranchCallback(BranchModel branch);

class RoomBranchConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<RoomBranchConnectorViewModel> builder;

  const RoomBranchConnector({@required this.builder});

  @override
  Widget build(BuildContext context) => ActiveRoomConnector(
        builder: (_, viewModel) => StoreConnector<AppState, Store<AppState>>(
          converter: (store) => store,
          builder: (_, store) => builder(context, _viewModel(store)),
        ),
      );

  RoomBranchConnectorViewModel _viewModel(Store<AppState> store) =>
      RoomBranchConnectorViewModel(
        branches: branchListSelector(store.state),
        updateBranchList: () => store.dispatch(updateBranchList()),
        currentBranch: currentBranchSelector(store.state),
        setCurrentBranch: (branch) => store.dispatch(
          SetCurrentBranch(branch, activeRoomSelector(store.state)),
        ),
      );
}

class RoomBranchConnectorViewModel {
  final List<BranchModel> branches;
  final VoidCallback updateBranchList;
  final BranchModel currentBranch;
  final UpdateBranchCallback setCurrentBranch;

  RoomBranchConnectorViewModel({
    @required this.branches,
    @required this.updateBranchList,
    @required this.currentBranch,
    @required this.setCurrentBranch,
  });
}

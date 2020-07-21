enum BranchPopupAction { showMoreBranches }

extension BranchPopupActionTitle on BranchPopupAction {
  String get title {
    switch (this) {
      case BranchPopupAction.showMoreBranches:
        return 'Show more Branches...';
      default:
        throw Exception('Unknown _BranchPopupAction: $this');
    }
  }
}

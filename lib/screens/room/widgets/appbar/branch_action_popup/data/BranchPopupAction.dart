enum BranchPopupAction { showMoreOptions }

extension BranchPopupActionTitle on BranchPopupAction {
  String get title {
    switch (this) {
      case BranchPopupAction.showMoreOptions:
        return 'Show more options...';
      default:
        throw Exception('Unknown _BranchPopupAction: $this');
    }
  }
}

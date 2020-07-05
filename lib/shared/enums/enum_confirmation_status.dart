enum ConfirmationStatus { accepted, rejected }

extension BoolIsGetters on ConfirmationStatus {
  bool get isAccepted => this == ConfirmationStatus.accepted;

  bool get isRejected => this == ConfirmationStatus.rejected;
}

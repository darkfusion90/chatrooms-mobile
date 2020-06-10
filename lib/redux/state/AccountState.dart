import 'package:chatrooms/redux/models/user.dart';
import 'package:chatrooms/redux/state/state_interface.dart';

class AccountState extends ReduxState {
  final bool isRegistered;
  final UserModel user;

  AccountState(this.user, {this.isRegistered = false})
      : assert(isRegistered != null);

  factory AccountState.init() => AccountState(null);

  // Creates an instance by applying all properties of state while
  // overriding them with the optional named arguments if provided
  factory AccountState.apply(
    AccountState state, {
    UserModel user,
    bool isRegistered,
  }) {
    user = user ?? state.user;
    isRegistered = isRegistered ?? state.isRegistered;
    return AccountState(user, isRegistered: isRegistered);
  }

  @override
  String toString() => 'AccountState(isRegistered: $isRegistered, user: $user)';

  @override
  bool compareState(other) =>
      other is AccountState &&
      other.user == this.user &&
      other.isRegistered == this.isRegistered;

  @override
  int getHashCode() => user.hashCode ^ isRegistered.hashCode;
}

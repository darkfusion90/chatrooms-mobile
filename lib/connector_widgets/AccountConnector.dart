import 'package:chatrooms/redux/models/account.dart';
import 'package:chatrooms/redux/selectors/account_selectors/account_selector.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/shared/typedefs/typedef_param_widget_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AccountConnector extends StatelessWidget {
  final ParameterizedWidgetBuilder<AccountModel> builder;

  const AccountConnector({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store,
      builder: (BuildContext context, Store<AppState> store) =>
          builder(context, accountStateSelector(store.state).account),
    );
  }
}

import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/redux/actions/account_actions/login.dart';
import 'package:chatrooms/redux/state/AppState.dart';
import 'package:chatrooms/router/route_names.dart';
import 'package:chatrooms/widgets/password-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

typedef SignInCallback(LoginInfo info);

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignInCallback>(
      converter: _signInCallback,
      builder: (_, SignInCallback signIn) => _SignInForm(onSignIn: signIn),
    );
  }

  SignInCallback _signInCallback(Store<AppState> store) {
    return (LoginInfo signInInfo) => store.dispatch(login(signInInfo));
  }
}

class _SignInForm extends StatelessWidget {
  final ValueChanged<LoginInfo> onSignIn;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _SignInForm({@required this.onSignIn}) : assert(onSignIn != null);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[_inputFields, _signInActions(context)],
      ),
    );
  }

  Widget _signInActions(BuildContext context) => _SignInFormActions(
        onSignIn: _onFormSubmit,
        onCreateAccount: () => _onCreateAccount(context),
      );

  Widget get _inputFields => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 30.0),
          PasswordField(controller: _passwordController),
          SizedBox(height: 30.0),
        ],
      );

  void _onFormSubmit() => onSignIn(LoginInfo(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      ));

  void _onCreateAccount(BuildContext context) =>
      Navigator.of(context).popAndPushNamed(RouteNames.createAccount);
}

class _SignInFormActions extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onCreateAccount;

  const _SignInFormActions({
    @required this.onSignIn,
    @required this.onCreateAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[_createAccountButton(context), _signInButton(context)],
    );
  }

  Widget _signInButton(BuildContext context) => FlatButton(
        child: Text('Sign In'),
        onPressed: onSignIn,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
      );

  Widget _createAccountButton(BuildContext context) => FlatButton(
        child: Text(
          'Create Account',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onPressed: onCreateAccount,
        padding: EdgeInsets.all(4),
      );
}

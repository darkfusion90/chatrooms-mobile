import 'package:chatrooms/connector_widgets/AccountConnector.dart';
import 'package:chatrooms/widgets/password-field.dart';
import 'package:flutter/material.dart';

enum AccountActionType { login, createAccount }

extension _ on AccountActionType {
  bool get isLogin => this == AccountActionType.login;

  bool get isCreateAccount => this == AccountActionType.createAccount;
}

typedef OnAccountActionCallback(LoginInfo info);

class AccountActionForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();

  LoginInfo get _loginInfo => LoginInfo(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );

  final AccountActionType actionType;
  final OnAccountActionCallback onFormSubmit;
  final Widget extraAction;

  AccountActionForm({
    @required this.actionType,
    @required this.onFormSubmit,
    this.extraAction,
  })  : assert(actionType != null),
        assert(onFormSubmit != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 120.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[_inputFields, _accountActions],
        ),
      ),
    );
  }

  Widget get _inputFields => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _usernameTF,
          _sizedBox,
          _passwordTF,
          _sizedBox,
          actionType.isCreateAccount ? _confirmPasswordTF : Container(),
          actionType.isCreateAccount ? _sizedBox : Container(),
        ],
      );

  Widget get _sizedBox => SizedBox(height: 30.0);

  Widget get _usernameTF => TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          labelText: 'Username',
          border: OutlineInputBorder(),
        ),
      );

  Widget get _passwordTF => PasswordField(controller: _passwordController);

  Widget get _confirmPasswordTF => PasswordField(
        controller: _confirmPwdController,
        labelText: 'Confirm Password',
      );

  Widget get _accountActions => _AccountActions(
        actionType: actionType,
        onAction: () => onFormSubmit(_loginInfo),
        extraAction: extraAction,
      );
}

class _AccountActions extends StatelessWidget {
  final AccountActionType actionType;
  final VoidCallback onAction;
  final Widget extraAction;

  const _AccountActions({
    @required this.actionType,
    @required this.onAction,
    this.extraAction,
  })  : assert(actionType != null),
        assert(onAction != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: extraAction == null
          ? MainAxisAlignment.end
          : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        extraAction ?? Container(),
        actionType.isLogin
            ? _signInButton(context)
            : _createAccountButton(context),
      ],
    );
  }

  Widget _signInButton(BuildContext context) =>
      _buildActionButton(context, 'Sign In');

  Widget _createAccountButton(BuildContext context) =>
      _buildActionButton(context, 'Create Account');

  Widget _buildActionButton(BuildContext context, String label) => FlatButton(
        child: Text(label),
        onPressed: onAction,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
      );
}

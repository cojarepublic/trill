import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(String email, String password, String username, bool isLogin) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit () {
   final isValid = _formKey.currentState.validate();
   FocusScope.of(context).unfocus();

   if (isValid) {
     _formKey.currentState.save();
     widget.submitFn(
       _userEmail,
       _userPassword,
       _userName,
       _isLogin,
     );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (userText) {
                      if (userText.isEmpty || !userText.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email@example.com',
                    ),
                    onSaved: (userText) {
                      _userEmail = userText;
                    },
                  ),
                  if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (userText) {
                      if (userText.isEmpty || userText.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (userText) {
                      _userName = userText;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (userText) {
                      if (userText.isEmpty || userText.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (userText) {
                      _userPassword = userText;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                    onPressed: _trySubmit,
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin ? 'Create new account' : 'I already have an account'),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });

                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

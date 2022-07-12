
import 'package:flutter/material.dart';
import 'package:we_chat/screens/chat_screen.dart';
import 'package:we_chat/screens/login_screen.dart';
import 'package:we_chat/utills/constant.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key, required this.isRegistering})
      : super(key: key);

  static Route<void> route({bool isRegistering = false}) {
    return MaterialPageRoute(
      builder: (context) => RegistrationScreen(isRegistering: isRegistering),
    );
  }

  final bool isRegistering;
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final bool _isLoading = false;

  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future<void> _singUp() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;

    final res = await supabase.auth
        .signUp(email, password, userMetadata: {'username': username});
    final error = res.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
      return;
    }
    Navigator.of(context)
        .pushAndRemoveUntil(ChatScreen.route(), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: formPadding,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text("Email"),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Return";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            formSpacer,
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text("Password"),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required";
                }
                if (val.length < 6) {
                  return "6 characters minimum";
                }
                return null;
              },
            ),
            formSpacer,
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                label: Text("Username"),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required";
                }
                final isValid = RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(val);
                if (!isValid) {
                  return '3-24 long with alphanumeric or underscore';
                }
                return null;
              },
            ),
            formSpacer,
            ElevatedButton(
              onPressed: _isLoading ? null : _singUp,
              child: const Text("Register"),
            ),
            formSpacer,
            TextButton(
              onPressed: () {
                Navigator.of(context).push(LoginScreen.route());
              },
              child: const Text("I already have an account"),
            )
          ],
        ),
      ),
    );
  }
}

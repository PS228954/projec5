import 'package:flutter/material.dart';
import 'package:mad2_app/services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.setSignedIn}) : super(key: key);
  final void Function(bool signedIn) setSignedIn;

  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(body: Form(key: _formKey, child: ListView(children: [

// email
      TextFormField(controller: _emailTextController,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'email adres'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vul emailadres in';
          }
          return null;
        },),
// password
      TextFormField(controller: _passwordTextController,
        textInputAction: TextInputAction.next,
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'password'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vul password in';
          }
          return null;
        },),
// submit button
      ElevatedButton(onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            final result = await AuthenticationServices.login(
              _emailTextController.text, _passwordTextController.text,);
            widget.setSignedIn(result);
          } catch (e) {
            widget.setSignedIn(false);
          }
        }
      }, child: const Text('Inloggen'),),
    ],),),);
  }
}
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            }
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
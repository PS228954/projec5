import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'login_page.dart';


class RegistreerPage extends StatelessWidget {
  const RegistreerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: const Text('Second Route'),
    ),body: Form(child: ListView(children: [

// email
      TextFormField(
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
      TextFormField(
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


      }, child: const Text('Registreer'),),
    ],),),);
  }
}
import 'package:flutter/material.dart';

class LicensePageCustom extends StatefulWidget {
  const LicensePageCustom({super.key});

  @override
  _LicencePageCustomState createState() => _LicencePageCustomState();
}

class _LicencePageCustomState extends State<LicensePageCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const LicensePage(
        applicationName: 'License app',
        applicationIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle),
        ),
        applicationVersion: '0.0.1',
      ),
    );
  }
}
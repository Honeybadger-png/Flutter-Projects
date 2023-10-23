import 'package:flutter/material.dart';

class SettinsgPage extends StatefulWidget {
  const SettinsgPage({Key? key}) : super(key: key);

  @override
  State<SettinsgPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettinsgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsley'),
      ),
      body: Container(
        child: Text("Settings"),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPage();
}

class _AddMenuPage extends State<AddMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsley'),
      ),
      body: Container(
        child: Text("add_menu"),
      ),
    );
  }
}


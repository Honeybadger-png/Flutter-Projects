import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String image,name,time,level;

  const DetailsScreen(this.index,this.image,this.name,this.time,this.level);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("index:${widget.index},image:${widget.image}, name:${widget.name},time:${widget.time},level:${widget.level}");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}



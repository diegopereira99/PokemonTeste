import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {

  final String title;

  CustomAppBar({@required this.title});

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: AppBar(
        centerTitle: false,
        title: Text(
          this.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24
          ),
        ),
        actions: [
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/pokemon_ball.png",
            ),
          )
        ],
      ),
    );
  }
}
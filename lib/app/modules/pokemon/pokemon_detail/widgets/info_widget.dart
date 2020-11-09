import 'package:flutter/material.dart';
class InfoWidget extends StatelessWidget {

  final String title;
  final String value;
  
  InfoWidget({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${this.title}: ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                )
              ),
              TextSpan(
                text: "${this.value}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15
                )
              ),
            ]
          ),
        ),
      );
  }
}
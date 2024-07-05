
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final bool active;
  final void Function(String) onTap;


  const MyCard(this.title,
      {super.key , this.active = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(title),
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Visibility(
          visible: active,
          child:Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),      
          ),
        ),  
      ),
    );
  }
}
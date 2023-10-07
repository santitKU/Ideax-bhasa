import 'package:flip_card/flip_card.dart';
import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String text;
  final Image image;

  const Button(
      {Key? key,
      required this.text,
       required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlipCard(
        front: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(24)),
          height: 20,
          width: 20,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        back: SizedBox(
          height: 20,
          width: 20,
          child: image,
        ),
      ),
    );
  }
}

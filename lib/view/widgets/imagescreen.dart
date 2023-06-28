import 'package:flutter/material.dart';

class Gimages extends StatelessWidget {
  String imag;
  bool ind;

  Gimages({required this.imag, required this.ind});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 100,
      child: ind
          ? Image.network(
              imag,
              fit: BoxFit.contain,
            )
          : Image.asset(
              "images/pexels-pixabay-45201.jpg",
              fit: BoxFit.contain,
            ),
    );
  }
}

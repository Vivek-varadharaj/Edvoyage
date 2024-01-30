import 'package:flutter/material.dart';
import 'colors.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: primaryColor,
    );
  }
}

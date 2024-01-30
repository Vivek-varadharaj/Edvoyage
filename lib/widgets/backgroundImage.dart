import 'package:flutter/material.dart';
import '../utils/avatar.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Image.asset(background,
        fit:BoxFit.fitWidth,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}


import 'package:flutter/material.dart';

class LongArrow extends StatelessWidget {
  const LongArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1st Year",
                style: TextStyle(fontSize: 14,  fontFamily: 'Roboto',fontWeight: FontWeight.w600),
              ),
              Image.asset("assets/Vector 61.png"),
              Text(
                "\$4000",
                style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}

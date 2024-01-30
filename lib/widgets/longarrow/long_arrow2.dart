import 'package:flutter/cupertino.dart';

class longarrow2 extends StatelessWidget {
  const longarrow2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "3rd Year",
            style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
          ),
          Image.asset("assets/Vector 61.png"),
          // ClipRect(
          //   child: CustomPaint(
          //     size: Size(MediaQuery.of(context).size.width, 700),
          //     painter: ArrowPainter(),
          //   ),
          // ),
          Text(
            "\$4000",
            style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

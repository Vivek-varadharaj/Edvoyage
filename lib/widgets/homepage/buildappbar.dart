import 'package:flutter/material.dart';
import '../../screens/notification/notification.dart';
import '../../utils/colors/colors.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.2,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Container(
      width: 200,
      height: 200,
      child: Image.asset('edvoyagelogo1'),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: primaryColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
        },
      ),
    ],
  );
}

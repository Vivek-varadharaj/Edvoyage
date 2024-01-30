import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/avatar.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/long_button.dart';

class ProfileFeed extends StatefulWidget {
  @override
  _ProfileFeedState createState() => _ProfileFeedState();
}

class _ProfileFeedState extends State<ProfileFeed>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: 16.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        color: titlecolor);
    return Scaffold(
      // floatingActionButton: _tabController!.index == 0
      //     ? FloatingActionButton(
      //         backgroundColor: secondaryColor,
      //         child: Icon(Icons.add),
      //         onPressed: () => print(Localizations.localeOf(context)),
      //       )
      //     : Container(),
      // backgroundColor: color3,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(soon),
          ),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 15,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Fluttertoast.showToast(
          //       msg: 'You will be notify through SMS', // Your message here
          //       toastLength: Toast.LENGTH_SHORT, // Duration of the message
          //       gravity: ToastGravity.BOTTOM, // Location of the message on the screen
          //       backgroundColor: Colors.black.withOpacity(0.7), // Background color
          //       textColor: Colors.white, // Text color
          //     );
          //   },
          //   style: ElevatedButton.styleFrom(
          //     primary:  primaryColor,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10), // Button's border radius
          //     ),
          //     textStyle: TextStyle(
          //       fontSize: 16, // Text font size
          //       fontWeight: FontWeight.bold, // Text font weight
          //     ),
          //   ),
          //   child: Text('NOTIFY ME'), // Text displayed on the button
          // )
        ],
      ),
    );
  }
}

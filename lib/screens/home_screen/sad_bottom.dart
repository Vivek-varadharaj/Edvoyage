import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../utils/BottomNavigation/bottom_navigation.dart';
import '../../utils/colors/colors.dart';
import '../Cavity_Screen/cavity.dart';
import '../profile/profile_Screen.dart';
import '../teach_screen/tech_home_screen.dart';
import 'sad_mood.dart';

class SadBottom extends StatefulWidget {
  const SadBottom({Key? key}) : super(key: key);

  @override
  State<SadBottom> createState() => _SadBottomState();
}

class _SadBottomState extends State<SadBottom> {
  final List<Widget> _children = [
    ProfileScreen(),
    Cavity_screen(),
    // Sad(),
    TeachHome(),
    // OverseasOne(),
  ];

  int selectedIndex = 2;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    final labelTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(fontFamily: 'Roboto', fontSize: 8.0);

    return Obx(() {
      int index = controller.tabIndex.toInt();
      return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: _children[selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 50.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: secondaryColor,
            unselectedItemColor: primaryColor,
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle: labelTextStyle,
            unselectedLabelStyle: labelTextStyle,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/frame.png")),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/diamonds.png")),
                label: 'SEARCH',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Group 98.png")),
                label: 'CART',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/book.png")),
                label: 'ACCOUNT',
              ),
              // BottomNavigationBarItem(
              //   icon: ImageIcon(AssetImage("assets/airplane.png")),
              //   label: 'SEARCH',
              // ),
            ],
          ),
        ),
      );
    });
  }
}

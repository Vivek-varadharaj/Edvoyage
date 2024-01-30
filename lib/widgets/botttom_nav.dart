import 'package:flutter/material.dart';
import 'package:frontend/screens/profile/profile_Screen.dart';
import '../screens/comingsoon.dart';
import '../screens/home_screen/homeScreen.dart';
import '../utils/colors/colors.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  final Function()? onTap;
  final int selectedIndex;

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(fontFamily: 'Roboto', fontSize: 8.0);

    return SizedBox(
      height: 50.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: secondaryColor,
        unselectedItemColor: primaryColor,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: labelTextStyle,
        unselectedLabelStyle: labelTextStyle,
        onTap: (index) {
          // Handle navigation for each index
          setState(() {
            _selectedIndex = index;
          });

          switch (_selectedIndex) {
            case 0:
              // Navigate to HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
            case 1:
              // Navigate to ProfileScreen or any other screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ComingSoon()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ComingSoon()),
              );
              break;
          }

          widget.onTap?.call(); // Notify the parent widget about the change
        },
        items: [
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
            label: 'BOOK',
          ),
        ],
      ),
    );
  }
}

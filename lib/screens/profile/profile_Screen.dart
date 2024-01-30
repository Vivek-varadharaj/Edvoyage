import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/home_screen/homeScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import 'profile_Tab/profile_about.dart';
import 'profile_Tab/profile_application.dart';
import 'profile_Tab/profile_favorites.dart';
import 'profile_Tab/profile_feed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  File? _image;

  ImageProvider? path;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadImage(); // Load previously saved image when the app starts
  }

  Future<void> _loadImage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final imagePath = sharedPreferences.getString('image');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final appDir = await getApplicationDocumentsDirectory();
      const fileName = "user_image.png";
      final savedImage = File("${appDir.path}/$fileName");

      // Save the picked image to the specified file
      await pickedImage.saveTo(savedImage.path);

      setState(() {
        _image = savedImage;
      });

      _saveImagePath(savedImage.path);
    }
  }

  Future<void> _saveImagePath(String imagePath) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('image', imagePath);
  }

  Measurements? size;

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            )),
            child: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white,
          elevation: 3,
          centerTitle: true,
          title: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(edvoyagelogo1),
          ),
        ),
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final sharedPreferences = snapshot.data!;
            final name = sharedPreferences.getString('name');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: size?.hp(24),
                      width: double.infinity,
                      color: thirdColor,
                    ),
                    Container(
                      height: size?.hp(14),
                      decoration: BoxDecoration(color: primaryColor),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size?.hp(5),
                        ),
                        Container(
                          alignment: const Alignment(-0.8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: _image != null
                                        ? FileImage(_image!)
                                        : const AssetImage(
                                                'assets/images/avatar.png')
                                            as ImageProvider,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 70,
                                      left: 85,
                                    ),
                                    child: Container(
                                      width: size?.wp(8),
                                      height: size?.hp(8),
                                      decoration: BoxDecoration(
                                        color: thirdColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            // offset: const Offset(2, 3),

                                            // reduce it
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: _pickImage,
                                        child: const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 18,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              vGap(5),
                              Text(
                                '$name',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  color: whiteColor,
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: Colors.grey,
                    labelColor: secondaryColor,
                    controller: _tabController,
                    indicatorColor: Cprimary,
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[200],
                            ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(child: Text('Feed ')),
                      Tab(child: Text('About')),
                      Tab(child: Text('Favourites')),
                      Tab(child: Text('Applications')),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ProfileFeed(),
                      ProfileAbout(),
                      ProfileFevourites(),
                      ProfileApplication(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../../../utils/colors/colors.dart';
// import '../../../utils/responsive.dart';
// import 'package:http/http.dart' as http;
// import '../../_env/env.dart';

// class GalleryTab extends StatefulWidget {
//   final int id;

//   const GalleryTab({Key? key, required this.id}) : super(key: key);

//   @override
//   _GalleryTabState createState() => _GalleryTabState();
// }

// class UniversityImageService {
//   Future<Map<String, dynamic>> entranceimages;
//   Future<Map<String, dynamic>> lecturerooms;
//   Future<Map<String, dynamic>> laboratory;

//   UniversityImageService(int id) {
//     entranceimages = getUniversityEntranceImages(id);
//     entranceimages.then((value) {
//       print(value);
//     });
//     lecturerooms = getLectureRoomsImages(id);
//     lecturerooms.then((value) {
//       print(value);
//     });
//     laboratory = getLaboratoryImages(id);
//     laboratory.then((value) {
//       print(value);
//     });
//   }

//   static Future<Map<String, dynamic>> getUniversityEntranceImages(
//       int id) async {
//     final response =
//         await http.get(Uri.parse(BaseUrl.universityentrance + '?id=$id'));

//     if (response.statusCode == 200) {
//       print(response.body);
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load university entrance images');
//     }
//   }

//   static Future<Map<String, dynamic>> getLectureRoomsImages(int id) async {
//     final response = await http.get(Uri.parse(BaseUrl.laboratory + '?id=$id'));

//     if (response.statusCode == 200) {
//       print(response.body);
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load lecture rooms images');
//     }
//   }

//   static Future<Map<String, dynamic>> getLaboratoryImages(int id) async {
//     final response =
//         await http.get(Uri.parse(BaseUrl.lecturerooms + '?id=$id'));

//     if (response.statusCode == 200) {
//       print(response.body);
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load laboratory images');
//     }
//   }
// }

// class _GalleryTabState extends State<GalleryTab> {
//   late UniversityImageService imageService;

//   @override
//   void initState() {
//     super.initState();
//     imageService = UniversityImageService(widget.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cblack10,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: White, borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "University Entrance",
//                           style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Cprimary),
//                         ),
//                         Divider(
//                           thickness: 1,
//                           color: text5,
//                         ),
//                         Container(
//                           height: getHeight(context) / 5.6,
//                           child: Center(
//                             child: FutureBuilder(
//                               future: imageService.entranceimages,
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return CircularProgressIndicator();
//                                 } else if (snapshot.hasError) {
//                                   return Text('Error: ${snapshot.error}');
//                                 } else {
//                                   Map<String, dynamic> data =
//                                       snapshot.data as Map<String, dynamic>;
//                                   return Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Image.network(
//                                         data['universityentrance1'],
//                                         width: 150,
//                                         height: 150,
//                                         fit: BoxFit.cover,
//                                       ),
//                                       Image.network(
//                                         'URL_OF_YOUR_SECOND_IMAGE',
//                                         width: 150,
//                                         height: 150,
//                                         fit: BoxFit.cover,// Adjust the BoxFit based on your requirements
//       ),
//     ],
//   ),
// );

//                         ),
//                       ],
//                     ),
//                   ),
//                   vGap(20),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: White, borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Lectures Rooms",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w700,
//                               color: Cprimary),
//                         ),
//                         Divider(
//                           thickness: 1,
//                           color: text5,
//                         ),
//                         Container(
//                           height: getHeight(context) / 5.6,
//                           child: Center(
//                             child: GridView.builder(
//                                 itemCount: 2,
//                                 gridDelegate:
//                                     const SliverGridDelegateWithMaxCrossAxisExtent(
//                                         maxCrossAxisExtent: 200,
//                                         childAspectRatio: 3 / 3,
//                                         crossAxisSpacing: 20,
//                                         mainAxisSpacing: 20),
//                                 itemBuilder: (BuildContext ctx, index) {
//                                   return Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             color: cblack10),
//                                       ));
//                                 }),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   vGap(20),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: White, borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "University Entrance",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w700,
//                               color: Cprimary),
//                         ),
//                         Divider(
//                           thickness: 1,
//                           color: text5,
//                         ),
//                         Container(
//                           height: getHeight(context) / 5.6,
//                           child: Center(
//                             child: GridView.builder(
//                                 itemCount: 2,
//                                 gridDelegate:
//                                     const SliverGridDelegateWithMaxCrossAxisExtent(
//                                         maxCrossAxisExtent: 200,
//                                         childAspectRatio: 3 / 3,
//                                         crossAxisSpacing: 20,
//                                         mainAxisSpacing: 20),
//                                 itemBuilder: (BuildContext ctx, index) {
//                                   return Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             color: cblack10),
//                                       ));
//                                 }),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   vGap(10),
//                   Center(
//                     child: Text(
//                       "--------- De voyage --------",
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: grey2),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../_env/env.dart';

class GalleryTab extends StatefulWidget {
  final int id;

  const GalleryTab({Key? key, required this.id}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class UniversityImageService {
  late Future<Map<String, dynamic>> entranceimages;
  late Future<Map<String, dynamic>> lecturerooms;
  late Future<Map<String, dynamic>> laboratory;

  UniversityImageService(int id) {
    entranceimages = getUniversityEntranceImages(id);
    lecturerooms = getLectureRoomsImages(id);
    laboratory = getLaboratoryImages(id);
  }

  static Future<Map<String, dynamic>> getUniversityEntranceImages(
      int id) async {
    final response =
        await http.get(Uri.parse(BaseUrl.universityentrance + '?id=$id'));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load university entrance images');
    }
  }

  static Future<Map<String, dynamic>> getLectureRoomsImages(int id) async {
    final response = await http.get(Uri.parse(BaseUrl.laboratory + '?id=$id'));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load lecture rooms images');
    }
  }

  static Future<Map<String, dynamic>> getLaboratoryImages(int id) async {
    final response =
        await http.get(Uri.parse(BaseUrl.lecturerooms + '?id=$id'));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load laboratory images');
    }
  }
}

class _GalleryTabState extends State<GalleryTab> {
  late UniversityImageService imageService;

  // Initialize these fields with a default value
  late Future<Map<String, dynamic>> entranceimages;
  late Future<Map<String, dynamic>> lecturerooms;
  late Future<Map<String, dynamic>> laboratory;

  @override
  void initState() {
    super.initState();

    // Initialize the imageService
    imageService = UniversityImageService(widget.id);

    // Fetch data and update the Future fields
    entranceimages = imageService.entranceimages;
    lecturerooms = imageService.lecturerooms;
    laboratory = imageService.laboratory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cblack10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: White, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "University Entrance",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Cprimary),
                        ),
                        Divider(
                          thickness: 1,
                          color: text5,
                        ),
                        Container(
                          height: getHeight(context) / 5.6,
                          child: Center(
                            child: FutureBuilder(
                              future: imageService.entranceimages,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  Map<String, dynamic> data =
                                      snapshot.data as Map<String, dynamic>;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        data['universityentrance1'] ??
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Ashland_University_Entrance.jpg/1599px-Ashland_University_Entrance.jpg?20170803195644',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        data['universityentrance2'] ??
                                            'https://astroffconsultants.com/wp-content/uploads/2018/01/University-Entrance-Requirements-Becoming-More-Holistic.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vGap(20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: White, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lectures Rooms",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Cprimary),
                        ),
                        Divider(
                          thickness: 1,
                          color: text5,
                        ),
                        Container(
                          height: getHeight(context) / 5.6,
                          child: Center(
                            child: FutureBuilder(
                              future: imageService.lecturerooms,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  Map<String, dynamic> data =
                                      snapshot.data as Map<String, dynamic>;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        data['lecturerooms1'] ??
                                            'https://sound-zero.com/wp-content/uploads/2020/12/product-school-Lo2SauLBP7g-unsplash-1536x1024.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        data['lecturerooms2'] ??
                                            'https://sound-zero.com/wp-content/uploads/2020/12/miguel-henriques-8atMWER8bI-unsplash-1536x1024.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vGap(20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: White, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Laboratory",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Cprimary),
                        ),
                        Divider(
                          thickness: 1,
                          color: text5,
                        ),
                        Container(
                          height: getHeight(context) / 5.6,
                          child: Center(
                            child: FutureBuilder(
                              future: imageService.laboratory,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  Map<String, dynamic> data =
                                      snapshot.data as Map<String, dynamic>;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        data['laboratory1'] ??
                                            'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/ts/20220131080401/ri/1000/src/images/Article_Images/ImageForArticle_22064_16436342404173431.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        data['laboratory2'] ??
                                            'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/ts/20220131083012/ri/673/picture/2022/1/shutterstock_1555866449.jpg',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vGap(10),
                  Center(
                    child: Text(
                      "--------- De voyage --------",
                      style: TextStyle(
                       fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: grey2),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

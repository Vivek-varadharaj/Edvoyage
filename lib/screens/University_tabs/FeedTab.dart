import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';

class FeedTab extends StatefulWidget {
  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 5, // Number of sample feed items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 25, 117, 28),
                          child: Text(
                            "T",
                            style: TextStyle(
                             fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        hGap(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe", // Sample user name
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 17,
                                color: Cprimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "2 Days ago", // Sample date
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                color: Cprimary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: ttext2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vGap(5),
                        Text(
                          "Heading Text Goes Here", // Sample feed title
                          style: TextStyle(
                            fontSize: 17,
                             fontFamily: 'Roboto',
                            color: titlecolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        vGap(5),
                        Text(
                          "Sample feed content. This is just a placeholder text for the feed content. You can replace it with your actual data."
                          "Sample feed content. This is just a placeholder text for the feed content. You can replace it with your actual data.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                       fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        vGap(5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

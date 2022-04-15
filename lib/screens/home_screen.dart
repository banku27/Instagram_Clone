import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/constants/story_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int pageIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  void selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.black,
      body: getBody(),
      bottomNavigationBar: bottomTab(),
    );
  }

  Widget bottomTab() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_icon.svg"
          : "assets/images/love_active_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: SvgPicture.asset(
                bottomItems[index],
                width: 27,
              ),
            );
          }),
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/images/camera_icon.svg',
            width: 30,
          ),
          const Text(
            'Instagram',
            style: TextStyle(
                fontFamily: 'Billabong', fontSize: 35, letterSpacing: 1),
          ),
          SvgPicture.asset(
            "assets/images/message_icon.svg",
            width: 30,
          ),
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                stories.length,
                (index) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 10),
                      width: 68,
                      height: 68,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF9B2282), Color(0xFFEEA863)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(stories[index]['img']),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        stories[index]['name'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

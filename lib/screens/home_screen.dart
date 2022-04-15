import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Widget bottomTab() {
    List bottomItems = [
      pageIndex == 0 ? "assets/home_active_icon.svg" : "assets/home_icon.svg",
      pageIndex == 1
          ? "assets/search_active_icon.svg"
          : "assets/search_icon.svg",
      pageIndex == 2
          ? "assets/upload_active_icon.svg"
          : "assets/upload_icon.svg",
      pageIndex == 3 ? "assets/love_active_icon.svg" : "assets/love_icon.svg",
      pageIndex == 4
          ? "assets/account_active_icon.svg"
          : "assets/account_icon.svg",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomTab(),
    );
  }
}

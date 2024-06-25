import 'package:fun_anim/ressources/app_colors_ressources.dart';
import 'package:fun_anim/ressources/assets_images_ressources.dart';
import 'package:fun_anim/screens/home/widgets/header_menu_widget.dart';
import 'package:fun_anim/screens/home/widgets/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 64.0;
  double scale = 1.0;
  double topM = 75.0;
  double rightPadding = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 450),
          alignment: Alignment.centerRight,
          child: AnimatedPadding(
            padding: EdgeInsets.only(right: rightPadding),
            duration: const Duration(milliseconds: 450),
            child: Container(
              width: 100.w,
              height: 100.h,
              alignment: Alignment.topRight,
              margin: height > 64.0 ? const EdgeInsets.only(right: 4.0) : null,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  image: const DecorationImage(
                      image: AssetImage(AssetsImagesRessources.bg),
                      fit: BoxFit.cover)),
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: topM, right: 25.0),
                duration: const Duration(milliseconds: 450),
                child: SizedBox(
                  width: 32,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.person_fill,
                        color: AppColorsRessources.grey,
                        size: 32,
                      )),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 68,
            left: 0,
            width: 100.w - 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    width: 70.w,
                    height: height,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: AppColorsRessources.grey,
                        borderRadius: BorderRadius.circular(32)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HeaderMenuWidget(
                              onTap: () {
                                setState(() {
                                  height = height == 64.0 ? 90.h : 64.0;
                                  scale = scale == 1.0 ? 0.7 : 1.0;
                                  topM = topM == 75.0 ? 32.0 : 75.0;
                                  rightPadding =
                                      rightPadding == 0.0 ? 8.0 : 0.0;
                                });
                              },
                              showClose: height > 64.0),
                          MenuWidget()
                        ],
                      ),
                    )),
              ],
            )),
      ]),
    );
  }
}

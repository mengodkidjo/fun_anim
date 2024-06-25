import 'package:fun_anim/ressources/app_colors_ressources.dart';
import 'package:fun_anim/ressources/vertical_space_ressources.dart';
import 'package:fun_anim/screens/home/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Message",
      "Trending",
      "Bookmarks",
      "Gallery",
      "Settings",
      "Notification",
      "People"
    ];
    List<IconData> iconDatas = [
      Icons.mark_email_read_outlined,
      Icons.trending_up_sharp,
      Icons.bookmark_border_outlined,
      Icons.image_outlined,
      Icons.settings_outlined,
      Icons.notifications_active_outlined,
      Icons.groups_2_outlined
    ];
    return Container(
        width: 70.w,
        height: 90.h,
        // padding: const EdgeInsets.all(12.0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: AppColorsRessources.grey,
            borderRadius: BorderRadius.circular(32)),
        child: AnimatedList(
          initialItemCount: titles.length,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) {
            return MenuItemWidget(
              iconData: iconDatas.elementAt(index),
              title: titles.elementAt(index),
              selected: index == 3,
              badge: index == 5 ? "8" : null,
            );
          },
        ));
  }
}

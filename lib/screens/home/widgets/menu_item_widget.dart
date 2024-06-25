import 'package:fun_anim/ressources/app_colors_ressources.dart';
import 'package:fun_anim/ressources/horizontal_space_ressources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget(
      {super.key,
      required this.iconData,
      required this.title,
      this.badge,
      required this.selected});

  final IconData iconData;
  final String title;
  final String? badge;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: 56,
              height: 40,
              decoration: BoxDecoration(
                  color: selected ? AppColorsRessources.primary : Colors.white,
                  borderRadius: BorderRadius.circular(24)),
              child: Icon(
                iconData,
                size: 24,
              )),
          HorizontalSpaceRessources.h16,
          Text(
            title,
            style: GoogleFonts.dmSans(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          if (badge != null) HorizontalSpaceRessources.h16,
          if (badge != null)
            Container(
              width: 32,
              height: 40,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Text(
                badge!,
                style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

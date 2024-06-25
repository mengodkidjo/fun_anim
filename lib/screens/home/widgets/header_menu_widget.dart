import 'package:fun_anim/ressources/horizontal_space_ressources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderMenuWidget extends StatefulWidget {
  const HeaderMenuWidget(
      {super.key, required this.onTap, required this.showClose});

  final Function onTap;
  final bool showClose;

  @override
  State<HeaderMenuWidget> createState() => _HeaderMenuWidgetState();
}

class _HeaderMenuWidgetState extends State<HeaderMenuWidget> {
  double width = 50.w;
  Offset offset = const Offset(0.03, 0);

  Duration duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // if (!widget.showClose)
        Visibility(
            visible: !widget.showClose,
            child: SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                  onPressed: () {
                    widget.onTap();
                    // setState(() {
                    offset = offset.dx == 0.03
                        ? const Offset(-0.06, 0)
                        : const Offset(0.03, 0);
                    // offset2 = offset.dx == 0 ? Offset(-0.23, 0) : Offset(0, 0);
                    // });
                  },
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                  ),
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 24,
                  )),
            )),

        AnimatedSlide(
            offset: offset,
            duration: duration,
            child: Row(
              children: [
                SizedBox(
                    width: width,
                    height: 48,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey[500],
                          ),
                          hintText: "Search...",
                          hintStyle: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide.none)),
                    )),
                if (widget.showClose)
                  Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                        onPressed: () {
                          widget.onTap();
                          // setState(() {
                          offset = offset.dx == 0.03
                              ? const Offset(-0.06, 0)
                              : const Offset(0.03, 0);
                          // offset2 =
                          //     offset.dx == 0 ? Offset(-0.23, 0) : Offset(0, 0);
                          // } );
                        },
                        style: const ButtonStyle(
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.black,
                          size: 16,
                        )),
                  )
              ],
            )),
      ],
    );
  }
}

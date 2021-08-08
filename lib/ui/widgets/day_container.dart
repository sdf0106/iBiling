import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class DayContainer extends StatefulWidget {
  final String day;
  final String date;
  final int index;
  final isActive;
  final int selectedIndex;

  const DayContainer({
    Key? key,
    required this.day,
    required this.date,
    required this.index,
    required this.isActive,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _DayContainerState createState() => _DayContainerState();
}

class _DayContainerState extends State<DayContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 50,
      decoration: BoxDecoration(
        color: widget.isActive ? Style.Colors.lightGreen : Style.Colors.darker,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 12.0),
        child: Column(
          children: [
            Text(
              widget.day.substring(0, 2),
              style: TextStyle(
                fontSize: 14,
                color: widget.isActive ? Colors.white : Color(0xFFD2D2D2),
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              widget.date,
              style: TextStyle(
                color: widget.isActive ? Colors.white : Color(0xFFD2D2D2),
                fontSize: 14.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            SvgPicture.asset(
              'assets/images/verticaldiv.svg',
              height: 1.0,
              width: 14.0,
              color: widget.isActive ? Colors.white : Color(0xFFD2D2D2),
            ),
          ],
        ),
      ),
    );
  }
}

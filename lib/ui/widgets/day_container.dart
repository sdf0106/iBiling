import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class DayContainer extends StatefulWidget {
  final String day;
  final String date;
  final index;

  const DayContainer({
    Key? key,
    required this.day,
    required this.date,
    required this.index,
  }) : super(key: key);

  @override
  _DayContainerState createState() => _DayContainerState();
}

class _DayContainerState extends State<DayContainer> {
  @override
  Widget build(BuildContext context) {
    Color _containerColor = Style.Colors.darker;
    Color _textColor = Color(0xffD1D1D1);
  

    return GestureDetector(
      onTap: () {
        setState(() {
          _containerColor = Style.Colors.lightGreen;
          _textColor = Color(0xffD1D1D1);
        });
      },
      child: Container(
        color: _containerColor,
        height: 76,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 12.0),
          child: Column(
            children: [
              Text(
                widget.day.substring(0, 2),
                style: TextStyle(
                  fontSize: 14,
                  color: _textColor,
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
                  color: _textColor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

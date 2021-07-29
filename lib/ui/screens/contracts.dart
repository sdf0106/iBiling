import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/calendar_container.dart';

class Contracts extends StatefulWidget {
  const Contracts({Key? key}) : super(key: key);

  @override
  _ContractsState createState() => _ContractsState();
}
var pickedDate = DateTime.now();
class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarContainer(),
        Expanded(
          child: Container(
            child: Center(
              child: SvgPicture.asset('assets/images/doc.svg',
              height: 88.0,
              width: 88.0,
              color: Color(0xFF999999) //Style.Colors.darker,
              ),
            ),
          ),
        )
      ],
    );
  }
}

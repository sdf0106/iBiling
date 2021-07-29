import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class FromToDate extends StatefulWidget {
  const FromToDate({Key? key}) : super(key: key);

  @override
  _FromToDateState createState() => _FromToDateState();
}

class _FromToDateState extends State<FromToDate> {
  DateTime? _from;
  DateTime? _to;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2022),
            ).then((date) {
              setState(() {
                _from = date ;
              });
            });
          },
          child: Container(
            height: 38.0,
            width: 117,
            color: Style.Colors.dark,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 12.0, left: 12.0, bottom: 11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _from == null ? 'From':_from.toString(),
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xFFDADADA),
                    size: 14.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 12.0),
        SvgPicture.asset('assets/images/line2.svg'),
        SizedBox(width: 12.0),
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2022),
            ).then((date) {
              setState(() {
                _to = date;
              });
            });
          },
          child: Container(
            height: 38,
            width: 117,
            color: Style.Colors.dark,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 12.0, left: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _to == null ? 'To' :_to.toString(),
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xFFDADADA),
                    size: 14.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

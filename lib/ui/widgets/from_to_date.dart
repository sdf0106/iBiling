import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/bloc/history/history_bloc.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class FromToDate extends StatefulWidget {
  const FromToDate({Key? key}) : super(key: key);
  @override
  _FromToDateState createState() => _FromToDateState();
}

class _FromToDateState extends State<FromToDate> {
  DateTime? _from;
  DateTime? _to;

  //String formattedDate = DateFormat('yyyy-MM-dd').format(_from!);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HistoryBloc>(context, listen: false);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2021),
              lastDate: DateTime(2022),
            ).then((date) {
              setState(() {
                _from = date;
                bloc.setInitialDate = date.toString();
                if (!(bloc.getInitialDate == ' ' || bloc.getLastDate == ' ')) {
                  bloc.add(LoadHistoryEvent(
                    initialDate: bloc.getInitialDate,
                    lastDate: bloc.getLastDate,
                  ));
                }
              });
            });
          },
          child: Container(
            height: 38.0,
            width: 117,
            color: Style.Colors.dark,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, right: 12.0, left: 12.0, bottom: 11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _from == null ? 'From' : _from.toString().substring(0, 10),
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
              firstDate: DateTime(2021),
              lastDate: DateTime(2022),
            ).then((date) {
              setState(() {
                _to = date;
               // _to = DateFormat.YEAR_MONTH_DAY;
                bloc.setLastDate = date.toString();
                if (!(bloc.getInitialDate == ' ' || bloc.getLastDate == ' ')) {
                  bloc.add(LoadHistoryEvent(
                    initialDate: bloc.getInitialDate,
                    lastDate: bloc.getLastDate,
                  ));
                }
              });
            });
          },
          child: Container(
            height: 38,
            width: 117,
            color: Style.Colors.dark,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, right: 12.0, left: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _to == null ? 'To' : _to.toString().substring(0, 10),
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

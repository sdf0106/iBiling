import 'package:flutter/material.dart';
import 'package:ibiling/ui/screens/contracts.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/day_container.dart';
import 'package:jiffy/jiffy.dart';

class CalendarContainer extends StatefulWidget {
  const CalendarContainer({Key? key}) : super(key: key);

  @override
  _CalendarContainerState createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
  var _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      color: Style.Colors.darker,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 14.0, 11.0, 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${Jiffy(pickedDate).format('MMMM')},${Jiffy(pickedDate).format('yyyy')}",
                  style: TextStyle(
                    color: Color(0xFFDADADA),
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pickedDate = pickedDate.subtract(Duration(days: 7));
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color(0xFFD1D1D1),
                    ),
                    SizedBox(height: 32.0),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pickedDate = pickedDate.add(Duration(days: 7));
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Color(0xFFD1D1D1),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Container(
              height: 76,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, index) {
                  return SizedBox(
                    width: 18.0,
                  );
                },
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      _selectedIndex = index;
                    },
                    child: DayContainer(
                      selectedIndex: _selectedIndex,
                      index: index,
                      isActive: _selectedIndex == index,
                      day: Jiffy(
                              pickedDate.add(Duration(days: index)).toString())
                          .format('E'),
                      date: Jiffy(
                              pickedDate.add(Duration(days: index)).toString())
                          .format('dd'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

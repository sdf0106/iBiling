import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/widgets/from_to_date.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    bool _check1 = false;
    bool _check2 = false;
    bool _check3 = false;
    bool _check4 = false;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Style.Colors.darkest,
        title: Text(
          'Filters',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 28.0,
          left: 16.0,
          bottom: 28.0,
          right: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 14.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _check1 = !_check1;
                          if (_check2) {
                            _check2 = false;
                          }
                          if (_check3) {
                            _check3 = false;
                          }
                          if (_check4) {
                            _check4 = false;
                          }
                          print(_check1);
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(_check1 == true
                                ? 'assets/images/tick_sqr_selected.svg'
                                : 'assets/images/tick_sqr.svg'),
                            SizedBox(width: 10.0),
                            Text(
                              'Paid',
                              style: TextStyle(
                                  color: Color(0xFFF2F2F2),
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 95.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _check2 = !_check2;
                          if (_check1) {
                            _check1 = false;
                          }
                          if (_check3) {
                            _check3 = false;
                          }
                          if (_check4) {
                            _check4 = false;
                          }
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(_check2 == true
                                ? 'assets/images/tick_sqr_selected.svg'
                                : 'assets/images/tick_sqr.svg'),
                            SizedBox(width: 10.0),
                            Text(
                              'Rejected by IQ',
                              style: TextStyle(
                                  color: Color(0xFFF2F2F2),
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _check3 = !_check3;
                          if (_check2) {
                            _check2 = false;
                          }
                          if (_check1) {
                            _check1 = false;
                          }
                          if (_check4) {
                            _check4 = false;
                          }
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(_check3 == true
                                ? 'assets/images/tick_sqr_selected.svg'
                                : 'assets/images/tick_sqr.svg'),
                            SizedBox(width: 10.0),
                            Text(
                              'in process',
                              style: TextStyle(
                                  color: Color(0xFFF2F2F2),
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 58.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _check4 = !_check4;
                          if (_check1) {
                            _check1 = false;
                          }
                          if (_check3) {
                            _check3 = false;
                          }
                          if (_check2) {
                            _check2 = false;
                          }
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(_check4 == true
                                ? 'assets/images/tick_sqr_selected.svg'
                                : 'assets/images/tick_sqr.svg'),
                            SizedBox(width: 10.0),
                            Text(
                              'Rejected by Payme',
                              style: TextStyle(
                                  color: Color(0xFFF2F2F2),
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Text(
                  'Date',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                FromToDate(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 40.0,
                    width: 164.0,
                    decoration: BoxDecoration(
                      color: Style.Colors.darkGreen.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Style.Colors.darkGreen,
                          fontFamily: 'Ubuntu',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 40.0,
                    width: 164.0,
                    decoration: BoxDecoration(
                      color: Style.Colors.darkGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFFFDFDFD),
                          fontFamily: 'Ubuntu',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class TransactionCard extends StatefulWidget {
  TransactionCard({Key? key}) : super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Style.Colors.dark,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 12.0,
          left: 10.0,
          right: 12.0,
          bottom: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/paper.svg'),
                    SizedBox(width: 8.6),
                    Text(
                      '№ 154',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFE7E7E7),
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/images/paid.svg'),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Text(
                  'NSP:',
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Yo\'ldosheva Ziyoda',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Row(
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '1,200,000 UZS',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Row(
              children: [
                Text(
                  'Last invoice',
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '№ 156',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Number of invoices:',
                      style: TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontFamily: 'Ubuntu',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '6',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontFamily: 'Ubuntu',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '31.01.2021',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
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

// Container(
//       height: 155.0,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Style.Colors.dark,
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 34.0,
//             child: ListTile(
//               leading: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Row(
//                   children: [
//                     SvgPicture.asset('assets/images/paper.svg'),
//                     SizedBox(
//                       width: 8.0,
//                     ),
//                     Text(
//                       '№ 154',
//                       style: TextStyle(
//                         fontSize: 14.0,
//                         color: Color(0xFFE7E7E7),
//                         fontFamily: 'Ubuntu',
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               trailing: SvgPicture.asset('assets/images/paid.svg'),
//             ),
//           ),
//           SizedBox(height: 1.0),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 20.0,
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Text(
//                     'NSP:',
//                     style: TextStyle(
//                       color: Color(0xFFE7E7E7),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     'Yo\'ldosheva Ziyoda',
//                     style: TextStyle(
//                       color: Color(0xFF999999),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 20.0,
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Text(
//                     'Amount',
//                     style: TextStyle(
//                       color: Color(0xFFE7E7E7),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     '1,200,000 UZS',
//                     style: TextStyle(
//                       color: Color(0xFF999999),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 20.0,
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Text(
//                     'Last Invoice',
//                     style: TextStyle(
//                       color: Color(0xFFE7E7E7),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     '№ 156',
//                     style: TextStyle(
//                       color: Color(0xFF999999),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 20.0,
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Text(
//                     'Number of invoices:',
//                     style: TextStyle(
//                       color: Color(0xFFE7E7E7),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     '6',
//                     style: TextStyle(
//                       color: Color(0xFF999999),
//                       fontFamily: 'Ubuntu',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//               trailing: Text(
//                 '31.01.2021',
//                 style: TextStyle(
//                   color: Color(0xFF999999),
//                   fontSize: 14.0,
//                   fontFamily: 'Ubuntu',
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

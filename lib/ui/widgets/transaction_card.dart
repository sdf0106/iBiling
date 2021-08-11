import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class TransactionCard extends StatefulWidget {
  TransactionCard({
    Key? key,
    required this.nSP,
    required this.lastInvoice,
    required this.amount,
    required this.contractStatus,
    required this.date,
    required this.numberOfInvoices,
  }) : super(key: key);
  String nSP;
  double lastInvoice;
  double amount;
  String contractStatus;
  String date;
  double numberOfInvoices;
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  String status = ' ';

  @override
  Widget build(BuildContext context) {
    if(widget.contractStatus == 'Paid'){
    status = 'paid';
  }else if(widget.contractStatus == 'In process'){
    status = 'inProcess';
  }else if(widget.contractStatus == 'Rejected by Payme'){
    status = 'rejected';
  }
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
                SvgPicture.asset('assets/images/$status.svg'),
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
                  widget.nSP,
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
                  '${widget.amount} UZS',
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
                  '№ ${widget.lastInvoice}',
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
                      widget.numberOfInvoices.toString(),
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
                  widget.date.substring(0,10),
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


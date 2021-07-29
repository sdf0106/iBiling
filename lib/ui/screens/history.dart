import 'package:flutter/material.dart';
import 'package:ibiling/ui/widgets/from_to_date.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date',
            style: TextStyle(
              color: Color(0xFF999999),
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FromToDate(),
        ],
      ),
    );
  }
}

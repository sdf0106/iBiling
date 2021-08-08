import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style/theme.dart' as Style;

class ContractOrInvoice extends StatelessWidget {
  const ContractOrInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Style.Colors.dark,
      
      title: Text(
        'What do you want to create',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        MaterialButton(
          color: const Color(0xFF4E4E4E),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/paper1.svg'),
              SizedBox(width: 16.0),
              Text(
                'Contract',
                style: TextStyle(
                  color: Color(0xFFE7E7E7),
                  fontFamily: 'Ubuntu',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 9.0),
              MaterialButton(
                color: const Color(0xFF4E4E4E),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/paper2.svg'),
                    SizedBox(width: 16.0),
                    Text(
                      'Invoice',
                      style: TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontFamily: 'Ubuntu',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

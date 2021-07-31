import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../style/theme.dart' as Style;

class NewContractFields extends StatefulWidget {
  const NewContractFields({Key? key}) : super(key: key);

  @override
  NewContractFieldsState createState() => NewContractFieldsState();
}

class NewContractFieldsState extends State<NewContractFields> {
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController iTN = TextEditingController();

  String individial = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Person',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              color: Color(0xFFF1F1F1),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 44.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Color(0xFFF1F1F1),
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 14.0, left: 16.0),
              child: DropdownButton(
                dropdownColor: Style.Colors.dark,
                icon: SvgPicture.asset('assets/images/arrow'),
                style: TextStyle(
                  color: Color(0xFFE7E7E7),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Ubuntu',
                  fontSize: 14.0,
                ),
                value: individial,
                onChanged: (newValue) {
                  setState(() {
                    individial = newValue as String;
                  });
                },
                items: <String>[
                  'Individual',
                  'corporation',
                  ' ',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

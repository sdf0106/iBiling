import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class NewInvoiceFields extends StatefulWidget {
  const NewInvoiceFields({Key? key}) : super(key: key);

  @override
  _NewInvoiceFieldsState createState() => _NewInvoiceFieldsState();
}

class _NewInvoiceFieldsState extends State<NewInvoiceFields> {
  bool isFilled = false;
  List<TextEditingController> controllers = [
    TextEditingController(),
  TextEditingController() 
  ];
   void checkTextField() {
    bool temp = true;

    for (var controller in controllers) {
      if (controller.text.isEmpty) temp = false;
    }
    setState(() {
      isFilled = temp;
    });
  }
  String status = ' ';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name of the service',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
              color: Color(0xFFF1F1F1).withOpacity(0.4),
            ),
          ),
          SizedBox(height: 6.0),
          TextField(
            onChanged: (name) {
              checkTextField();
            },
            controller: controllers.first,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              fillColor: Colors.black,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Invoice amount',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
              color: Color(0xFFF1F1F1).withOpacity(0.4),
            ),
          ),
          SizedBox(height: 6.0),
          TextField(
            onChanged: (amount) {
              checkTextField();
            },
            controller: controllers.last,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              fillColor: Colors.black,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Color(0xFFF1F1F1).withOpacity(0.4), width: 1.2),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Status of the invoice',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
              color: Color(0xFFF1F1F1).withOpacity(0.4),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Color(0xFFF1F1F1).withOpacity(0.4),
                  width: 1.2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 14.0, left: 16.0, bottom: 14.0, right: 14.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  dropdownColor: Style.Colors.dark,
                  icon: SvgPicture.asset(
                    'assets/images/arrowdrop.svg',
                    color: Colors.white.withOpacity(0.4),
                    height: 24.0,
                    width: 24.0,
                  ),
                  // iconDisabledColor: Color(0xFF),
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                  ),
                  value: status,
                  onChanged: (status) {
                    setState(() {
                      this.status = status as String;
                    });
                  },
                  items: <String>[
                    ' ',
                    'Individual',
                    'corporation',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            if (isFilled) saveButton(),
        ],
      ),
    );
  }
  Widget saveButton(){
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 44.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Style.Colors.darkGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            'Save contract',
            style: TextStyle(
              color: Color(0xFFFDFDFD),
              fontSize: 16.0,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

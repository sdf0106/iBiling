import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import '../style/theme.dart' as Style;

class NewContractFields extends StatefulWidget {
  const NewContractFields({Key? key}) : super(key: key);

  @override
  NewContractFieldsState createState() => NewContractFieldsState();
}

String typeOfPayer = ' ';
String individualName = ' ';
String date = ' ';
String iTN = ' ';
String addressOfOrg = ' ';
String payment = ' ';
DateTime time = DateTime.now();
class NewContractFieldsState extends State<NewContractFields> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  bool isFilled = false;
  String individual = ' ';
  String paymentStatus = 'Paid';

  late Directory dir;
  late File jsonFile;
  Map<String, dynamic> fileData = {};
 
   toMap(String key, dynamic value){
   fileData['key'] = value;
    return fileData;
  } 
   writeToJson(Map fileData){
     String str = json.encode(fileData);
     return str;
   }

  // void writeToJson(String key, dynamic value) {
  //   Map<String, dynamic> content = {key: value};
  //   Map<String, dynamic> jsonFileContent =
  //       json.decode(jsonFile.readAsStringSync());
  //   jsonFileContent.addAll(content);
  //   jsonFile.writeAsStringSync(json.encode(jsonFileContent));

  //   this.setState(() {
  //     fileData = json.decode(jsonFile.readAsStringSync());
  //   });
  //   print(fileData);
  // }

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/contracts.json");
      setState(() {
        fileData = json.decode(jsonFile.readAsStringSync());
      });
    });
  }

  void checkTextField() {
    bool temp = true;

    for (var controller in controllers) {
      if (controller.text.isEmpty) temp = false;
    }
    setState(() {
      isFilled = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        right: 16.0,
        left: 16.0,
      ),
      child: SingleChildScrollView(
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
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Color(0xFFF1F1F1),
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
                  value: individual,
                  onChanged: (newValue) {
                    setState(() {
                      individual = newValue as String;
                      typeOfPayer = individual;
                      checkTextField();
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
            SizedBox(height: 16.0),
            Text(
              'Individual\'s full name',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontFamily: 'Ubuntu',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6.0),
            TextField(
              controller: controllers[0],
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (man) {
                individualName = man;
                checkTextField();
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Address of the organization',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontFamily: 'Ubuntu',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6.0),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.white,
              controller: controllers[1],
              onChanged: (add) {
                addressOfOrg = add;
                checkTextField();
              },
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16.0),
            Text(
              individual == 'Individual' ? 'ITN' : 'TIN',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontFamily: 'Ubuntu',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6.0),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (itn) {
                iTN = itn;
              },
              cursorColor: Colors.white,
              controller: controllers[2],
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: SvgPicture.asset('assets/images/help.svg'),
                  iconSize: 17,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Style.Colors.darker,
                        content: Container(
                          height: 60.0,
                          child: Column(
                            children: [
                              Text(
                                'ITN - Individual Taxpayer Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'TIN - Taxpayer Identification Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 1.2),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Status of the contract',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontFamily: 'Ubuntu',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Color(0xFFF1F1F1),
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
                  iconSize: 24.0,
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                  ),
                  value: paymentStatus,
                  onChanged: (newValue) {
                    setState(() {
                      paymentStatus = newValue as String;
                      payment = paymentStatus;
                      checkTextField();
                    });
                  },
                  items: <String>[
                    'Paid',
                    'In process',
                    'Rejected by Payme',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            if (isFilled) saveButton(),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        toMap('nSP', controllers[0].text);
        toMap('contractStatus', paymentStatus);
        toMap('date', time.toString());
        toMap('address', controllers[1].text);
        toMap('number', controllers[2].text);

        
      },
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

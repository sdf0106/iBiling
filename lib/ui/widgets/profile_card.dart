import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Style.Colors.dark,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 48.0,
            child: ListTile(
              leading: SvgPicture.asset('assets/images/accountCircle.svg'),
              title: Text(
                'Otabek Abdusamatov',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Style.Colors.lightGreen,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Graphic designer • IQ Education',
                style: TextStyle(
                  color: Color(0xFFE7E7E7),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'Date of birth',
                    style: TextStyle(
                      color: Color(0xFFE7E7E7),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '16.09.2001',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xFFE7E7E7),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '+998 97 721 06 88',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'E-mail',
                    style: TextStyle(
                      color: Color(0xFFE7E7E7),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'predatorhunter041@gmail.com',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

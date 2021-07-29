import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/picking_language/dialog_route.dart';

class LangButton extends StatefulWidget {
  final String language;
  final String flag;
  const LangButton({Key? key, required this.language, required this.flag})
      : super(key: key);

  @override
  _LangButtonState createState() => _LangButtonState();
}

class _LangButtonState extends State<LangButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) {
              return _LangPopUp();
            },
          ),
        );
      },
      child: Hero(
        tag: _heroLang,
        child: Container(
          decoration: BoxDecoration(
            color: Style.Colors.dark,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: ListTile(
            title: Text(
              widget.language,
              style: TextStyle(
                color: Color(0xFFE7E7E7),
                fontSize: 14.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SvgPicture.asset('assets/images/${widget.flag}.svg'),
          ),
        ),
      ),
    );
  }
}

final String _heroLang = 'lang-buttton';

class _LangPopUp extends StatefulWidget {
  _LangPopUp({Key? key}) : super(key: key);

  @override
  __LangPopUpState createState() => __LangPopUpState();
}

class __LangPopUpState extends State<_LangPopUp> {
  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Material(
          color: Style.Colors.dark,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 16.0, left: 27.0, right: 27.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Choose a language',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.0),
                  Container(
                    height: 24.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/uz.svg'),
                          SizedBox(width: 12.0),
                          Text(
                            'O\'zbek (Lotin)',
                            style: TextStyle(
                              color: Color(0xFFE7E7E7),
                            ),
                          ),
                        ],
                      ),
                      trailing: Radio(
                        groupValue: group,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            group = T as int;
                          });
                        },
                        value: 1,
                        activeColor: Style.Colors.darkGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    height: 24.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/uz.svg'),
                          SizedBox(width: 12.0),
                          Text(
                            'O\'zbek (Lotin)',
                            style: TextStyle(
                              color: Color(0xFFE7E7E7),
                            ),
                          ),
                        ],
                      ),
                      trailing: Radio(
                        groupValue: group,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            group = T as int;
                          });
                        },
                        value: 2,
                        activeColor: Style.Colors.darkGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    height: 24.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/uz.svg'),
                          SizedBox(width: 12.0),
                          Text(
                            'O\'zbek (Lotin)',
                            style: TextStyle(
                              color: Color(0xFFE7E7E7),
                            ),
                          ),
                        ],
                      ),
                      trailing: Radio(
                        groupValue: group,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            group = T as int;
                          });
                        },
                        value: 3,
                        activeColor: Style.Colors.darkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

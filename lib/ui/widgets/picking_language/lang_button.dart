import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
// import 'package:ibiling/ui/widgets/picking_language/dialog_route.dart';
import 'package:easy_localization/easy_localization.dart';


class LanguageChangeContainer extends StatefulWidget {
  const LanguageChangeContainer({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  LanguageChangeContainerState createState() => LanguageChangeContainerState();
}

class LanguageChangeContainerState extends State<LanguageChangeContainer> {
  String lang = 'en';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          barrierColor: Color(0xFF0C0C0C).withOpacity(0.8),
          context: widget.context,
          barrierDismissible: true,
          builder: (_) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //  contentPadding: const EdgeInsets.all(0),
             
              // insetPadding: EdgeInsets.symmetric(
              //   horizontal: 320.0,
              //   vertical: 278.0,
              // ),
              contentPadding: EdgeInsets.zero,
              backgroundColor: Style.Colors.dark,
              title: Padding(
                padding: EdgeInsets.only(top: 16.0, right: 36.0, left: 35.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 18.0,
                  child: Center(
                    child: Text(
                      'Choose a language',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                ),
              ),
              content: Padding(
                padding: EdgeInsets.only(top: 28.0, right: 28.0, left: 28.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset('assets/images/uz.svg'),
                      title: Text(
                        'O\'zbek (Lotin)',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Ubuntu',
                          fontSize: 14.0,
                        ),
                      ),
                      trailing: Radio(
                        activeColor: Style.Colors.darkGreen,
                        focusColor: Color(0xFFA6A6A6).withOpacity(0.200),
                        value: 'uz',
                        groupValue: lang,
                        onChanged: (language) {
                          setState(() {
                            lang = language.toString();
                            context.locale = Locale('uz','UZ');
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          lang = 'uz';
                        });
                      },
                    ),
                    SizedBox(height: 24.0),
                    ListTile(
                      leading: SvgPicture.asset('assets/images/ru.svg'),
                      title: Text(
                        'Русский',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Ubuntu',
                          fontSize: 14.0,
                        ),
                      ),
                      trailing: Radio(
                        activeColor: Style.Colors.darkGreen,
                        value: 'ru',
                        groupValue: lang,
                        onChanged: (language) {
                          setState(() {
                            lang = language.toString();
                            context.locale = Locale('ru','RU');
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          lang = 'ru';
                        });
                      },
                    ),
                    SizedBox(height: 24.0),
                    ListTile(
                      leading: SvgPicture.asset('assets/images/en.svg'),
                      title: Text(
                        'English (USA)',
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Ubuntu',
                          fontSize: 14.0,
                        ),
                      ),
                      trailing: Radio(
                        activeColor: Style.Colors.darkGreen,
                        value: 'en',
                        groupValue: lang,
                        onChanged: (language) {
                          setState(() {
                            lang = language.toString();
                            context.setLocale(Locale('en', 'US'));
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          lang = 'en';
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 31.0, right: 0.0, left: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 37.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Style.Colors.darkGreen.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Style.Colors.darkGreen,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 37.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Style.Colors.darkGreen,
                          ),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                color: Color(0xFFFDFDFD),
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 44.0,
          decoration: BoxDecoration(
            color: Style.Colors.dark,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 12.0, left: 20.0, right: 12.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'English (USA)',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE7E7E7),
                  ),
                ),
                SvgPicture.asset('assets/images/en.svg',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class LangButton extends StatefulWidget {
//   final String language;
//   final String flag;
//   final BuildContext parentContext;
//   const LangButton({Key? key, required this.language, required this.flag, required this.parentContext})
//       : super(key: key);

//   @override
//   _LangButtonState createState() => _LangButtonState();
// }

// class _LangButtonState extends State<LangButton> {
//     int group = 1;

//   @override
//   Widget build(BuildContext context) {
//     return 
//     MaterialButton(
//       onPressed: () {
//         // showDialog<void>(
//         //     context: context,
//         //     barrierDismissible: false, // user must tap button!
//         //     builder: (BuildContext context) {
//         //       return AlertDialog(
//         //         backgroundColor: Style.Colors.dark,
//         //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//         //         title: const Text('Choose language', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
//         //         content: SingleChildScrollView(
//         //           child: ListBody(
//         //             children: <Widget>[
//         //               SizedBox(height: 28.0),
//         //           Container(
//         //             height: 24.0,
//         //             width: MediaQuery.of(context).size.width,
//         //             child: ListTile(
//         //               leading: Row(
//         //                 mainAxisAlignment: MainAxisAlignment.start,
//         //                 children: [
//         //                   SvgPicture.asset('assets/images/uz.svg'),
//         //                   SizedBox(width: 12.0),
//         //                   Text(
//         //                     'O\'zbek (Lotin)',
//         //                     style: TextStyle(
//         //                       color: Color(0xFFE7E7E7),
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //               trailing: Radio(
//         //                 groupValue: group,
//         //                 onChanged: (T) {
//         //                   print(T);
//         //                   setState(() {
//         //                     group = T as int;
//         //                   });
//         //                 },
//         //                 value: 1,
//         //                 activeColor: Style.Colors.darkGreen,
//         //               ),
//         //             ),
//         //           ),
//         //           SizedBox(height: 24.0),
//         //           Container(
//         //             height: 24.0,
//         //             width: MediaQuery.of(context).size.width,
//         //             child: ListTile(
//         //               leading: Row(
//         //                 mainAxisAlignment: MainAxisAlignment.start,
//         //                 children: [
//         //                   SvgPicture.asset('assets/images/uz.svg'),
//         //                   SizedBox(width: 12.0),
//         //                   Text(
//         //                     'O\'zbek (Lotin)',
//         //                     style: TextStyle(
//         //                       color: Color(0xFFE7E7E7),
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //               trailing: Radio(
//         //                 groupValue: group,
//         //                 onChanged: (T) {
//         //                   print(T);
//         //                   setState(() {
//         //                     group = T as int;
//         //                   });
//         //                 },
//         //                 value: 2,
//         //                 activeColor: Style.Colors.darkGreen,
//         //               ),
//         //             ),
//         //           ),
//         //           SizedBox(height: 24.0),
//         //           Container(
//         //             height: 24.0,
//         //             width: MediaQuery.of(context).size.width,
//         //             child: ListTile(
//         //               leading: Row(
//         //                 mainAxisAlignment: MainAxisAlignment.start,
//         //                 children: [
//         //                   SvgPicture.asset('assets/images/uz.svg'),
//         //                   SizedBox(width: 12.0),
//         //                   Text(
//         //                     'O\'zbek (Lotin)',
//         //                     style: TextStyle(
//         //                       color: Color(0xFFE7E7E7),
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //               trailing: Radio(
//         //                 groupValue: group,
//         //                 onChanged: (T) {
//         //                   print(T);
//         //                   setState(() {
//         //                     group = T as int;
//         //                   });
//         //                 },
//         //                 value: 3,
//         //                 activeColor: Style.Colors.darkGreen,
//         //               ),
//         //             ),
//         //           ),
//         //             ],
//         //           ),
//         //         ),
//         //         actions: <Widget>[
//         //           TextButton(
//         //             child: const Text('Approve'),
//         //             onPressed: () {
//         //               Navigator.of(context).pop();
//         //             },
//         //           ),
//         //         ],
//         //       );
//             },
//           );
//         // Navigator.of(widget.parentContext).push(
//         //   HeroDialogRoute(
//         //     builder: (context) {
//         //       return ;
//         //     },
//         //   ),
//         // );
//       },
//       // child: Hero(
//       //   tag: _heroLang,
//       //   child: Container(
//       //     decoration: BoxDecoration(
//       //       color: Style.Colors.dark,
//       //       borderRadius: BorderRadius.circular(4.0),
//       //     ),
//       //     child: ListTile(
//       //       title: Text(
//       //         widget.language,
//       //         style: TextStyle(
//       //           color: Color(0xFFE7E7E7),
//       //           fontSize: 14.0,
//       //           fontFamily: 'Ubuntu',
//       //           fontWeight: FontWeight.w500,
//       //         ),
//       //       ),
//       //       trailing: SvgPicture.asset('assets/images/${widget.flag}.svg'),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }

// enum Language {
//   uzbek, russian, english
// }

// // final String _heroLang = 'lang-buttton';

// // class _LangPopUp extends StatefulWidget {
// //   _LangPopUp({Key? key}) : super(key: key);

// //   @override
// //   __LangPopUpState createState() => __LangPopUpState();
// // }

// // class __LangPopUpState extends State<_LangPopUp> {
// //   int group = 1;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Padding(
// //         padding: EdgeInsets.all(32.0),
// //         child: Material(
// //           color: Style.Colors.dark,
// //           elevation: 2.0,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(4.0),
// //           ),
// //           child: SingleChildScrollView(
// //             child: Padding(
// //               padding: EdgeInsets.only(top: 16.0, left: 27.0, right: 27.0),
// //               child: Column(
// //                 children: [
// //                   Center(
// //                     child: Text(
// //                       'Choose a language',
// //                       style: TextStyle(
// //                         fontFamily: 'Ubuntu',
// //                         fontSize: 16.0,
// //                         fontWeight: FontWeight.w700,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 28.0),
// //                   Container(
// //                     height: 24.0,
// //                     width: MediaQuery.of(context).size.width,
// //                     child: ListTile(
// //                       leading: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         children: [
// //                           SvgPicture.asset('assets/images/uz.svg'),
// //                           SizedBox(width: 12.0),
// //                           Text(
// //                             'O\'zbek (Lotin)',
// //                             style: TextStyle(
// //                               color: Color(0xFFE7E7E7),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       trailing: Radio(
// //                         groupValue: group,
// //                         onChanged: (T) {
// //                           print(T);
// //                           setState(() {
// //                             group = T as int;
// //                           });
// //                         },
// //                         value: 1,
// //                         activeColor: Style.Colors.darkGreen,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 24.0),
// //                   Container(
// //                     height: 24.0,
// //                     width: MediaQuery.of(context).size.width,
// //                     child: ListTile(
// //                       leading: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         children: [
// //                           SvgPicture.asset('assets/images/uz.svg'),
// //                           SizedBox(width: 12.0),
// //                           Text(
// //                             'O\'zbek (Lotin)',
// //                             style: TextStyle(
// //                               color: Color(0xFFE7E7E7),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       trailing: Radio(
// //                         groupValue: group,
// //                         onChanged: (T) {
// //                           print(T);
// //                           setState(() {
// //                             group = T as int;
// //                           });
// //                         },
// //                         value: 2,
// //                         activeColor: Style.Colors.darkGreen,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 24.0),
// //                   Container(
// //                     height: 24.0,
// //                     width: MediaQuery.of(context).size.width,
// //                     child: ListTile(
// //                       leading: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         children: [
// //                           SvgPicture.asset('assets/images/uz.svg'),
// //                           SizedBox(width: 12.0),
// //                           Text(
// //                             'O\'zbek (Lotin)',
// //                             style: TextStyle(
// //                               color: Color(0xFFE7E7E7),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       trailing: Radio(
// //                         groupValue: group,
// //                         onChanged: (T) {
// //                           print(T);
// //                           setState(() {
// //                             group = T as int;
// //                           });
// //                         },
// //                         value: 3,
// //                         activeColor: Style.Colors.darkGreen,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // Future<void> _showMyDialog(BuildContext context) async {
// //   return showDialog<void>(
// //     context: context,
// //     barrierDismissible: false, // user must tap button!
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         backgroundColor: Style.Colors.dark,
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
// //         title: const Text('Choose language', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
// //         content: SingleChildScrollView(
// //           child: ListBody(
// //             children: const <Widget>[
// //               Text('This is a demo alert dialog.'),
// //               Text('Would you like to approve of this message?'),
// //             ],
// //           ),
// //         ),
// //         actions: <Widget>[
// //           TextButton(
// //             child: const Text('Approve'),
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }
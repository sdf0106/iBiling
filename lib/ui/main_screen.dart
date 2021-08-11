import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/screens/filters.dart';
import 'package:ibiling/ui/style/constants.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/contract_or_invoice.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  String image = '';
  List<String> titles = [
    'contract'.tr(),
    'history'.tr(),
    'new_contract'.tr(),
    'saved'.tr(),
    'profile'.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _selectedItem == 0 ? Colors.black : Style.Colors.darkest,
        title: Row(
          children: [
            Image.asset(
              'assets/images/ellipse.png',
              height: 24,
              width: 24.0,
            ),
            SizedBox(width: 12.0),
            Text(
              Constants.titles[_selectedItem],
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ), 
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/filter.svg',
              height: 20.0,
              width: 20.0,
            ),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => FiltersScreen()));
            },
          ),
          SizedBox(width: 20.0),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(width: 20.0),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/zoom.svg'),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Constants.pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.Colors.darkest,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        selectedItemColor: Color(0xFFF2F2F2),
        unselectedItemColor: Color(0xFFA6A6A6),
        onTap: (passedIndex) async {
            if (passedIndex == 2) {
              await showDialog(
                useSafeArea: true,
                barrierDismissible: true,
                barrierColor: const Color(0xFF0C0C0C).withOpacity(0.8),
                context: context,
                builder: (ctx) {
                  return const ContractOrInvoice();
                },
              );
            }
            setState(() {
              _selectedItem = passedIndex;
            });
          },
        
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset( _selectedItem == 0 ? 'assets/images/documentSelected.svg' : 'assets/images/document.svg'),
            title: Text(
              'contract'.tr(),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedItem == 1 ? 'assets/images/timeCircleSelected.svg' : 'assets/images/timeCircle.svg'),
            title: Text(
              'history'.tr(),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedItem == 2 ? 'assets/images/plusSelected.svg' : 'assets/images/plus.svg'),
            title: Text(
              'new'.tr(),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedItem == 3 ? 'assets/images/bookmarkSelected.svg' : 'assets/images/bookmark.svg'),
            title: Text(
              'saved'.tr(),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedItem == 4 ? 'assets/images/profileSelected.svg' : 'assets/images/profile.svg' ),
            title: Text(
              'profile'.tr(),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/screens/contracts.dart';
import 'package:ibiling/ui/screens/create.dart';
import 'package:ibiling/ui/screens/history.dart';
import 'package:ibiling/ui/screens/profile.dart';
import 'package:ibiling/ui/screens/saved.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  String image = '';
  List<Widget> _pages = [
    Contracts(),
    History(),
    Create(),
    Saved(),
    Profile(), 
  ];
  List<String> _titles = [
    'Contracts',
    'History',
    'New Contract',
    'Saved',
    'Profile',
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
              _titles[_selectedItem],
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
            onPressed: () {},
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
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.Colors.darkest,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        selectedItemColor: Color(0xFFF2F2F2),
        unselectedItemColor: Color(0xFFA6A6A6),
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset( _selectedItem == 0 ? 'assets/images/documentSelected.svg' : 'assets/images/document.svg'),
            title: Text(
              'Contracts',
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
              'History',
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
              'New',
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
              'Saved',
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
              'Profile',
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

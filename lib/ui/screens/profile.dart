import 'package:flutter/material.dart';
import 'package:ibiling/ui/widgets/picking_language/lang_button.dart';
import 'package:ibiling/ui/widgets/profile_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ProfileCard(),
          LangButton(
            language: 'English (USA)',
            flag: ('ru'),
          ),
        ],
      ),
    );
  }
}

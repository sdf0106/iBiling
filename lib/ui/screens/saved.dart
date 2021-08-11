import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiling/bloc/contracts/contracts_bloc.dart';
import 'package:ibiling/ui/widgets/transaction_card.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: SvgPicture.asset('assets/images/noSaved.svg'),
    );
  }
}

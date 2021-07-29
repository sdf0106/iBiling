import 'package:flutter/material.dart';
import 'package:ibiling/ui/widgets/transaction_card.dart';

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 16.0,
        right: 16.0,
      ),
      child: TransactionCard(),
    );
  }
}

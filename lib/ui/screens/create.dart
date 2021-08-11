import 'package:flutter/material.dart';
import 'package:ibiling/ui/widgets/new_contract_fields.dart';
import 'package:ibiling/ui/widgets/new_invoice_fields.dart';


class Create extends StatelessWidget {
  Create({ Key? key, required this.index }) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    List createPage = [
      NewContractFields(),
      NewInvoiceFields()
    ];
    return createPage[index];
  }
}
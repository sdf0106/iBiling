import 'package:flutter/material.dart';
import 'package:ibiling/ui/widgets/new_contract_fields.dart';
import 'package:ibiling/ui/widgets/new_invoice_fields.dart';


class Create extends StatelessWidget {
  const Create({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewInvoiceFields();
  }
}
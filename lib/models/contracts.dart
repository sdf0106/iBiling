import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Contract {
  final int day;
  final int month;
  final int year;
  @JsonKey(name: 'n-s-p')
  final String nSP;
  final double amount;
  @JsonKey(name: 'last-invoice')
  final int lastInvoice;
  @JsonKey(name: 'number-of-invoices')
  final int numberOfInvoices; 
  final int number; 
  Contract({required this.day, required this.month, required this.year, required this.nSP, required this.amount, required this.lastInvoice, required this.numberOfInvoices, required this.number,});

  factory Contract.fromJson (Map <String, dynamic>  json) => _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);
}

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
  day : json['day'], 
  month : json['month'], 
  year : json['year'],
  nSP : json['nSP'],
  amount : json['amount'], 
  lastInvoice: json['lastInvoice'], 
  numberOfInvoices: json['numberOfInvoices'], 
  number : json['number'],
);

 Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
   'day' : instance.day,
   'month' : instance.month,
   'year' : instance.year,
   'nSP' : instance.nSP,
   'amount' : instance.amount,
   'lastInvoice' : instance.lastInvoice,
   'numberOfInvoices' : instance.numberOfInvoices,
   'number' : instance.number,
 };
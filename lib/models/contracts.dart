import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ContractResponse {
  List<Contract> contracts;

  ContractResponse({required this.contracts});

  factory ContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
}

ContractResponse _$ContractResponseFromJson(Map<String, dynamic> json) {
  return ContractResponse(
    contracts: (json['contracts'] as List<dynamic>)
        .map((e) => Contract.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContractResponseToJson(ContractResponse instance) =>
    <String, dynamic>{
      'contracts': instance.contracts,
    };

@JsonSerializable()
class Contract {
  final String date;
  @JsonKey(name: 'contract-status')
  final String contractStatus;
  @JsonKey(name: 'n-s-p')
  final String nSP;
  final double amount;
  @JsonKey(name: 'last-invoice')
  final double lastInvoice;
  @JsonKey(name: 'number-of-invoices')
  final double numberOfInvoices;
  final double number;
  final String address;
  Contract({
    required this.date,
    required this.contractStatus,
    required this.nSP,
    required this.amount,
    required this.lastInvoice,
    required this.numberOfInvoices,
    required this.number,
    required this.address,
  });

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);
}

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      date : json['date'],
      nSP: json['nSP'],
      amount: json['amount'],
      lastInvoice: json['lastInvoice'],
      numberOfInvoices: json['numberOfInvoices'],
      number: json['number'], 
      contractStatus: json['contractStatus'],
      address: json['address']
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'date': instance.date,
      'nSP': instance.nSP,
      'amount': instance.amount,
      'lastInvoice': instance.lastInvoice,
      'numberOfInvoices': instance.numberOfInvoices,
      'number': instance.number,
      'contractStatus': instance.contractStatus,
      'address' : instance.address,
    };

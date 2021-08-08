import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NewContract {
  @JsonKey(name: 'type-of-payer')
  final String typeOfPayer;
  @JsonKey(name: 'individual-name')
  final String individualName;
  final String date;
  @JsonKey(name: 'i-t-n')
  final String iTN;
  final String address;
  @JsonKey(name: 'payment-status')
  final String paymentStatus;

  NewContract({
    required this.typeOfPayer,
    required this.individualName,
    required this.address,
    required this.iTN,
    required this.paymentStatus,
    required this.date,
  });
  factory NewContract.fromJson(Map<String, dynamic> json) =>
      _$NewContractFromJson(json);
  Map<String, dynamic> toJson() => _$NewContractToJson(this);
}

NewContract _$NewContractFromJson(Map<String, dynamic> json) => NewContract(
      individualName: json['individualName'],
      iTN: json['iTN'],
      paymentStatus: json['paymentStatus'],
      typeOfPayer: json['typeOfPayer'],
      date: json['date'],
      address: json['address'],
    );

Map<String, dynamic> _$NewContractToJson(NewContract instance) =>
    <String, dynamic>{
      'individualName': instance.individualName,
      'iTN': instance.iTN,
      'paymentStatus': instance.paymentStatus,
      'typeOfPayer': instance.typeOfPayer,
      'date': instance.date,
      'address': instance.address,
    };

@JsonSerializable()
class NewContractResponse {
  List<NewContract> contracts;

  NewContractResponse({required this.contracts});

  factory NewContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
}

NewContractResponse _$ContractResponseFromJson(Map<String, dynamic> json) {
  return NewContractResponse(
    contracts: (json['contracts'] as List<dynamic>)
        .map((e) => NewContract.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContractResponseToJson(NewContractResponse instance) =>
    <String, dynamic>{
      'contracts': instance.contracts,
    };

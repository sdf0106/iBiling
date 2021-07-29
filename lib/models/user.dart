import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class User{
  final String name;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String profession;

  User(this.name,this.dateOfBirth,this.phoneNumber,this.email,this.profession);

  User.formJson (Map<String, dynamic> json) 
    : name = json["name"],
    dateOfBirth = json["dateOfBirth"],
    phoneNumber = json["phoneNumber"],
    email = json["email"],
    profession  = json["profession"];

  Map<String, dynamic> toJson() => 
  {
    "name" : name,
    "dateOfBirth" : dateOfBirth,
    "phoneNumber" : phoneNumber,
    "email" : email, 
    "profession" : profession,
  };

  
}
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/contracts.dart';

class MockIBillingService {
  Future<List<Contract>> getContractResponse() async {
    final contracts = await _getContracts();

    return contracts;
  }

  Future<List<Invoice>> getInvoicesResponce() async {
    final invoices = await _getInvoices();
    return invoices;
  }

  Future<List<Invoice>> _getInvoices() async{
    final contractResponse = await getStringJson();
    return contractResponse.invoices; 
  }

  Future<ContractResponse> getStringJson() async{
    await Future.delayed(const Duration(seconds: 2));
    final contractString = await _loadAsset('assets/data/contracts.json');

    final jsonData = json.decode(contractString);
    final contracts = ContractResponse.fromJson(jsonData);

    return contracts;
  }

  Future<List<Contract>> _getContracts() async {
    final contractResponse = await getStringJson();
    return contractResponse.contracts;

  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
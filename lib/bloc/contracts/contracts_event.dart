part of 'contracts_bloc.dart';

@immutable
abstract class ContractsEvent {}

class LoadContractsEvent extends ContractsEvent {}

class FilterContractsByDate extends ContractsEvent {
  final String pickedDateString;
  FilterContractsByDate(this.pickedDateString);
}

class AddNewContractsEvent extends ContractsEvent {
  final Contract contract;

  AddNewContractsEvent({required this.contract});
}
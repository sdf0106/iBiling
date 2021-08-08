part of 'new_contract_bloc.dart';

@immutable
abstract class NewContractState {}

class NewContractInitial extends NewContractState {}

class ShowSaveButtonState extends NewContractState {
  final List<NewContract> info;
  ShowSaveButtonState({required this.info});
}
class ErrorState extends NewContractState {
  final Object error; 
  ErrorState({required this.error});
}


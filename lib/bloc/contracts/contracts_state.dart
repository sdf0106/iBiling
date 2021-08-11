part of 'contracts_bloc.dart';

@immutable
abstract class ContractsState {}

class ContractsInitial extends ContractsState {}

class ContractsLoadingState extends ContractsState {}
 
class ContractsLoadedState extends ContractsState {
   final List<Contract> contracts;
   ContractsLoadedState({required this.contracts});
 
}

class FailToLoadContractsState extends ContractsState {
  final Object error; 
  FailToLoadContractsState({required this.error});
}

class FilteringContractsByDate extends ContractsState {}

class FilteredContractsByDate extends ContractsState {
  final List<Contract> filteredContracts;
  FilteredContractsByDate({required this.filteredContracts});
}

class FailedToFilterContractsByDate extends ContractsState {
  final error;
  FailedToFilterContractsByDate({required this.error});
}

class AddingNewContract extends ContractsState {}

class AddedNewContract extends ContractsState {
  final Contract contract;

  AddedNewContract({required this.contract});
}

class FailedToAddNewContract extends ContractsState {
  final error;

  FailedToAddNewContract({required this.error});
}

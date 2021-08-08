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

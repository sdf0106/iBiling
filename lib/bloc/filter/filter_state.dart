part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoadingState extends FilterState {
  final DateTime filterDate; 
  FilterLoadingState({required this.filterDate});
}

class FilterLoadedState extends FilterState {
  List<Contract> contractsByDay;
  FilterLoadedState({required this.contractsByDay});
}

class FilterLoadingFailedState extends FilterState {
  var error;
  FilterLoadingFailedState({required this.error});
} 
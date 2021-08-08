part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class LoadingHistoryState extends HistoryState {}

class LoadedHistoryState extends HistoryState {
  final List<Contract> contracts;

  LoadedHistoryState({required this.contracts}); 

} 

class FailedToLoadHistory extends HistoryState {
  final error;
  FailedToLoadHistory({required this.error});
}

class DateNotProvidedState extends HistoryState{}
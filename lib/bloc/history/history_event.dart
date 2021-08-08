part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class InitializedHistoryEvent extends HistoryEvent{}

class LoadHistoryEvent extends HistoryEvent{
 final String initialDate;
 final String lastDate;

 LoadHistoryEvent({required this.initialDate, required this.lastDate});

}
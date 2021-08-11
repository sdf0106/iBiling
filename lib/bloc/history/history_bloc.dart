import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibiling/api/mock_ibiling_service.dart';
import 'package:ibiling/models/contracts.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(LoadingHistoryState());
  String initialDate = ' ';
  String lastDate = ' ';
  List<Contract> mockData = [];
  List<Contract> history = [];
  set setInitialDate(String initialDate) {
    this.initialDate = initialDate;
  }

  String get getInitialDate {
    return initialDate;
  }

  set setLastDate(String lastDate) {
    this.lastDate = lastDate;
  }

  String get getLastDate {
    return lastDate;
  }

  Future<void> fetchData() async {
    mockData = await MockIBillingService().getContractResponse();
  }

  void filterHistory() {
    history = [];
    mockData.forEach((element) {
      final contractCreated = DateTime.parse(element.date);
      if (contractCreated.isAfter(DateTime.parse(initialDate)) &&
          contractCreated.isBefore(DateTime.parse(lastDate))) {
        history.add(element);
      }
    });
  }

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is InitializedHistoryEvent) {
      yield HistoryInitial();
    } else if (event is LoadHistoryEvent) {
      if (!(initialDate == '' || lastDate == '')) {
        yield LoadingHistoryState();
        await fetchData();
        filterHistory();
        try {
          yield LoadedHistoryState(contracts: history);
        } catch (error) {
          FailedToLoadHistory(error: error);
        }
      } else {
        yield DateNotProvidedState();
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibiling/api/mock_ibiling_service.dart';
import 'package:ibiling/models/contracts.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  bool dayContainerTapped = false;
  List<Contract> mockData = [];
  DateTime _filterByDate = DateTime.now();
  FilterBloc() : super(FilterLoadingState(filterDate: DateTime.parse('')));
  final List<Contract> _filteredItems = [];
  set dateFilter(DateTime chosenTime) {
    _filterByDate = chosenTime;
  }

  List<Contract> get filteredItems {
    return _filteredItems;
  }

  Future<void> getMockData() async {
    mockData = await MockIBillingService().getContractResponse();
  }

  void filterContracts() {
    mockData.forEach((contract) {
      if (DateTime.parse(contract.date).day == _filterByDate.day &&
          DateTime.parse(contract.date).month == _filterByDate.month &&
          DateTime.parse(contract.date).year == _filterByDate.year &&
          DateTime.parse(contract.date).weekday == _filterByDate.weekday) {
        _filteredItems.add(contract);
      } else {
        print('Nothing found');
      }
    });
  }

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is OnDayContainerTapped) {
      await getMockData();
      if (dayContainerTapped == true) {
        filterContracts();
        yield FilterLoadingState(filterDate: _filterByDate);

        try {
          yield FilterLoadedState(contractsByDay: _filteredItems);
        } catch (error) {
          FilterLoadingFailedState(error: error);
          print(error.toString());
        }
      }else {
        mockData.forEach((element) {
          _filteredItems.add(element);
        });
        try{
          yield FilterLoadedState(contractsByDay: _filteredItems);
        }catch (error){
          yield FilterLoadingFailedState(error: error);
        }
      }
    }
  }
}

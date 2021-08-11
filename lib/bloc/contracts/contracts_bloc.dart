import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibiling/api/mock_ibiling_service.dart';
import 'package:ibiling/models/contracts.dart';

import 'package:meta/meta.dart';

part 'contracts_event.dart';
part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  ContractsBloc() : super(ContractsLoadingState());
  late String _date;
  Contract _newContract = Contract(
    nSP: 'Person',
    contractStatus: '',
    amount: 0,
    lastInvoice: 0,
    numberOfInvoices: 0,
    number: 0,
    address: '',
    date: DateTime.now().toIso8601String(),
  );

  set setData(String param) {
    _date = param;
  }

  String get getDate => _date;

  set setNewContract(Contract contract) {
    _newContract = contract;
  }

  Contract get getNewContract {
    return _newContract;
  }

  @override
  Stream<ContractsState> mapEventToState(
    ContractsEvent event,
  ) async* {
    List<Contract> mockData = [];

    List<Contract> filteredItems = [];

    Future<void> getMockData() async {
      mockData = await MockIBillingService().getContractResponse();
    }

    Future<void> fetchContractByDate(DateTime time) async {
      await getMockData();
      mockData.forEach((contract) {
        try {
          final contractDate = DateTime.parse(contract.date);

          if (time.day == contractDate.day &&
              time.month == contractDate.month &&
              time.year == contractDate.year) {
            filteredItems.add(contract);
          }
        } catch (error) {
          filteredItems = [];
        }
      });
    }

    if (event is LoadContractsEvent) {
      yield ContractsLoadingState();
      await getMockData();
      try {
        yield ContractsLoadedState(contracts: mockData);
      } catch (error) {
        yield FailToLoadContractsState(error: error);
      }
    } else if (event is FilterContractsByDate) {
      final filteringTime =
          DateTime.parse(FilterContractsByDate(getDate).pickedDateString);
      yield FilteringContractsByDate();
      print(_date);
      await fetchContractByDate(filteringTime);

      try {
        yield FilteredContractsByDate(filteredContracts: filteredItems);
      } catch (error) {
        yield FailedToFilterContractsByDate(error: error);
      }
    } else if (event is AddNewContractsEvent) {
      yield AddingNewContract();
      final newContract =
          AddNewContractsEvent(contract: getNewContract).contract;
      mockData.add(newContract);

      try {
        yield AddedNewContract(contract: newContract);
      } catch (error) {
        yield FailedToAddNewContract(error: error);
      }
    }
  }
}

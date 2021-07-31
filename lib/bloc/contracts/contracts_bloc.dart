import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibiling/api/mock_ibiling_service.dart';
import 'package:ibiling/models/contracts.dart';
import 'package:ibiling/ui/screens/contracts.dart';
import 'package:meta/meta.dart';

part 'contracts_event.dart';
part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  ContractsBloc() : super(ContractsLoadingState());

  @override
  Stream<ContractsState> mapEventToState(
    ContractsEvent event,
  ) async* {
    if (event is LoadContractsEvent) {
      yield ContractsLoadingState();
      try {
        final mockData = await MockIBillingService().getContractResponse();

        yield ContractsLoadedState(contracts: mockData);
      } catch (error) {
        yield FailToLoadContractsState(error: error);
      }
    }
  }
}

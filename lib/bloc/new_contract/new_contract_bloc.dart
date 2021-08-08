import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibiling/models/new_contract.dart';
import 'package:meta/meta.dart';

part 'new_contract_event.dart';
part 'new_contract_state.dart';

class NewContractBloc extends Bloc<NewContractEvent, NewContractState> {
  NewContractBloc() : super(NewContractInitial());

  @override
  Stream<NewContractState> mapEventToState(
    NewContractEvent event,
  ) async* {
    if(event is FieldsFilledEvent){
      
    }
  }
}

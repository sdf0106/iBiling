import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibiling/bloc/contracts/contracts_bloc.dart';
import 'package:ibiling/bloc/filter/filter_bloc.dart';
import 'package:ibiling/bloc/history/history_bloc.dart';
import 'package:ibiling/bloc/new_contract/new_contract_bloc.dart';
import 'main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContractsBloc()..add(LoadContractsEvent()),
        ),
        BlocProvider(
          create: (context) => FilterBloc()..add(OnDayContainerTapped()),
        ),
        BlocProvider(create: (context) => NewContractBloc()..add(FieldsFilledEvent())),
        BlocProvider(
          create: (context) => HistoryBloc()..add(InitializedHistoryEvent()),
        ),
      ],
      child: MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          //   supportedLocales: context.supportedLocales,
          //   locale: context.locale,
            debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
    );
  }
}
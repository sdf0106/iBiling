import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiling/bloc/contracts/contracts_bloc.dart';
import 'package:ibiling/ui/widgets/transaction_card.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 16.0,
        right: 16.0,
      ),
      child: BlocBuilder<ContractsBloc, ContractsState>(
        builder: (context, state) {
          if (state is ContractsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Style.Colors.darkGreen,
              ),
            );
          } else if (state is ContractsLoadedState) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return TransactionCard(
                  nSP: state.contracts[index].nSP,
                  lastInvoice: state.contracts[index].lastInvoice,
                  amount: state.contracts[index].amount,
                  contractStatus: state.contracts[index].contractStatus,
                  date: state.contracts[index].date,
                  numberOfInvoices: state.contracts[index].numberOfInvoices,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 12.0,
              ),
              itemCount: state.contracts.length,
            );
          }else if(state is FailToLoadContractsState) {
             print(state.error.toString());
            return Center(
              child: SvgPicture.asset('assets/images/noSaved.svg'),
            );
          }else 
          return Container();
        },
      ),
    );
  }
}

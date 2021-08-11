import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/bloc/history/history_bloc.dart';
import 'package:ibiling/ui/widgets/from_to_date.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/transaction_card.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HistoryBloc>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date',
              style: TextStyle(
                color: Color(0xFF999999),
                fontFamily: 'Ubuntu',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            FromToDate(),
            SizedBox(height: 20.0),
            BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                if (state is HistoryInitial) {
                  return Container();
                } else if (state is LoadingHistoryState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Style.Colors.darkGreen,
                    ),
                  );
                } else if (state is LoadedHistoryState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        nSP: state.contracts[index].nSP,
                        lastInvoice: state.contracts[index].lastInvoice,
                        amount: state.contracts[index].amount,
                        contractStatus: state.contracts[index].contractStatus,
                        numberOfInvoices: state.contracts[index].numberOfInvoices,
                        date: state.contracts[index].date,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: state.contracts.length,
                  );
                  ;
                } else if (state is FailedToLoadHistory) {
                  return Center(
                    child: Text(
                      state.error,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.black54.withOpacity(0.1),
                      ),
                    ),
                  );
                } else if (state is DateNotProvidedState) {
                  return Center(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/images/doc.svg',
                            height: 88.0,
                            width: 88.0,
                            color: Color(0xFF999999) //Style.Colors.darker,
                            ),
                        Text(
                          'No history for this period',
                          style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

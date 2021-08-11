import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibiling/bloc/contracts/contracts_bloc.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;
import 'package:ibiling/ui/widgets/calendar_container.dart';
import 'package:ibiling/ui/widgets/transaction_card.dart';
import 'package:easy_localization/easy_localization.dart';

class Contracts extends StatefulWidget {
  const Contracts({Key? key}) : super(key: key);

  @override
  _ContractsState createState() => _ContractsState();
}

var pickedDate =
    DateTime.now().subtract(Duration(days: (DateTime.now().weekday - 1)));

class _ContractsState extends State<Contracts> {
  bool _isSelected = true;
  List<Color> buttons = [
    Color(0xFF00A795),
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CalendarContainer(),
            SizedBox(height: 32.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelected = true;
                        });
                      },
                      child: Container(
                        width: 90.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: _isSelected == true
                              ? buttons.first
                              : buttons.last,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text(
                            'contract'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelected = false;
                        });
                      },
                      child: Container(
                        width: 90.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: _isSelected == false
                              ? buttons.first
                              : buttons.last,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text(
                            'invoice'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 28.0,
                  ),
                  BlocBuilder<ContractsBloc, ContractsState>(
                    builder: (context, state) {
                      if (state is FilteringContractsByDate ||
                          state is ContractsLoadingState ||
                          state is ContractsInitial) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Style.Colors.darkGreen,
                          ),
                        );
                      } else if (state is FilteredContractsByDate ||
                          state is ContractsLoadedState) {
                        if (state is ContractsLoadedState) {
                          return Flexible(
                            child: Container(
                              child: Center(
                                child: SvgPicture.asset('assets/images/doc.svg',
                                    height: 88.0,
                                    width: 88.0,
                                    color:
                                        Color(0xFF999999) //Style.Colors.darker,
                                    ),
                              ),
                            ),
                          );
                        } else if (state is FilteredContractsByDate) {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TransactionCard(
                                nSP: state.filteredContracts[index].nSP,
                                lastInvoice:
                                    state.filteredContracts[index].lastInvoice,
                                amount: state.filteredContracts[index].amount,
                                contractStatus: state
                                    .filteredContracts[index].contractStatus,
                                date: state.filteredContracts[index].date,
                                numberOfInvoices: state
                                    .filteredContracts[index].numberOfInvoices,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 12.0,
                            ),
                            itemCount: state.filteredContracts.length,
                          );
                        }
                      } else if (state is FailedToFilterContractsByDate) {
                        print(state.error.toString());
                        return Flexible(
                          child: Container(
                            child: Center(
                              child: SvgPicture.asset('assets/images/doc.svg',
                                  height: 88.0,
                                  width: 88.0,
                                  color:
                                      Color(0xFF999999) //Style.Colors.darker,
                                  ),
                            ),
                          ),
                        );
                      } else
                        return Container(
                          child: Center(
                            child: SvgPicture.asset('assets/images/doc.svg',
                                height: 88.0,
                                width: 88.0,
                                color: Color(0xFF999999) //Style.Colors.darker,
                                ),
                          ),
                        );
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

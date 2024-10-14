import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/get%20transaction/gettransaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view/edite_transaction.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ListTransactionOrdered extends StatelessWidget {
  const ListTransactionOrdered({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GettransactionCubit, GettransactionState>(
      builder: (context, state) {
        if (state is GettransactionLoading) {
          return const Loadingresponse();
        } else if (state is GettransactionFailure) {
          return Failurmsg(msg: state.errormsg);
        } else if (state is GettransactionSuccess) {
          return ListView.builder(
            itemCount: state.transactionModel.requests?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              mycolor.hcolor.withOpacity(.5),
                              mycolor.hcolor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(state.transactionModel
                                      .requests![index].type!)),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                      "رقم المعاملة : ${state.transactionModel.requests![index].id.toString()}")),
                              state.transactionModel.requests![index]
                                          .descreption !=
                                      null
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Text(state.transactionModel
                                          .requests![index].descreption))
                                  : const SizedBox(),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: mycolor.hcolor,
                                borderRadius: BorderRadius.circular(15)),
                            height: 60,
                            width: MediaQuery.of(context).size.width * .15,
                            child: Center(
                              child: CircularPercentIndicator(
                                radius: 24.0, // نصف قطر الدائرة
                                lineWidth: 6.0, // عرض خط المؤشر
                                percent: state.transactionModel.requests?[index]
                                            .state ==
                                        'processing'
                                    ? 0.5
                                    : 1.0, // النسبة المئوية (0.0 إلى 1.0)
                                center: Text(
                                  state.transactionModel.requests?[index]
                                              .state ==
                                          'processing'
                                      ? "معالجة"
                                      : 'منجز',
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                                progressColor: state.transactionModel
                                            .requests?[index].state ==
                                        'processing'
                                    ? mycolor.tlcolor
                                    : Colors.green, // لون المؤشر
                                backgroundColor:
                                    mycolor.lcolor, // لون خلفية المؤشر
                                circularStrokeCap:
                                    CircularStrokeCap.round, // شكل حواف المؤشر
                              ),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text('الحالة : '),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    state.transactionModel.requests?[index].state != 'accept'
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return EditeTransaction(
                                    request:
                                        state.transactionModel.requests![index],
                                    type: state.transactionModel
                                        .requests![index].type!,
                                  );
                                  //     EditeTransaction(
                                  //         type: state
                                  //             .transactionModel.requests![index].type!,
                                  //         request:
                                  //             state.transactionModel.requests![index]);
                                },
                              ));
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * .15,
                              decoration: BoxDecoration(
                                  color: mycolor.tlcolor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(
                                FontAwesomeIcons.filePen,
                                size: 25,
                                color: mycolor.Thcolor,
                              ),
                            ),
                          )
                        : Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .15,
                            decoration: BoxDecoration(
                                color: mycolor.lcolor,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Icon(
                              FontAwesomeIcons.check,
                              size: 25,
                              color: mycolor.Thcolor,
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

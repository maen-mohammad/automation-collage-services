import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/core/utils/text_styles.dart';
// import 'package:intl/intl.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20notes/getnotes_cubit.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetnotesCubit, GetnotesState>(
      builder: (context, state) {
        if (state is GetnotesLoading) {
          return const Loadingresponse();
        } else if (state is GetnotesFailure) {
          return Failurmsg(msg: state.errormsg);
        } else if (state is GetnotesSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.notesModel.notes?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                        color: mycolor.hcolor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Text(DateFormat.yMMMd('ar').format(DateTime.now())),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              state.notesModel.notes![index].note!,
                              style: TextStyles().TextStyle16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/text_styles.dart';
import 'package:ite/features/groups/presentation/view%20models/get%20mygroup%20cubit/get_mygroup_cubit.dart';
import 'package:ite/features/groups/presentation/views/widget/group_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMygroupCubit, GetMygroupState>(
      builder: (context, state) {
        if (state is GetMygroupLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetMygroupFailure) {
          return Center(
            child: Text(state.errmessage),
          );
        } else if (state is GetMygroupSuccess) {
          if (state.groups.groups!.isEmpty) {
            return Center(
              child: Text(
                'لايوجد فريق بعد',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            );
          }
          return Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: mycolor.hcolor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'رقم المجموعة',
                    style: TextStyles()
                        .TextStyle16
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.groups.groups![0].id.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   state.groups.groups![0].type!,
                //   style: TextStyles()
                //       .TextStyle16
                //       .copyWith(fontWeight: FontWeight.bold),
                // ),
                GroupGrid(
                  names: state.groups.groups![0].toJson(),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

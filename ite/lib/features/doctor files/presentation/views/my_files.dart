import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/delete%20file/delete_file_cubit.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/get%20myfile/get_myfile_cubit.dart';
import 'package:ite/features/doctor%20files/presentation/views/upload_file.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/title_labs.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:path/path.dart' as path;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  String downloadProgress = "";
  String? filePath;
  bool show = false;
  // Future<void> requestPermission() async {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  // }

  Future<void> downloadFile(String urlfile, String name) async {
    Dio dio = Dio();

    // إنشاء ProgressDialog
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      textAlign: TextAlign.right,
      message: "جاري التحميل...", // تعيين اتجاه النص RTL
    );

    try {
      print("${ApiService.url}storage${urlfile}");
      String url = "${ApiService.url}storage/${urlfile}";
      Directory? downloadsDir = Directory('/storage/emulated/0/Download');
      String savePath = path.join(downloadsDir.path, name);

      // عرض ProgressDialog
      await progressDialog.show();

      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // حساب نسبة التحميل
            double progress = (received / total * 100);
            progressDialog.update(
              progressWidget: const Center(child: CircularProgressIndicator()),
              progress: progress, // تحديث ProgressDialog
              message:
                  "تم تحميل ${progress.toStringAsFixed(0)}% من الملف", // تعيين اتجاه النص RTL
            );
          }
        },
      );

      // إخفاء ProgressDialog بعد اكتمال التحميل
      // await progressDialog.hide();

      setState(() {
        filePath = savePath;
        downloadProgress = "تم التحميل";
        progressDialog.update(
            // تحديث ProgressDialog
            message: "اكتمل التنزيل",
            progressWidget: const Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.green,
              size: 40,
              weight: 100,
            ) // تعيين اتجاه النص RTL
            );
      });

      print("File downloaded to: $savePath");
    } catch (e) {
      print("Error during file download: $e");
      await progressDialog.hide(); // إخفاء ProgressDialog في حالة حدوث خطأ
      setState(() {
        downloadProgress = "خطأ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(text: 'ملفاتي')),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleLabs(text: 'الملفات'),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) {
                            return UploadFile();
                          },
                        ),
                      );
                    },
                    child: const AddButton(
                      text: 'اضافة ملف',
                      height: 30,
                      width: 80,
                      fontsize: 14,
                      color: mycolor.lcolor,
                    ),
                  ),
                )
              ],
            ),
            const CustomDivider(),
            Expanded(
              child: BlocBuilder<GetMyfileCubit, GetMyfileState>(
                builder: (context, state) {
                  if (state is GetMyfileLoading) {
                    return const Loadingresponse();
                  } else if (state is GetMyfilefailure) {
                    return Failurmsg(msg: state.errormsg);
                  } else if (state is GetMyfileSuccess) {
                    return ListView.builder(
                      itemCount: state.myFileModel.files?.length,
                      padding: const EdgeInsets.all(4),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .62,
                                decoration: BoxDecoration(
                                  color: mycolor.hcolor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                height: 70,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: const Icon(
                                        FontAwesomeIcons.solidFilePdf,
                                        color: mycolor.lcolor,
                                        size: 35,
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Text(
                                          state.myFileModel.files![index].name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),

                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.circular(50),
                                    //   child: Icon(FontAwesomeIcons.a),
                                    // )
                                  ],
                                ),
                              ),
                              // show == false
                              // ?
                              InkWell(
                                onTap: () {
                                  show = true;
                                  downloadFile(
                                      state.myFileModel.files![index].file!,
                                      state.myFileModel.files![index].name!);
                                }
                                // {
                                //      Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) {
                                //     return DownloadFileExample();
                                //   },
                                // ));
                                // }
                                ,
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                      color: mycolor.lcolor,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Icon(
                                    FontAwesomeIcons.download,
                                    size: 20,
                                    color: mycolor.Thcolor,
                                  ),
                                ),
                              ),
                              // : Container(
                              //     height: 50,
                              //     width: MediaQuery.of(context).size.width * .15,
                              //     decoration: BoxDecoration(
                              //         color: mycolor.lcolor,
                              //         borderRadius: BorderRadius.circular(16)),
                              //     child: Center(
                              //       child: Text(
                              //         downloadProgress,
                              //         style: const TextStyle(
                              //           color: mycolor.Thcolor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<DeleteFileCubit>(context)
                                      .deletefile({
                                    'id': state.myFileModel.files?[index].id
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: SizedBox(
                                        height: 200,
                                        child: BlocBuilder<DeleteFileCubit,
                                            DeleteFileState>(
                                          builder: (context, state) {
                                            if (state is DeleteFileLoading) {
                                              return const Loadingresponse();
                                            } else if (state
                                                is DeleteFileFailure) {
                                              return Failurmsg(
                                                  msg: state.errormsg);
                                            } else if (state
                                                is DeleteFileSuccess) {
                                              BlocProvider.of<GetMyfileCubit>(
                                                      context)
                                                  .getfile();
                                              return Center(
                                                child: Text(state.msg),
                                              );
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                // {
                                //      Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) {
                                //     return DownloadFileExample();
                                //   },
                                // ));
                                // }
                                ,
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                      color: mycolor.tlcolor,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Icon(
                                    FontAwesomeIcons.trash,
                                    size: 20,
                                    color: mycolor.Thcolor,
                                  ),
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
              ),
            ),
          ],
        ));
  }
}

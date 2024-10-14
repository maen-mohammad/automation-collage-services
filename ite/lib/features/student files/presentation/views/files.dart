import 'package:flutter/material.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20files/presentation/view%20model/get%20files/getfiles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'dart:io';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
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
  // Future<void> downloadFile() async {
  //   // await requestPermission();

  //   Dio dio = Dio();

  //   try {
  //     String url =
  //         "http://192.168.43.113:8000/storage/files/z0PurEVgrCMX4KisUOuypFLeC9nFDwHnfkNGds8V.pdf";

  //     // الحصول على مسار مجلد Downloads
  //     Directory? downloadsDir = Directory('/storage/emulated/0/Download');

  //     String savePath = path.join(downloadsDir.path, "downloaded_file1.pdf");

  //     await dio.download(
  //       url,
  //       savePath,
  //       onReceiveProgress: (received, total) {
  //         setState(() {
  //           downloadProgress =
  //               "${(received / total * 100).toStringAsFixed(0)}%";
  //         });
  //       },
  //     );

  //     setState(() {
  //       filePath = savePath;
  //       downloadProgress = "مثبت";
  //     });

  //     print("File downloaded to: $savePath");
  //   } catch (e) {
  //     print("Error during file download: $e");
  //     setState(() {
  //       downloadProgress = "خطأ";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(
                text: 'الملفات',
              ),
            ),
            body: BlocBuilder<GetfilesCubit, GetfilesState>(
              builder: (context, state) {
                if (state is GetfilesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetfilesFailure) {
                  return Center(
                    child: Text(state.errormsg),
                  );
                } else if (state is GetfilesSuccess) {
                  return ListView.builder(
                    itemCount: state.filesModel.doctorFiles?.length,
                    padding: const EdgeInsets.all(4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .77,
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
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        state.filesModel.doctorFiles![index]
                                            .name!,
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
                            //     ?
                            InkWell(
                              onTap: () {
                                show = true;
                                downloadFile(
                                    state.filesModel.doctorFiles![index].file!,
                                    state.filesModel.doctorFiles![index].name!);
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
                                width: MediaQuery.of(context).size.width * .15,
                                decoration: BoxDecoration(
                                    color: mycolor.tlcolor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Icon(
                                  FontAwesomeIcons.download,
                                  size: 20,
                                  color: mycolor.Thcolor,
                                ),
                              ),
                            )
                            // : Container(
                            //     height: 50,
                            //     width:
                            //         MediaQuery.of(context).size.width * .15,
                            //     decoration: BoxDecoration(
                            //         color: mycolor.lcolor,
                            //         borderRadius:
                            //             BorderRadius.circular(16)),
                            //     child: Center(
                            //       child: Text(
                            //         downloadProgress,
                            //         style: const TextStyle(
                            //           color: mycolor.Thcolor,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            )));
  }
}

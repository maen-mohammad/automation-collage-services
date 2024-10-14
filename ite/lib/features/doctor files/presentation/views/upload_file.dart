import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ite/core/utils/api_service.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/get%20myfile/get_myfile_cubit.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  double _progress = 0.0; // نسبة التقدم في رفع الملف
  String? _fileName;
  bool _uploading = false;

  Dio dio = Dio();
  Future<void> pickAndUploadPdf() async {
    // التحقق من حالة الإذن
    PermissionStatus status = await Permission.storage.status;

    if (status.isGranted) {
      // الإذن ممنوح بالفعل
      _pickFile();
    } else if (status.isDenied) {
      // طلب الإذن
      var requestStatus = await Permission.storage.request();

      if (requestStatus.isGranted) {
        // تم منح الإذن
        _pickFile();
      } else if (requestStatus.isPermanentlyDenied) {
        // الإذن مرفوض بشكل دائم، توجيه المستخدم إلى إعدادات التطبيق
        print('تم رفض الإذن بشكل دائم. توجيه المستخدم إلى الإعدادات.');
        openAppSettings();
      } else {
        // رفض الإذن بشكل غير دائم
        print('تم رفض الإذن للوصول إلى الملفات.');
      }
    } else if (status.isPermanentlyDenied) {
      // الإذن مرفوض بشكل دائم، توجيه المستخدم إلى الإعدادات
      print('تم رفض الإذن بشكل دائم. توجيه المستخدم إلى الإعدادات.');
      openAppSettings();
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // السماح فقط بملفات PDF
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Picked file: ${file.name}');
    } else {
      print('لم يتم اختيار أي ملف.');
    }
  }

  FilePickerResult? _filepdf;
  Future<void> selectfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'], // السماح فقط بملفات PDF
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
        _filepdf = result;
        _show = false;
      });
    }
  }

  final user = UserData.myUser;
  CancelToken cancelToken = CancelToken(); // لتتمكن من إلغاء عملية التحميل
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cancelToken.cancel(); // إلغاء التحميل عند الخروج من الصفحة
    super.dispose();
  }

  bool _show = false;
  Future<void> uploadPdf() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf'], // السماح فقط بملفات PDF
    // );

    if (_filepdf != null) {
      PlatformFile file = _filepdf!.files.first;
      String filePath = file.path!;

      if (mounted) {
        setState(() {
          _uploading = true;
        });
      }

      try {
        FormData formData = FormData.fromMap({
          "name": _fileName,
          "file": await MultipartFile.fromFile(filePath, filename: _fileName),
        });

        await dio.post(
          '${ApiService.url}api/doctor/upload_file', // رابط الخادم الذي سيتم رفع الملف إليه
          data: formData,
          cancelToken: cancelToken,
          options: Options(headers: {
            'Authorization': 'Bearer ${user.token}',
          }),
          onSendProgress: (int sent, int total) {
            if (mounted) {
              setState(() {
                _progress = sent / total; // تحديث نسبة التقدم
              });
            }
          },
        );

        if (mounted) {
          setState(() {
            _uploading = false;
            _show = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم رفع الملف بنجاح!')),
          );
          BlocProvider.of<GetMyfileCubit>(context).getfile();
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _uploading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('حدث خطأ أثناء رفع الملف: $e')),
          );
        }
      }
    }
    // طلب الإذن للوصول إلى الملفات
    // var status = await Permission.storage.request();
    // if (status.isGranted) {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf'], // السماح فقط بملفات PDF
    // );

    // if (result != null) {
    //   PlatformFile file = result.files.first;
    //   String filePath = file.path!;

    //   setState(() {
    //     _fileName = file.name;
    //     _uploading = true;
    //   });

    //   try {
    //     FormData formData = FormData.fromMap({
    //       "file": await MultipartFile.fromFile(filePath, filename: _fileName),
    //     });

    //     await dio.post(
    //       'https://example.com/upload', // رابط الخادم الذي سيتم رفع الملف إليه
    //       data: formData,
    //       onSendProgress: (int sent, int total) {
    //         setState(() {
    //           _progress = sent / total; // تحديث نسبة التقدم
    //         });
    //       },
    //     );

    //     setState(() {
    //       _uploading = false;
    //     });

    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('تم رفع الملف بنجاح!')),
    //     );
    //   } catch (e) {
    //     setState(() {
    //       _uploading = false;
    //     });
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('حدث خطأ أثناء رفع الملف: $e')),
    //     );
    //   }
    // }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('تم رفض الإذن للوصول إلى الملفات')),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة ملف'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            _fileName != null
                ? InkWell(
                    onTap: () {
                      selectfile();
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .90,
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
                                  _fileName!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: InkWell(
                      onTap: () {
                        selectfile();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .90,
                        decoration: BoxDecoration(
                          color: mycolor.hcolor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 70,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 12),
                              child: const Icon(
                                FontAwesomeIcons.folderOpen,
                                color: mycolor.lcolor,
                                size: 35,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                'اضغط لتحديد ملف',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            _uploading
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SizedBox(
                          height: 40,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(50),
                            color: mycolor.tlcolor,
                            backgroundColor: mycolor.lcolor,
                            value: _progress,
                            minHeight: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('${(_progress * 100).toStringAsFixed(0)}%'),
                    ],
                  )
                : (_fileName != null && _show == false)
                    ? ElevatedButton(
                        onPressed: uploadPdf,
                        child: const Text('رفع الملف'),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}

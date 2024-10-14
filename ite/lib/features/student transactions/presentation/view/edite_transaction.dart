import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ite/core/utils/api_service.dart';

import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/title_labs.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20transactions/data/models/transaction_model/request.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/edite%20transaction/edite_transaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/get%20transaction/gettransaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view/widgets/image_selected.dart';

class EditeTransaction extends StatefulWidget {
  const EditeTransaction(
      {super.key, required this.type, required this.request});
  final String type;
  final Request request;
  @override
  State<EditeTransaction> createState() => _EditeTransactionState();
}

class _EditeTransactionState extends State<EditeTransaction> {
  final user = UserData.myUser;

  XFile? _image1;
  XFile? _image2;
  XFile? _image3;
  XFile? _image4;
  XFile? _image5;
  XFile? _image6;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(text: widget.type),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              imageDetails(
                  title: 'وجه امامي هوية',
                  image: _image1,
                  i: 1,
                  photo: widget.request.photo1!),
              const SizedBox(
                height: 50,
              ),
              imageDetails(
                  title: 'وجه خلفي هوية',
                  image: _image2,
                  i: 2,
                  photo: widget.request.photo2!),
              const SizedBox(
                height: 50,
              ),
              if (widget.type != 'بدل ضائع')
                Column(
                  children: [
                    imageDetails(
                        title: 'وجه امامي بطاقة',
                        image: _image3,
                        i: 3,
                        photo: widget.request.photo2!),
                    const SizedBox(
                      height: 50,
                    ),
                    imageDetails(
                        title: 'وجه خلفي بطاقة',
                        image: _image4,
                        i: 4,
                        photo: widget.request.photo4!),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              if (widget.type == 'مصدقة دوام')
                Column(
                  children: [
                    imageDetails(
                        title: 'صورة تبرع دم',
                        image: _image5,
                        i: 5,
                        photo: widget.request.photo5!),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              if (widget.type == 'بدل ضائع')
                Column(
                  children: [
                    imageDetails(
                        title: 'صورة ضبط شرطة',
                        image: _image6,
                        i: 6,
                        photo: widget.request.photo3!),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              GestureDetector(
                onTap: () {
                  uploadData();
                },
                child: const AddButton(
                    text: 'تعديل',
                    height: 60,
                    width: 100,
                    fontsize: 16,
                    color: mycolor.lcolor),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageDetails(
      {required String title,
      XFile? image,
      required int i,
      required String photo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * .35,
            child: TitleLabs(text: title)),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.width * .5,
          child: GestureDetector(
            onTap: () => _pickImageFromGallery(i),
            child: image == null
                ? ClipRRect(
                    borderRadius:
                        BorderRadius.circular(16), // تطبيق الحواف الدائرية
                    child: CachedNetworkImage(
                      imageUrl: "${ApiService.url}storage$photo", // رابط الصورة
                      fit: BoxFit.fill, // لضبط الصورة داخل الحاوية
                      placeholder: (context, url) => const Center(
                        child:
                            CircularProgressIndicator(), // يظهر أثناء تحميل الصورة
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error,
                            color: Colors.red), // يظهر في حالة الخطأ
                      ),
                    ),
                  )
                : ImageSelected(
                    path: image.path,
                  ),
          ),
        )
      ],
    );
  }

  Future<void> _pickImageFromGallery(int i) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(
      () {
        if (image != null) {
          if (i == 1) {
            _image1 = image;
          }
          if (i == 2) {
            _image2 = image;
          }
          if (i == 3) {
            _image3 = image;
          }
          if (i == 4) {
            _image4 = image;
          }
          if (i == 5) {
            _image5 = image;
          }
          if (i == 6) {
            _image6 = image;
          }
        }
      },
    );
  }

  Future<void> uploadData() async {
    if ((widget.type == 'مصدقة دوام' &&
            (_image1 == null ||
                _image2 == null ||
                _image3 == null ||
                _image4 == null ||
                _image5 == null)) ||
        (widget.type == 'حياة جامعية' &&
            (_image1 == null ||
                _image2 == null ||
                _image3 == null ||
                _image4 == null)) ||
        (widget.type == 'بدل تالف' &&
            (_image1 == null ||
                _image2 == null ||
                _image3 == null ||
                _image4 == null)) ||
        (widget.type == 'بدل ضائع' &&
            (_image1 == null || _image2 == null || _image3 == null))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء ملئ جميع الحقول')),
      );
      return;
    }
    FormData formData = widget.type == 'مصدقة دوام'
        ? FormData.fromMap({
            'id': widget.request.id,
            'student_name': user.name,
            'type': widget.type,
            'photo1': await MultipartFile.fromFile(
              _image1!.path,
            ),
            'photo2': await MultipartFile.fromFile(
              _image2!.path,
            ),

            'photo3': await MultipartFile.fromFile(
              _image3!.path,
            ),
            'photo4': await MultipartFile.fromFile(
              _image4!.path,
            ),
            'photo5': await MultipartFile.fromFile(
              _image5!.path,
            ), // إضافة الصور
          })
        : widget.type == 'حياة جامعية'
            ? FormData.fromMap({
                'id': widget.request.id,
                'student_name': user.name,
                'type': widget.type,
                'photo1': await MultipartFile.fromFile(
                  _image1!.path,
                ),
                'photo2': await MultipartFile.fromFile(
                  _image2!.path,
                ),

                'photo3': await MultipartFile.fromFile(
                  _image3!.path,
                ),
                'photo4': await MultipartFile.fromFile(
                  _image4!.path,
                ),
                // إضافة الصور
              })
            : widget.type == 'بدل تالف'
                ? FormData.fromMap({
                    'id': widget.request.id,
                    'student_name': user.name,
                    'type': widget.type,
                    'photo1': await MultipartFile.fromFile(
                      _image1!.path,
                    ),
                    'photo2': await MultipartFile.fromFile(
                      _image2!.path,
                    ),

                    'photo3': await MultipartFile.fromFile(
                      _image3!.path,
                    ),
                    'photo4': await MultipartFile.fromFile(
                      _image4!.path,
                    ),
                    // إضافة الصور
                  })
                : FormData.fromMap({
                    'id': widget.request.id,
                    'student_name': user.name,
                    'type': widget.type,
                    'photo1': await MultipartFile.fromFile(
                      _image1!.path,
                    ),
                    'photo2': await MultipartFile.fromFile(
                      _image2!.path,
                    ),

                    'photo3': await MultipartFile.fromFile(
                      _image3!.path,
                    ),

                    // إضافة الصور
                  });

    try {
      BlocProvider.of<EditeTransactionCubit>(context)
          .editetransaction(formData);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: 200,
            child: BlocBuilder<EditeTransactionCubit, EditeTransactionState>(
              builder: (context, state) {
                if (state is EditeTransactionLoading) {
                  return const Loadingresponse();
                } else if (state is EditeTransactionfailure) {
                  return Failurmsg(msg: state.errormsg);
                } else if (state is EditeTransactionSuccess) {
                  BlocProvider.of<GettransactionCubit>(context)
                      .gettransaction();
                  return Failurmsg(msg: state.msg);
                }
                return Container();
              },
            ),
          ),
        ),
      );
    } catch (e) {
      print("Error uploading data: $e");
    }
  }
}

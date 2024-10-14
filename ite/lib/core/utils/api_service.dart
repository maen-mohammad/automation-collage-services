import 'package:dio/dio.dart';
import 'package:ite/features/profiles/presentation/view/user/user_data.dart';

class ApiService {
  ApiService(this.dio);
  static String url = 'http://192.168.239.198:8000/';
  final starteurl = 'http://192.168.239.198:8000/api/';
  final Dio dio;
  final user = UserData.myUser;

  Future<Map<String, dynamic>> get(
      {required String endurl, required var body, String? token}) async {
    var response = await dio.post(
      starteurl + endurl,
      queryParameters: body,
    );

    print(response.data);

    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endurl, required var body}) async {
    var response = await dio.post(starteurl + endurl,
        queryParameters: body,
        options: Options(headers: {
          'Authorization': 'Bearer ${user.token}',
        }));

    print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post1(
      {required String endurl, required var body}) async {
      //   FormData formData = FormData.fromMap({
      //   'student_name': user.name,
      //   'type': widget.type,
      //   'photo1': await MultipartFile.fromFile(
      //     _image1!.path,
      //   ),
      //   'photo2': await MultipartFile.fromFile(
      //     _image2!.path,
      //   ),
      //   'photo3': await MultipartFile.fromFile(
      //     _image3!.path,
      //   ),
      //   'photo5': await MultipartFile.fromFile(
      //     _image5!.path,
      //   ), // إضافة الصور
      // });
    print(body.toString());
    var response = await dio.post(starteurl + endurl,
        data: body,
        options: Options(headers: {
          'Authorization': 'Bearer ${user.token}',
        }));

    print(response.data);
    return response.data;
  }
}

// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:dio/dio.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class DownloadFileExample extends StatefulWidget {
//   @override
//   _DownloadFileExampleState createState() => _DownloadFileExampleState();
// }

// class _DownloadFileExampleState extends State<DownloadFileExample> {
//   String downloadProgress = "";
//   String? filePath;

//   Future<void> requestPermission() async {
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//   }

//   Future<void> downloadFile() async {
//     await requestPermission();

//     Dio dio = Dio();

//     try {
//       String url =
//           "http://192.168.43.113:8000/storage/files/z0PurEVgrCMX4KisUOuypFLeC9nFDwHnfkNGds8V.pdf";

//       // الحصول على مسار مجلد Downloads
//       Directory? downloadsDir = Directory('/storage/emulated/0/Download');

//       String savePath = path.join(downloadsDir.path, "downloaded_file1.pdf");

//       await dio.download(
//         url,
//         savePath,
//         onReceiveProgress: (received, total) {
//           setState(() {
//             downloadProgress =
//                 "${(received / total * 100).toStringAsFixed(0)}%";
//           });
//         },
//       );

//       setState(() {
//         filePath = savePath;
//         downloadProgress = "Download completed";
//       });

//       print("File downloaded to: $savePath");
//     } catch (e) {
//       print("Error during file download: $e");
//       setState(() {
//         downloadProgress = "Error during download";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Download File Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: downloadFile,
//               child: Text("Download File"),
//             ),
//             SizedBox(height: 20),
//             Text(downloadProgress),
//             SizedBox(height: 20),
//             filePath != null ? Text("Saved at: $filePath") : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

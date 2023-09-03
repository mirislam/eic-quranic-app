import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewFile extends StatelessWidget {
  final String fileName;
  final String surahName;

  const ViewFile({required this.fileName, required this.surahName});

  @override
  Widget build(BuildContext context) {
    print('File to load:' + fileName);
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName),
      ),
      body: SfPdfViewer.asset(
        'assets/surahs/' + fileName,
      ),
    );
  }
}

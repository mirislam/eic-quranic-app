import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPdfViewer extends StatefulWidget {
  final String pdfPath;
  MyPdfViewer({required this.pdfPath});
  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  late PDFViewController pdfViewController;

  @override
  Widget build(BuildContext context) {
    print('File to load:' + widget.pdfPath);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
      ),
    );
  }

/** 
  @override
  Widget build(BuildContext context) {
    print('File to load:' + widget.pdfPath);
    return Scaffold(
      appBar: AppBar(
        title: Text("My PDF Document"),
      ),
      body: PDFView(
        filePath: widget.pdfPath,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        onError: (error) {
          print(error);
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
      ),
    );
  }
  */
}

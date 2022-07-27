import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constants/app_colors.dart';
import '../controllers/pdfCOnroller.dart';

class PDFScreen extends StatelessWidget {
 const PDFScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            Get.arguments[0],
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold)
                .copyWith(color: AppColors.white),
          ),
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.bgBlack,
        ),
        body: SfPdfViewer.network(
              Get.arguments[1]));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/Restitutor_custom/resticustoms.dart';
import 'package:quiz_17_app/model/datastorage.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  late Datastorage detail;

  @override
  void initState() {
    super.initState();
    detail = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detail.dataColor,
      appBar: restiApB(text: textBS(text: 'Detail view'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(detail.imagePath, width: 50,),
            SizedBox(height: 30,),
            textBS(text: detail.text),
          ],
        ),
      ),
    );
  }
}

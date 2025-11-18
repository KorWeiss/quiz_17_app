import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/Restitutor_custom/resticustoms.dart';
import 'package:quiz_17_app/model/datastorage.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  //  Property
  late int imageIndex;
  late Color? inputColor;
  late List<Datastorage> inputData;
  late List<String> images;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    images = ['images/cart.png', 'images/clock.png', 'images/pencil.png'];
    imageIndex = 0;
    inputData = [];
    textEditingController = TextEditingController();
    inputColor = Colors.white;
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: restiApB(text: textBS(text: 'Add view')),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(images[imageIndex], width: 50),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoPicker(
                      itemExtent: 50,
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      onSelectedItemChanged: (value) {
                        imageIndex = value;
                        setState(() {});
                      },
                      children: List.generate(
                        images.length,
                        (index) => Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Image.asset(images[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '할 일을 적으시오',
                  ),
                ),
              ),
              restiButtons(
                onPressed: () {
                  addProcess();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  addProcess() async {
    if (textEditingController.text.trim().isEmpty) {
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: textBS(text: '경고'),
          content: textBS(text: '아무 것도 입력하지 않으셨습니다', fontsize: TextSize.s),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: textBS(text: '확인', fontsize: TextSize.s),
            ),
          ],
        ),
      );
      return;
    }
    inputColor = await Get.dialog<Color>(
      barrierDismissible: false,
      AlertDialog(
        title: textBS(text: '색상 고르기'),
        content: textBS(text: '색상을 골라주세요', fontsize: TextSize.s),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: Colors.amber[100]);
            },
            child: textBS(text: '호박색', fontsize: TextSize.s),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: Colors.red[100]);
            },
            child: textBS(text: '빨간색', fontsize: TextSize.s),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: Colors.green[100]);
            },
            child: textBS(text: '초록색', fontsize: TextSize.s),
          ),
        ],
      ),
    );
    inputData.add(
      Datastorage(
        dataColor: inputColor,
        imagePath: images[imageIndex],
        text: textEditingController.text.trim(),
      ),
    );
    Get.back(result: inputData);
  }
}

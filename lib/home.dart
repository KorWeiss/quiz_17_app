import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/Restitutor_custom/resticustoms.dart';
import 'package:quiz_17_app/model/datastorage.dart';
import 'package:quiz_17_app/view/addpage.dart';
import 'package:quiz_17_app/view/detailpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  Property
  late List<Datastorage> cards;
  late List<Datastorage> newData;

  @override
  void initState() {
    super.initState();
    cards = [];
    cards.add(
      Datastorage(
        dataColor: Colors.amberAccent[100],
        imagePath: 'images/cart.png',
        text: '장보기',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: textBS(text: 'Main view'),
        centerTitle: true,
        actions: [
          restiButtons(
            onPressed: () async {
              newData = await Get.to(Addpage());
              cards += newData;
              setState(() {});
            },
            buttonType: ButtonType.ib,
            iconData: Icons.add,
          ),
        ],
      ),
      body: Column(
        children: List.generate(cards.length, (index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            child: SizedBox(
              width: 400,
              height: 100,
              child: GestureDetector(
                onTap: () => Get.to(Detailpage(), arguments: cards[index]),
                child: Card(
                  color: cards[index].dataColor,
                  elevation: 10,
                  child: Row(
                    children: [
                      Image.asset(cards[index].imagePath, width: 50),
                      SizedBox(width: 30),
                      textBS(text: cards[index].text),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

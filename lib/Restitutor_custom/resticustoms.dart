import 'package:flutter/material.dart';

  //  text custom
  enum TextSize{s,b}

Text textBS({String text = 'title',
 TextStyle? textstyle,
 TextSize fontsize = TextSize.b
 }) {
  switch(fontsize){
    case TextSize.s: 
      return Text(text,
      style: textstyle ?? styleBS(fontSize: 15));
    case TextSize.b: 
      return Text(text,
      style: textstyle ?? styleBS(fontSize: 20));
  }
}

Text textWS({String text = 'basic text',
 TextStyle? textstyle,
 TextSize fontsize = TextSize.b
 }) {
  switch(fontsize){
    case TextSize.s: 
      return Text(text,
      style: textstyle ?? styleWS(fontSize: 15));
    case TextSize.b: 
      return Text(text,
      style: textstyle ?? styleWS(fontSize: 20));
  }
}

TextStyle styleBS({
  Color? color = Colors.black,
  double? fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle styleWS({
  Color? color = Colors.white,
  double? fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}

  //  appbar custom

enum AppbarAlign { l, r, c }

PreferredSizeWidget restiApB({
  Color bgc = Colors.white,
  Text? text,
  Widget? leading,
  AppbarAlign align = AppbarAlign.l,
  TextStyle? textstyle,
  List<Widget>? actions,
}) {
  Widget titleWidget;
  switch (align) {
    case AppbarAlign.l:
      titleWidget = (Align(
        alignment: Alignment.centerLeft,
        child: text ?? Text('title', style: textstyle ?? styleBS()),
      ));
      break;
    case AppbarAlign.r:
      titleWidget = (Align(
        alignment: Alignment.centerRight,
        child: text ?? Text('title', style: textstyle ?? styleBS()),
      ));
      break;
    default:
      titleWidget = text ?? Text('title', style: textstyle ?? styleBS());
      break;
  }

  return AppBar(
    backgroundColor: bgc,
    centerTitle: align == AppbarAlign.c,
    title: titleWidget,
    leading: leading,
    actions: actions,
  );
}

  //  button custom

enum ButtonType { eb, tb, ob, ib, fa }
enum ChildType {i,t}

Widget restiButtons({
  required VoidCallback onPressed,
  ButtonType buttonType = ButtonType.eb,
  ChildType childtype = ChildType.t,
  Color buttoncolor = Colors.blue,
  String buttonText = 'Test',
  Color textcolor = Colors.white,
  IconData iconData = Icons.star,
}) {
  Widget buildChild() {
    switch (childtype) {
      case ChildType.t:
        return Text(
          buttonText,
          style: styleWS()
        );
      case ChildType.i:
        return Icon(iconData, color: textcolor);
    }
  }
  switch (buttonType) {
    case ButtonType.eb:
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          minimumSize: Size(150, 40),
        ),
        child: buildChild(),
      );

    case ButtonType.tb:
      return TextButton(
        onPressed: onPressed,
        child: buildChild(),
      );

    case ButtonType.ob:
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: buttoncolor,
          side: BorderSide(color: Colors.black, width: 2),
        ),
        child: buildChild(),
      );
    case ButtonType.ib:
      return IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
      );
    case ButtonType.fa:
      return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: buttoncolor,
        child: buildChild(),
      );
  }
}
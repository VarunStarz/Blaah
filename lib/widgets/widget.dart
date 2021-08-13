import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    title: Image.asset("assets/images/LogoMakr_1D24ZU.png"),
  );
}

Widget appBarMainOrderCans(BuildContext context){
  return AppBar(
    title: Text("Order Cans", style: TextStyle(color: Colors.white, fontSize: 27),),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      )
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}

TextStyle mediumTextStyle(){
  return TextStyle(
  color: Colors.white,
  fontSize: 17,
  );
}
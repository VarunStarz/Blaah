import 'package:blaah/widgets/widget.dart';
import 'package:flutter/material.dart';

class orderCan extends StatefulWidget {
  @override
  _orderCanState createState() => _orderCanState();
}

class _orderCanState extends State<orderCan> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(height: 100, width: 40,),
                  Text("Number of Cans : ",style: simpleTextStyle(),),
                  SizedBox(height: 40, width: 40,),
                  /*TextFormField(
                    controller: ,
                    style: simpleTextStyle(),)*/
                ],
              ),

            ],
          ),
        ),
      ),
    );


  }
}



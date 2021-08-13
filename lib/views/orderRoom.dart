import 'package:blaah/views/orderCan.dart';
import 'package:blaah/widgets/widget.dart';
import 'package:flutter/material.dart';


class orderRoom extends StatefulWidget {
  @override
  _orderRoomState createState() => _orderRoomState();
}

class _orderRoomState extends State<orderRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainOrderCans(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => orderCan()
          ));
        },
      ),
    );
  }
}




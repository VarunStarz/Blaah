import 'package:blaah/views/chatRoomsScreen.dart';
import 'package:blaah/views/orderRoom.dart';
import 'package:blaah/widgets/widget.dart';
import 'package:flutter/material.dart';

class chooseRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        color: Colors.black26,
        child: Column(
          children: [
            SizedBox(height: 220,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChatRoom()
                ));
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC),
                        ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("CHAT", style: mediumTextStyle(),
                  ),
              ),
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => orderRoom()
                ));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC),
                      ]
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("ORDER CAN", style: mediumTextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

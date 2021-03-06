import 'package:blaah/helper/constants.dart';
import 'package:blaah/helper/helperfunctions.dart';
import 'package:blaah/services/database.dart';
import 'package:blaah/views/conversation_screen.dart';
import 'package:blaah/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

String _myName;

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
      setState(() {
        searchSnapshot = val;
      });

    });
  }

  ///create chatroom and send user to conversation
  createChatRoomAndStartConversation({String userName}){

    if(userName != Constants.myName){
      String chatRoomId = getChatRoomId(userName, Constants.myName);

      List<String> users = [userName, Constants.myName];

      Map<String, dynamic> chatRoomMap = {
        "users" : users,
        "chatRoomId" : chatRoomId
      };

      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(chatRoomId)
      ));
    } else {
      print("You cannot send a message to yourself");
    }
  }

  Widget SearchTile({String userName, String userEmail}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: mediumTextStyle(),),
              Text(userEmail,style: mediumTextStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatRoomAndStartConversation(
                userName: userName
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text("Message", style: mediumTextStyle(),),
            ),
          )
        ],
      ),
    );
  }

  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return SearchTile(
            userName: searchSnapshot.documents[index].data["name"],
            userEmail: searchSnapshot.documents[index].data["email"],
          );
    }) : Container();
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    _myName = await HelperFunctions.getUserNameSharedPreference();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "search username...",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFF),
                            ]
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset("assets/images/search_white.png")
                    ),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

getChatRoomId(String a , String b){
  if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)){
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}

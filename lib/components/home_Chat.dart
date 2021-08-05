import 'dart:async';

import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ScrollController chatController = ScrollController();

  void _scrollToBottom() {
    if (chatController.hasClients) {
      chatController.animateTo(chatController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(Duration(milliseconds: 500), () => _scrollToBottom());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 150),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              controller: chatController,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 80, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.blue[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Christoph",
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                          "Hallo meine lieben Kollegen, was haltet ihr von Chicken Shorba?"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(240, 16, 16, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      color: Colors.grey[300]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("JAAAA!!!"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 200, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.green[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Simon",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Ich bin bei Jeremy"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 230, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.red[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mama",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Wann denn?"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 200, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.green[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Simon",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Nachmittags halt"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 130, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.red[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mama",
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                          "Nah Schatz, ich meinte, wann möchtet ihr das kochen?"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 75, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.blue[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Christoph",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Samstags? Dann habe ich genügend Zeit."),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 260, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.green[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Simon",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Achsooo"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 200, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.orange[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Papa",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Da gibt's Pizza  :-)"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(80, 16, 16, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      color: Colors.grey[300]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Warum denn nicht Sonntag? Samstag bin ich eh nicht da."),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 80, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.blue[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Christoph",
                          style: Theme.of(context).textTheme.headline5),
                      Text("ARSCHI! WO BIST DU WIEDER??"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 200, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.red[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mama",
                          style: Theme.of(context).textTheme.headline5),
                      Text("Hey!"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 4, 140, 0),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Colors.red[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mir wäre Sonntag auch lieber."),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  height: 42,
                  //width: 250,

                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Nachricht",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000))),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.send, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Wochenplan",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Letzte Mahlzeiten",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 360,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                margin: index == 0
                    ? EdgeInsets.fromLTRB(16, 8, 16, 32)
                    : EdgeInsets.fromLTRB(0, 8, 16, 32),
                width: 230,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Chat",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          height: 400,
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: Text("Hi"),
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
                                borderSide:
                                    BorderSide(color: Color(0x00000000))),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0x00000000))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0x00000000))),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0x00000000))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:
                        Icon(Icons.send, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

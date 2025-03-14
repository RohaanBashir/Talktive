import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talktive/core/theme.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [CircleAvatar(), SizedBox(width: 15)],
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              children: [
              Expanded(child: Text("Unread Messages", style: Theme.of(context).textTheme.bodyLarge,)),
              Text("Time", style: Theme.of(context).textTheme.bodyLarge,),

            ],),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                  _listViewTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _listViewTile() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text("Rohaan"),
      subtitle: Text("nice to meet you how are you"),
      leading: SizedBox(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
          ),
        ),
      ),
    ),
  );
}

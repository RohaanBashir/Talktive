import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talktive/core/theme.dart';

import '../cubit/messages_cubit.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}


class _MessagesState extends State<Messages> {

  @override
  void initState(){
    final messageCubit = BlocProvider.of<MessagesCubit>(context);
    messageCubit.fetchConversations();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [CircleAvatar(), SizedBox(width: 15)],
      ),

      body: BlocConsumer<MessagesCubit, MessagesState>(
        listener: (context, state) {
          if (state is MessagesStateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Unread Messages",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text("Time", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
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
                  child:
                      state is ConversationsFetchSuccess
                          ? ListView.builder(
                            itemCount: state.conversations.length,
                            itemBuilder:
                                (BuildContext context, int index) =>
                                    _listViewTile(
                                      state
                                          .conversations[index]!
                                          .participantName,
                                      state.conversations[index]!.lastMessage,
                                    ),
                          )
                          : Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
Widget _listViewTile(String userTitle, String userSubTitle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(userTitle),
      subtitle: Text(userSubTitle),
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

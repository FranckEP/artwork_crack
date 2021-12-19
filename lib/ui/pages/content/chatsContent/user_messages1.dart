import 'package:artwork_crack/domain/models/chat_model.dart';
import 'package:artwork_crack/domain/models/user.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/management_chat.dart';
import 'package:artwork_crack/ui/pages/chatPage/chat_page.dart';
import 'package:artwork_crack/ui/pages/content/chatsContent/widgets/chat_card.dart';
import 'package:artwork_crack/ui/pages/content/chatsContent/widgets/select_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMessages extends StatefulWidget {
  const UserMessages({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UserMessages> {
  late AuthController controller;
  late final ChatManager manager;
  late Stream<QuerySnapshot<Map<String, dynamic>>> chatsStream;

  @override
  void initState() {
    super.initState();
    manager = ChatManager();
    controller = Get.find<AuthController>();
    chatsStream = manager.getChatList(controller.currentUser!.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: chatsStream,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            final items = manager.extractChats(snapshot.data!);
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                ChatModel chat = items[index];
                UserModel user =
                    chat.getTargetUser(controller.currentUser!.email);
                return ChatCard(
                  pictureUrl: user.pictureUrl,
                  name: user.name,
                  message: chat.lastMessage.message,
                  time: '',
                  onTap: () {
                    print('${chat.userA}');
                    print('${chat.userB}');
                    Get.to(() => ChatPage(chat: chat));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Something went wrong: ${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SelectUser());
        },
        child: Icon(Icons.add_comment),
      ),
    );
  }
}

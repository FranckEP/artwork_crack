import 'package:artwork_crack/domain/models/chat.dart';
import 'package:artwork_crack/domain/models/mensaje.dart';
import 'package:artwork_crack/domain/models/user.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/management_mensaje.dart';
import 'package:artwork_crack/ui/custom.dart';
import 'package:artwork_crack/ui/pages/chat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatPage extends StatelessWidget {
  final Chat? chat;
  final UserModel? localUser, remoteUser;
  late final ChatManager manager;

  ChatPage({Key? key, this.chat, this.localUser, this.remoteUser})
      : super(key: key) {
    manager = ChatManager();
  }

  // Dependency injection: State management controller
  late final AuthController controller = Get.find();
  late final UIController uiController = Get.find();

  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    UserModel? currentUser = controller.currentUser;

    return Scaffold(
      appBar: CustomAppBar(
        tile: Text(
          remoteUser?.name ?? chat!.getTargetUser(currentUser!.email).name,
        ),
        picUrl: remoteUser?.pictureUrl ??
            "https://ui-avatars.com/api/?name=${remoteUser?.name ?? 'User'}",
        context: context,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          // Fetching state value, with reactivity using Obx
          child: FutureBuilder<Chat>(
            future: _loadChatRecord(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Chat loadedChat = snapshot.data!;
                return ChatView(
                  chatReference: loadedChat.reference,
                  manager: manager,
                  localEmail: currentUser!.email,
                  updateChat: (message) async {
                    loadedChat.lastMessage = message;
                    await manager.updateChat(loadedChat);
                  },
                  onSend: (String message) async {
                    ChatMessage lastMessage = ChatMessage(
                        message: message, sender: currentUser.email);
                    loadedChat.lastMessage = lastMessage;
                    if (loadedChat.reference != null) {
                      loadedChat.lastMessage = lastMessage;
                      await manager.sendMessage(loadedChat);
                    } else {
                      return await manager.createChat(loadedChat);
                    }
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<Chat> _loadChatRecord() async {
    late Chat currentChat;
    if (chat != null) {
      currentChat = chat!;
    } else {
      Chat? retrievedChat =
          await manager.checkIfChatExist(localUser!.email, remoteUser!.email);
      currentChat = retrievedChat ??
          Chat(
            userA: localUser!,
            userB: remoteUser!,
            lastMessage: ChatMessage(message: '', sender: ''),
          );
    }
    return currentChat;
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'Models/message_model.dart';
import 'Models/user_model.dart';
import 'chat_buble.dart';
import 'chat_title.dart';

class ChatScreen extends StatefulWidget {
  //
  const ChatScreen() : super();

  final String title = "Chat Screen";

  static const String ROUTE_ID = 'chat_screen';

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  //
  late List<ChatMessageModel> _chatMessages;
  late User _chatUser;
  late TextEditingController _chatTfController;
  late ScrollController _chatLVController;
  late UserOnlineStatus _userOnlineStatus;

  @override
  void initState() {
    super.initState();
    _userOnlineStatus = UserOnlineStatus.connecting;
    _chatLVController = ScrollController(initialScrollOffset: 0.0);
    _chatTfController = TextEditingController();
    _chatMessages = [];
    _chatUser = User(email: "email@email.com", id: "id123", name: "userName", urlPerfilPicture: "https://i1.sndcdn.com/avatars-000396582750-afqhbt-t240x240.jpg", tokenNotification: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ChatTitle(
          chatUser: _chatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _chatList(),
              _bottomChatArea(),
            ],
          ),
        ),
      ),
    );
  }

  _chatList() {
    return Expanded(
      child: ListView.builder(
        cacheExtent: 100,
        controller: _chatLVController,
        reverse: false,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        itemCount: null == _chatMessages ? 0 : _chatMessages.length,
        itemBuilder: (context, index) {
          ChatMessageModel chatMessage = _chatMessages[index];
          return _chatBubble(
            chatMessage,
          );
        },
      ),
    );
  }

  _bottomChatArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          _chatTextArea(),
          IconButton(
            icon: Icon(Icons.send), color: Colors.orange,
            onPressed: () async {
              _sendButtonTap();
            },
          ),
        ],
      ),
    );
  }

  _chatTextArea() {
    return Expanded(
      child: TextField(
        controller: _chatTfController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Type message...',
        ),
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int cont = 0;
  _sendButtonTap() async {
    if (_chatTfController.text.isEmpty) {
      return;
    }
    ChatMessageModel chatMessageModel = ChatMessageModel(chatId: 0, to: _chatUser.id, from: "$cont", toUserOnlineStatus: false, message: _chatTfController.text, chatType: "group", toTokenNotification: _chatUser.tokenNotification);

    _addMessage(0, chatMessageModel, cont % 2 == 0);
    cont = cont + 1;
    _clearMessage();
  }

  _clearMessage() {
    _chatTfController.text = '';
  }

  _chatBubble(ChatMessageModel chatMessageModel) {
    bool fromMe = int.parse(chatMessageModel.from) % 2 == 0;
    Alignment alignment = fromMe ? Alignment.topRight : Alignment.topLeft;
    Alignment chatArrowAlignment = fromMe ? Alignment.topRight : Alignment.topLeft;
    TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: fromMe ? Colors.white : Colors.black54,
    );
    Color chatBgColor = fromMe ? Colors.blue : Colors.orange;
    EdgeInsets edgeInsets = fromMe ? EdgeInsets.fromLTRB(5, 5, 15, 5) : EdgeInsets.fromLTRB(15, 5, 5, 5);
    EdgeInsets margins = fromMe ? EdgeInsets.fromLTRB(80, 5, 10, 5) : EdgeInsets.fromLTRB(10, 5, 80, 5);

    return Container(
      margin: margins,
      child: Align(
        alignment: alignment,
        child: Column(
          children: <Widget>[
            CustomPaint(
              painter: ChatBubble(
                color: chatBgColor,
                alignment: chatArrowAlignment,
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: edgeInsets,
                      child: Text(
                        chatMessageModel.message,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onChatMessageReceived(data) {
    print('onChatMessageReceived $data');
    if (null == data || data.toString().isEmpty) {
      return;
    }
    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    bool online = chatMessageModel.toUserOnlineStatus;
    _updateToUserOnlineStatusInUI(online);
    processMessage(chatMessageModel);
  }

  onMessageBackFromServer(data) {
    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    print("Message from  server");
    print(data);
    if (chatMessageModel.to == _chatUser.id) {
      onUserConnectionStatus(data);
    }
  }

  onUserConnectionStatus(data) {
    print("data:" + data.toString());

    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    bool online = chatMessageModel.toUserOnlineStatus;
    _updateToUserOnlineStatusInUI(online);
  }

  _updateToUserOnlineStatusInUI(online) {
    print("Actualizando estado");
    setState(() {
      _userOnlineStatus = online ? UserOnlineStatus.online : UserOnlineStatus.not_online;
    });
  }

  processMessage(ChatMessageModel chatMessageModel) {
    _addMessage(0, chatMessageModel, false);
  }

  _addMessage(id, ChatMessageModel chatMessageModel, fromMe) async {
    print('Adding Message to UI ${chatMessageModel.message}');
    setState(() {
      _chatMessages.add(chatMessageModel);
    });
    print('Total Messages: ${_chatMessages.length}');
    _chatListScrollToBottom();
  }

  /// Scroll the Chat List when it goes to bottom
  _chatListScrollToBottom() {
    Timer(Duration(milliseconds: 100), () {
      if (_chatLVController.hasClients) {
        _chatLVController.animateTo(
          _chatLVController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
        );
      }
    });
  }
}

enum UserOnlineStatus { connecting, online, not_online }

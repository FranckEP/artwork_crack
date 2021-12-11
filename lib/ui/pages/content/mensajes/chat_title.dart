import 'package:flutter/material.dart';

import 'Models/user_model.dart';
import 'chat_page.dart';

class ChatTitle extends StatelessWidget {
  //
  const ChatTitle({
    required this.chatUser,
    required this.userOnlineStatus,
  }) : super();

  final User chatUser;
  final UserOnlineStatus userOnlineStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(chatUser.name),
          Text(
            _getStatusText(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  _getStatusText() {
    if (userOnlineStatus == UserOnlineStatus.connecting) {
      return 'connecting...';
    }
    if (userOnlineStatus == UserOnlineStatus.online) {
      return 'online';
    }
    if (userOnlineStatus == UserOnlineStatus.not_online) {
      return 'not online';
    }
  }
}

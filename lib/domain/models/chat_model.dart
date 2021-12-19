import 'package:artwork_crack/domain/models/message.dart';
import 'package:artwork_crack/domain/models/user.dart';

class ChatModel {
  UserModel userA, userB;
  ChatMessage lastMessage;
  String? reference;
  String? recordReference;

  ChatModel({
    required this.userA,
    required this.userB,
    required this.lastMessage,
    this.reference,
    this.recordReference,
  });

// Muestra aas tarjetas de los diferentes usurios en la  vista del chat
  UserModel getTargetUser(String email) {
    if (userA.email != email) {
      return userA;
    } else {
      return userB;
    }
  }

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    final data = map['data'];
    return ChatModel(
      userA: UserModel.fromJson(data['userA']),
      userB: UserModel.fromJson(data['userB']),
      lastMessage: ChatMessage.fromJson(data['lastMessage']),
      reference: data['reference'],
      recordReference: map['ref'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userA": userA.toJson(),
      "userB": userB.toJson(),
      "users": {
        userA.email.replaceAll('.', ''): true,
        userB.email.replaceAll('.', ''): true
      },
      "lastMessage": lastMessage.toJson(),
      "reference": reference,
    };
  }
}

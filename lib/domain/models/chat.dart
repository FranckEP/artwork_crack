import 'package:artwork_crack/domain/models/mensaje.dart';
import 'package:artwork_crack/domain/models/user.dart';

class Chat {
  UserModel userA, userB;
  ChatMessage lastMessage;
  String? reference;
  String? recordReference;

  Chat({
    required this.userA,
    required this.userB,
    required this.lastMessage,
    this.reference,
    this.recordReference,
  });

  UserModel getTargetUser(String email) {
    if (userA.email != email) {
      return userA;
    } else {
      return userB;
    }
  }

  factory Chat.fromJson(Map<String, dynamic> map) {
    final data = map['data'];
    return Chat(
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

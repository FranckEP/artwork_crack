import 'package:artwork_crack/data/repositories/chat/realtime_database.dart';
import 'package:artwork_crack/domain/models/chat.dart';
import 'package:artwork_crack/domain/models/mensaje.dart';
import 'package:artwork_crack/domain/models/user.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/ui/pages/chat/chat_page.dart';
import 'package:artwork_crack/ui/pages/content/chats/widgets/chat_card.dart';
import 'package:artwork_crack/ui/pages/content/estados/widgets/estadoscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SelectUser> {
  AuthController authController = Get.find();
  getUser() async {
    return authController.extractAllUser();
  }

  createChat(remoteUser, localUser, date)async{
    String reference = await realTimeChat.createChat(message: ChatMessage(message: '', sender: localUser.email).toJson());
    print(reference);
  }

  RealTimeChat realTimeChat = Get.find();

  List<UserModel> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Text('No hay usuarios');
              } else {
                users = snapshot.data as List<UserModel>;
                DateFormat format = DateFormat('MMMM-dd-yyyy / hh:mm a');
                DateTime newDate = DateTime.now();
                String date = format.format(newDate);
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      print(users[index]);
                      createChat(users[index], authController.currentUser, date);
                      return ChatCard(
                        message: '',
                        name: users[index].name,
                        onTap: () {
                          Get.back();
                          Get.to(()=>ChatPage(localUser: authController.currentUser, remoteUser: users[index],));
                        },
                        pictureUrl: users[index].pictureUrl,
                        time: date,
                      );
                    });
              }
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

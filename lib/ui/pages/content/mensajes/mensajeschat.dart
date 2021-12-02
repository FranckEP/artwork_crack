import 'package:artwork_crack/ui/pages/content/mensajes/widgets/mensajescard.dart';
import 'package:flutter/material.dart';

import '../../../custom.dart';

class ChatScreen extends StatefulWidget {
  static String id = "Chatscreen";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextEditingController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: const [Text('Hola cómo estás')],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: TextField(
                      onChanged: (str) {
                        message = str;
                      },
                      controller: messageTextEditingController,
                      cursorColor: Colors.black,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Say something...',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 20, 10),
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          // function when send button is pressed
                          var now = DateTime.now();
                          print("Send button pressed");
                          print(message);
                          messageTextEditingController.clear();
                        },
                        icon: const Icon(Icons.send_rounded),
                        color: const Color(0xffF4AC47),
                        iconSize: 30,
                      ),
                      backgroundColor: Colors.white,
                      radius: 25,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

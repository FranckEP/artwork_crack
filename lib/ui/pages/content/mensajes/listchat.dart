import 'package:artwork_crack/ui/custom.dart';
import 'package:artwork_crack/ui/pages/content/mensajes/Models/listamensajes.dart';
import 'package:flutter/material.dart';

class ChatListPageView extends StatefulWidget {
  const ChatListPageView({Key? key}) : super(key: key);

  @override
  _ChatListPageViewState createState() => _ChatListPageViewState();
}

class _ChatListPageViewState extends State<ChatListPageView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        //backgroundColor: Colors.white,
        body: ListView(
          children: const <Widget>[
            ChatListViewItem(
              hasUnreadMessage: true,
              image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
              lastMessage:
                  "Buenas noches, cómo se encuentra",
              name: "Bree Jarvis",
              newMesssageCount: 2,
              time: "13:35 PM",
            ),
            ChatListViewItem(
              hasUnreadMessage: true,
              image: NetworkImage('https://uifaces.co/our-content/donated/AmtdPFai.jpg'),
              lastMessage:
                  "Holaaaaaaa",
              name: "Alex",
              newMesssageCount: 1,
              time: "19:27 PM",
            ),
            ChatListViewItem(
              hasUnreadMessage: false,
              image: NetworkImage('https://uifaces.co/our-content/donated/2bvuFyb8.jpg'),
              lastMessage:
                  "Qué tal le va",
              name: "Carson Sinclair",
              newMesssageCount: 0,
              time: "2:30 PM",
            ),
            ChatListViewItem(
              hasUnreadMessage: false,
              image: NetworkImage('https://uifaces.co/our-content/donated/6h0HeYG_.jpg'),
              lastMessage:
                  "Uy hoy fiesta en mi casa, trae las cervezas",
              name: "Sophia-Rose Bush",
              newMesssageCount: 0,
              time: "12:08 PM",
            ),
          ],
        ),
      );
    }
  }
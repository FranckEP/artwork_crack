import 'package:artwork_crack/ui/pages/content/mensajes/widgets/listamensajes.dart';
import 'package:flutter/material.dart';

import '../../../custom.dart';

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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          context: context, 
          tile: const Text('ArtWork Crack', 
            textAlign: TextAlign.left, 
            style: TextStyle(
              color: Color(0xff3A434D),
            ),
          ), 
          picUrl: 'https://uifaces.co/our-content/donated/2Stzj6r-.jpg',
          ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: ListView(
            children: const <Widget>[
              ChatListViewItem(
                hasUnreadMessage: true,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Bree Jarvis",
                newMesssageCount: 8,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: true,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Alex",
                newMesssageCount: 5,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: false,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Carson Sinclair",
                newMesssageCount: 0,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: false,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Lucian Guerra",
                newMesssageCount: 0,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: false,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Sophia-Rose Bush",
                newMesssageCount: 0,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: false,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Mohammad",
                newMesssageCount: 0,
                time: "19:27 PM",
              ),
              ChatListViewItem(
                hasUnreadMessage: false,
                image: NetworkImage('https://uifaces.co/our-content/donated/2Stzj6r-.jpg'),
                lastMessage:
                    "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                name: "Jimi Cooke",
                newMesssageCount: 0,
                time: "19:27 PM",
              ),
            ],
          ),
        ),
      );
    }
  }

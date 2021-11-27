import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  String user;
  String Message;
  bool others;

  ChatBubble(this.user,this.Message, this.others, {Key? key}) : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: widget.others ? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(widget.user,style: const TextStyle(fontSize: 14),),
          Material(
            elevation: 10,

            borderRadius:widget.others ? const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20)):const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: const Color(0xff68CAF0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(widget.Message,style: const TextStyle(fontSize: 20,color: Color(0xff3A434D),)),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AppCardSocial extends StatelessWidget { 
  final Widget? topLeftWidget, topRightWidget, content, contentstring; 
  final String title;

  const AppCardSocial(
    {Key? key, 
    required this.title, 
    this.content, 
    this.topLeftWidget, 
    this.topRightWidget,
    this.contentstring})
    : super( 
      key: key,  
  );

  @override 
  Widget build(BuildContext context){
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
          top: 4.0, bottom: 13.0, left: 6.0, right: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: const Color(0xff68CAF0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  topLeftWidget != null
                    ? topLeftWidget!
                    : const SizedBox(
                      width: 48.0,
                  ),
                  Expanded(
                    child: Text(
                      title, 
                      textAlign: TextAlign.center, 
                      style: const TextStyle(fontSize: 20), 
                    ),
                  ),
                  topRightWidget != null 
                    ? topRightWidget! 
                    : const SizedBox(
                      width: 48.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 6.0,
              ),
              if (content != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: content,
                ),
              if (contentstring != null)
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: contentstring,
                ),
            ],
          ),
        ),
    );
  }
}

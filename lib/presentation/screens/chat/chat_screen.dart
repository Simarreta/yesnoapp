import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://as2.ftcdn.net/v2/jpg/02/45/28/17/1000_F_245281721_2uYVgLSFnaH9AlZ1WWpkZavIcEEGBU84.jpg'),
          ),
        ),
        title:const Text("Mi amor ❤️"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return (index%2 ==0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                    },
                    ),
            ),
            ///Todo: Caja de mensajes
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
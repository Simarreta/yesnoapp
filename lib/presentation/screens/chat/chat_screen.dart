import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/providers/chat_provider.dart';

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

    final chatProvider = context.watch<ChatProvider>();
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                     /*return (index%2 ==0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();*/
                      final message= chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(herMessage: message)
                          : MyMessageBubble(messageMy: message);
                    },
                    ),
            ),
            ///Todo: Caja de mensajes
            MessageFieldBox(
             // onValue: (value)=> chatProvider.sendMessage(value),
              onValue:chatProvider.sendMessage //Esto es lo mismo que lo de arriba, solo que como la misma cantidad de argumentos son los que se pasan al metodo y en la misma posicion, solo hay que enviar la referencia
            )
          ],
        ),
      ),
    );
  }
}
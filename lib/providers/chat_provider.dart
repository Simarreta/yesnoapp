import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList= [
    Message(text: 'Hola amor', fromWho: FromWho.mine),
    Message(text: 'que tal', fromWho: FromWho.mine),
    Message(text: 'yo bien', fromWho: FromWho.mine),
   ];

   Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();

   }

   Future<void> sendMessage(String text) async {
    if(text.isEmpty)return;
    final newMessage= Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    if (text.endsWith('?')){ await herReply();};
    notifyListeners();
    moveScrollToBottom();  //esto es como el setState, para notificar el cambio y que redibuje la pantalla

   }

   Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, //para que llegue al maximo que puede llegar 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
   }

}
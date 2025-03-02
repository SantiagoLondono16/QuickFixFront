import 'package:flutter/material.dart';
import 'package:quick_fix/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    // Message(text: 'hola s', fromwho: Fromwho.mine),
    //Message(text: 'ya realizaste el trabajo', fromwho: Fromwho.mine),
  ];

  Future<void> sendMesagge(String text) async {
    if (text.isEmpty) return;
    final newmessage = Message(text: text, fromwho: Fromwho.mine);
    messageList.add(newmessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_maybe_no/domain/entities/message.dart';
import 'package:yes_maybe_no/presentation/providers/chat_provider.dart';
import 'package:yes_maybe_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_maybe_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_maybe_no/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://content20.lecturas.com/medio/2022/09/24/ana-de-armas_ede84fd2_800x800.jpg"),
          ),
        ),
        title: const Text("Mi Vida <3"),
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
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.she)
                    ? HerMessageBubble(message : message)
                    : MyMessageBubble(message : message);
              },
            )),
            //Caja de Texto de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

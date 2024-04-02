import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

import '../../widgets/chat/her_message_bubble.dart';
import '../../widgets/share/message_field_box.dart';
class ChatScreen extends StatelessWidget{
  const ChatScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        leading:const Padding(
          padding: const EdgeInsets.all(4.0),
          child:CircleAvatar(
            backgroundImage:NetworkImage('https://biografieonline.it/img/bio/a/Axl_Rose.jpg'),
          )
        ) ,
      title:Text('Axel Rose ♥'),

      ),
      body: _ChatView(),

    );
  }
}

class _ChatView extends StatelessWidget{
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider= context.watch<ChatProvider>();//va a estar pendiente de los cambios que haya en estea clase


    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(child:ListView.builder(
                controller:chatProvider.chatScrollController ,
                  itemCount: chatProvider.messagesList.length,
                  itemBuilder: (context,index){
                    final message=chatProvider.messagesList[index];
                    return (message.fromWho==FromWho.hers?
                    HerMessageBubble(message:message):
                    MyMessageBubble(message:message));

              })),
              //Caja de texto
              MessageFieldBox(
                //onValue: (value)=>chatProvider.sendMessage(value),
                onValue:chatProvider.sendMessage,
              )
            ],
          ),
        ));
  }

}




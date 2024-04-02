import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget{
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});
  @override
  Widget build(BuildContext context) {
    final focusNode=FocusNode();
    final textController=TextEditingController();
    final outlineInputborder=UnderlineInputBorder(
        borderSide: BorderSide(color:Colors.transparent),
        borderRadius:BorderRadius.circular(40)
    );
    final inputDecoration=InputDecoration(
      hintText: 'END YOUR MESSAGE WITH A "?"',
        filled: true,
        enabledBorder: outlineInputborder,
        focusedBorder: outlineInputborder,
        suffixIcon: IconButton(
          icon:const Icon(Icons.send_outlined),
          onPressed: () {
              final textValue=textController.value.text;
              textController.clear();
              onValue(textValue);
          }, )

    );
    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }

}
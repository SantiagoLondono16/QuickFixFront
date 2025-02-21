import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onvalue;
  const MessageFieldBox({super.key, required this.onvalue});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;

    final textControll = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'Escribe tu mensaje:  ',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textControll.value.text;

            textControll.clear();
            onvalue(textValue);
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textControll.clear();
        focusNode.requestFocus();
        onvalue(value);
      },
    );
  }
}

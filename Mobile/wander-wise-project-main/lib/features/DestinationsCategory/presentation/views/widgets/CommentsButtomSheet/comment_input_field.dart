import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class CommentInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmojiVisible;
  final VoidCallback onToggleEmoji;
  final VoidCallback onSend;

  const CommentInputField({
    super.key,
    required this.controller,
    required this.isEmojiVisible,
    required this.onToggleEmoji,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kprimaryColor3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kprimaryColor3),
              ),
              hintText: "Write a comment...",
              hintStyle: TextStyle(color: kprimaryColor5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              suffixIcon: IconButton(
                icon: Icon(Icons.emoji_emotions),
                onPressed: onToggleEmoji,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: onSend,
          icon: const Icon(Icons.send, color: Colors.blue),
        ),
      ],
    );
  }
}
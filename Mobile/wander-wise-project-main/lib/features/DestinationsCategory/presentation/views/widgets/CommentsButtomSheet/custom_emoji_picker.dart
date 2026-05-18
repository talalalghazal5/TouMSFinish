import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class CustomEmojiPicker extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmojiPicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: EmojiPicker(
        scrollController: ScrollController(),
        onEmojiSelected: (category, emoji) {
          controller.text += emoji.emoji;
        },
        config: Config(
          bottomActionBarConfig: BottomActionBarConfig(
            backgroundColor: Colors.grey.withValues(alpha: 0.1),
            buttonColor: Colors.white,
            buttonIconColor: Colors.black,
          ),
          emojiViewConfig: EmojiViewConfig(
            backgroundColor: Colors.white,
            buttonMode: ButtonMode.NONE,
            emojiSizeMax: 20,
            columns: 8,
          ),
        ),
      ),
    );
  }
}
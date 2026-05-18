import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/comment_model.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/CommentsButtomSheet/comment_input_field.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/CommentsButtomSheet/custom_comment_tile.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/CommentsButtomSheet/custom_emoji_picker.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController controller = TextEditingController();
  bool isEmojiVisible = false;

  final List<CommentModel> comments = [
    CommentModel(userName: "Lara", comment: "Amazing place!", date: DateTime.now().subtract(Duration(hours: 2))),
    CommentModel(userName: "Yousef", comment: "I’ve been there, it’s beautiful.", date: DateTime.now().subtract(Duration(days: 1))),
    CommentModel(userName: "Sana", comment: "Highly recommended for families.", date: DateTime.now().subtract(Duration(minutes: 45))),
  ];

  void addComment() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        comments.add(CommentModel(userName: "You", comment: text, date: DateTime.now()));
        controller.clear();
      });
    }
  }

  void deleteComment(int index) {
    setState(() {
      comments.removeAt(index);
    });
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(color: kprimaryColor3, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Comments', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return CommentTile(
                    comment: comment,
                    isUser: comment.userName == "You",
                    dateText: _formatDate(comment.date),
                    onDelete: () => deleteComment(index),
                  );
                },
              ),
            ),
            CommentInputField(
              controller: controller,
              isEmojiVisible: isEmojiVisible,
              onToggleEmoji: () => setState(() => isEmojiVisible = !isEmojiVisible),
              onSend: addComment,
            ),
            if (isEmojiVisible) CustomEmojiPicker(controller: controller),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

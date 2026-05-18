import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/comment_model.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;
  final bool isUser;
  final String dateText;
  final VoidCallback? onDelete;

  const CommentTile({
    super.key,
    required this.comment,
    required this.isUser,
    required this.dateText,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: kprimaryColor2.withValues(alpha: 0.2),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 30, color: kprimaryColor5),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    comment.userName,
                    style: textStyleSize15.copyWith(color: Colors.black87),
                  ),
                ),
                if (isUser)
                  IconButton(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete Comment', style: textStyleSize20),
                          content: Text(
                            'Are you sure you want to delete this comment?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: kprimaryColor3),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true && onDelete != null) {
                        onDelete!();
                      }
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Delete Comment',
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              comment.comment,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            SizedBox(height: 6),
            Text(
              dateText,
              style: TextStyle(fontSize: 12, color: kprimaryColor4),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../model/label.dart';

class EditCow extends StatelessWidget {
  const EditCow({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(editTopicName),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('This is a demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.edit,
            color: Colors.grey[400],
            size: 20,
          ),
          Text(
            'แก้ไข',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

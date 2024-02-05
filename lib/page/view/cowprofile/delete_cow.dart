import 'package:flutter/material.dart';

class DeleteCow extends StatelessWidget {
  const DeleteCow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[600],
          ),
          onPressed: () {},
          child: Row(
            children: const [
              Icon(
                Icons.delete_forever_rounded,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 2),
              Text(
                'ลบวัวออก',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

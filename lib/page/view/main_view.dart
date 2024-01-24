import 'package:flutter/material.dart';
import '../model/label.dart';
import 'components/body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 35)),
        title: const Text(
          screenTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AddBirth(),
    );
  }
}

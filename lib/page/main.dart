import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'view/addcow/body.dart';

void main() {
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form control',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFFec4899),
            ),
      ),
      home: AddBirth(),
    );
  }
}

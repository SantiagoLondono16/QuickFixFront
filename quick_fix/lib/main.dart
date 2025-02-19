import 'package:flutter/material.dart';
import 'package:quick_fix/screens/chat_screen.dart';
import 'package:quick_fix/screens/home_screen.dart';
import 'package:quick_fix/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quic Fix',
      theme: AppTheme(selectedColor: 1).theme(),
      home: const ChatScreen(),
    );
  }
}

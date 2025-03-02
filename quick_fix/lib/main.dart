import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_fix/providers/chat_provider.dart';
import 'package:quick_fix/screens/chat_screen.dart';
import 'package:quick_fix/screens/home_screen.dart';
import 'package:quick_fix/screens/request_service.dart';
import 'package:quick_fix/screens/settins_screen.dart';
import 'package:quick_fix/screens/welcome_screen.dart';
import 'package:quick_fix/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quic Fix',
        theme: AppTheme(selectedColor: 1).theme(),
        home: RequestServiceScreen(),
      ),
    );
  }
}

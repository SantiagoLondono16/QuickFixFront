import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import 'package:quick_fix/providers/chat_provider.dart';
import 'package:quick_fix/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Quick Fix',
        theme: AppTheme(selectedColor: 1).theme(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'telegram_menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelegramMenu(),
    );
  }
}

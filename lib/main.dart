import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
import 'config/theme/app_theme.dart';
import 'presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>ChatProvider()) //el _ es el context, pero como no hace falta se pone la barra baja
      ],
      child: MaterialApp(
        title: 'Yes no App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 2).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
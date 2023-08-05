import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/tictak_provider_app/tictak_app_demo.dart';
import 'package:provider_demo/my_practise/tictak_provider_app/tictak_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TikTacmethodProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TicTacAppDemoUi(),
      ),
    );
  }
}

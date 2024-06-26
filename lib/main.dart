import 'package:flutter/material.dart';
import 'package:livelynk/providers/contact_provider.dart';
import 'package:livelynk/providers/home_chat_provider.dart';
import 'package:livelynk/providers/home_provider.dart';
import 'package:livelynk/providers/user_chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:livelynk/app.dart';
import 'package:livelynk/providers/auth_provider.dart';
import 'package:livelynk/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<ContactProvider>(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider<HomeChatProvider>(
          create: (context) => HomeChatProvider(),
        ),
        ChangeNotifierProvider<UserChatProvider>(
          create: (context) => UserChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(background: Colors.black),
        ),
        home: const App(),
      ),
    );
  }
}

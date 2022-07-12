import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_chat/screens/splash_screen.dart';
import 'package:we_chat/utills/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'Database URl',
    anonKey:
        'databaseKey',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weChat',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}

//ym1147Vse2BOIPxL

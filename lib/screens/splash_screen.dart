import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_chat/screens/chat_screen.dart';
import 'package:we_chat/screens/reg_screen.dart';
import 'package:we_chat/utills/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends SupabaseAuthState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:preloader);
  }
  @override 
  void onAuthenticated(Session session){
    Navigator.of(context).pushAndRemoveUntil(ChatScreen.route(), (_) => false);
  }
  @override
  void onUnauthenticated() {
    Navigator.of(context)
        .pushAndRemoveUntil(RegistrationScreen.route(), (_) => false);
  }
  @override
  void onErrorAuthenticating(String message){}

  @override 
  void onPasswordRecovery(Session session) {}
}
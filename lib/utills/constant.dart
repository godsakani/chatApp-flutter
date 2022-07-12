import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///Supabase client
final supabase = Supabase.instance.client;

///simple preloader inside a center widget
const preloader = Center(
  child: CircularProgressIndicator(
    color: Color(0xFF1875f1),
  ),
);

///Simple sized box to space out element
const formSpacer = SizedBox(
  height: 16,
  width: 16,
);

///some padding across all forms
const formPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 20);

///Basic theme color to change the look and feel of the app
final appTheme = ThemeData.light().copyWith(
  primaryColorDark: Color(0xFF1875f1),
  appBarTheme: const AppBarTheme(
    elevation: 1,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Color(0xFF242b28),
    ),
    titleTextStyle: TextStyle(
      color: Color(0xFF242b28),
      fontSize: 18,
    ),
  ),
  primaryColor: Color(0xFF1875f1),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Color(0xFF1875f1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Color(0xFF1875f1),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(
      color: Color(0xFF1875f1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
      ),
    ),
    focusColor: Color(0xFF1875f1),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xFF1875f1),
        width: 2,
      ),
    ),
  ),
);

extension ShowSnackBar on BuildContext {
  ///Displays snack Bar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

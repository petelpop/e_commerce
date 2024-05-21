import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/views/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider())
    ],
    child: MaterialApp(
      title: 'E Commerce App',
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        useMaterial3: true,
      ),
      home: const BottomNavbar(),
    )
  );
  
}
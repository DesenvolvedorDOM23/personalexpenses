import 'package:flutter/material.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depesas Pesoais',
      theme: ThemeData(
          primaryColor: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: tema.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.purple,
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber[900])),
      home: const HomePage(),
    );
  }
}

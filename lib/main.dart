import 'package:flutter/material.dart';
import 'package:square_app/pages/cube_page.dart';
import 'package:square_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dex App',

      routes: {
        //'/' :(context) => const HomePage(title: 'Home'),
        '/cube': (context) => const CubePage(),
        '/login': (context) => const LoginPage(),
      },

      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.pink[100],
        filledButtonTheme: FilledButtonThemeData( 
          style: FilledButton.styleFrom(
            backgroundColor: Colors.pink[100],
          ), 
        )
      ),
      home: const HomePage(title: 'Home'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: 
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                onPressed: () => Navigator.of(context).pushNamed('/cube'),
                child: const Text('Go to Cube'),
              ),
              const SizedBox(height: 20,),
              FilledButton(
                onPressed: () => Navigator.of(context).pushNamed('/login'), 
                child: const Text('Go to LogIn'),
              )
            ]
          ),
        ),
    );
  }
}
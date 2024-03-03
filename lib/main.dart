import 'package:flutter/material.dart';
import 'package:square_app/square.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sizeSquare = 0;
  double positionY = 0;
  double positionX = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        sizeSquare = MediaQuery.of(context).size.width / 5;
        positionX = MediaQuery.of(context).size.width / 2 - sizeSquare / 2;
        positionY = MediaQuery.of(context).size.height / 2 - sizeSquare / 2;
      });
    });
  }

  void moveSquare(double stepX, double stepY) {
    setState(() {
      positionX += stepX;
      positionY += stepY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.indigo)),
                child: Stack(
                  children: [
                    Positioned(
                      left: positionX,
                      top: positionY,
                      child: Square(
                        size: sizeSquare,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => moveSquare(0, 10),
                      child: const Text('Up'),
                    ),
                    ElevatedButton(
                      onPressed: () => moveSquare(0, -10),
                      child: const Text('Down'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

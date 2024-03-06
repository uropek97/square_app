import 'package:flutter/material.dart';
import 'package:square_app/listener_position.dart';
import 'package:square_app/square.dart';

class CubePage extends StatefulWidget {
  final String title;
  const CubePage({super.key, this.title = 'Cube'});

  @override
  State<CubePage> createState() => _CubePageState();
}

class _CubePageState extends State<CubePage> {
  ListenerPosition listener = ListenerPosition(100, 100);
  double stepSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),  
        ),
      ),
      body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  ListenableBuilder(
                    listenable: listener,
                    builder: (context, child) => Positioned(
                      top : MediaQuery.of(context).size.height / 2,
                      left: MediaQuery.of(context).size.width / 2,
                      child: Square(
                        size: MediaQuery.of(context).size.width / 11,
                        color: Theme.of(context).primaryColor,
                        ),
                      ),
                  ),
                ],
              ), 
            ),
            Expanded(child: Column(
              children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () => listener.moveObj(0, -stepSize), 
                      child: const Text('Up'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () => listener.moveObj(-stepSize, 0),
                      child: const Text('Left'),
                    ),
                    const SizedBox(width: 20,),
                    FilledButton(
                      onPressed: () => listener.moveObj(stepSize, 0), 
                      child: const Text('Right'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () => listener.moveObj(0, stepSize),
                      child: const Text('Down'), 
                    ),
                  ],
                )
              ],
              )
            ),
          ],
        ),
    );
  }
}
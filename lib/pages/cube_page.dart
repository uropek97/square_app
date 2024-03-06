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
  double stepSize = 150;
  ListenerPosition listener = ListenerPosition(0, 0);
  
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),),
                child:  
                  Stack(
                    children: [
                      ListenableBuilder(
                        listenable: (listener),
                        builder: (context, child) => Positioned(
                          top : listener.positionY,
                          left: listener.positionX,
                          child: Square(
                            size: MediaQuery.sizeOf(context).width / 11,
                            color: Theme.of(context).primaryColor,
                           ),
                          ),
                        ),
                    ],
                 ),
              ), 
            ),
            Expanded(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () => listener.moveObj(0, -stepSize), 
                      child: const Text('Up'),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
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
                const SizedBox(height: 10,),
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
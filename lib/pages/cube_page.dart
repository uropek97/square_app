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
  ListenerPosition listener = ListenerPosition(150, 150);
  final GlobalKey _containerKey = GlobalKey();
  late double containerHeight = 0;
  late double containerWidth = 0;

  void moveObject(ListenerPosition obj, double stepX, double stepY) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      containerHeight =
          (_containerKey.currentContext!.findRenderObject() as RenderBox)
              .size
              .height;
      containerWidth =
          (_containerKey.currentContext!.findRenderObject() as RenderBox)
              .size
              .width;

      obj.moveObj(stepX, stepY, containerHeight, containerWidth);
    });
  }

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
            flex: 3,
            child: Container(
              key: _containerKey,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
              ),
              child: Stack(
                children: [
                  ListenableBuilder(
                    listenable: (listener),
                    builder: (context, child) => Positioned(
                      top: listener.positionY,
                      left: listener.positionX,
                      child: Square(
                        size: listener.size,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: listener,
              builder: (context, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: listener.canMoveUp()
                            ? () => moveObject(listener, 0, -stepSize)
                            : null,
                        child: const Text('Up'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: listener.canMoveLeft()
                            ? () => moveObject(listener, -stepSize, 0)
                            : null,
                        child: const Text('Left'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      FilledButton(
                        onPressed: listener.canMoveRight(containerWidth)
                            ? () => moveObject(listener, stepSize, 0)
                            : null,
                        child: const Text('Right'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: listener.canMoveDown(containerHeight)
                            ? () => moveObject(listener, 0, stepSize)
                            : null,
                        child: const Text('Down'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
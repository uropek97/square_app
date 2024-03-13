import 'package:flutter/material.dart';
import 'package:square_app/cube_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubePageCubit extends StatefulWidget {
  const CubePageCubit({super.key});

  @override
  State<CubePageCubit> createState() => _CubePageCubitState();
}

class _CubePageCubitState extends State<CubePageCubit> {
  final cube = CubeCubit(1, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cube Cubit'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<CubeCubit, CubePosition>(
        bloc: cube,
        builder: (context, state) => Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    color: Colors.grey[200]),
                child: Row(
                  crossAxisAlignment: state.positionY,
                  mainAxisAlignment: state.positionX,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: cube.canMoveUp() ? cube.moveUp : null,
                    child: const Icon(Icons.arrow_upward),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: cube.canMoveLeft() ? cube.moveLeft : null,
                        child: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 20,),
                      FilledButton(
                        onPressed: cube.canMoveRight() ? cube.moveRight : null,
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: cube.canMoveDown() ? cube.moveDown : null,
                    child: const Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
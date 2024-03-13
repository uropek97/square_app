// import 'package:flutter/material.dart';
// import 'package:square_app/cube_bloc.dart';

// class CubePageCubit extends StatelessWidget {
//   final CubeCubit cube;
//   const CubePageCubit({super.key, required this.cube});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cube Cubit'),
//         centerTitle: true,
//       ),
//       body: BlocBuilder(
//         blok: cube,
//         builder: (context, state) => Column(
//           mainAxisAlignment: cube.positionY,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black54),
//                     color: Colors.grey[200]),
//                 child: Row(
//                   crossAxisAlignment: cube.positionX,
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       color: Colors.blueGrey,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 FilledButton(
//                   onPressed: cube.moveUp,
//                   child: const Icon(Icons.arrow_upward),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

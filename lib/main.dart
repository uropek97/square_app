import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:square_app/square.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Square'),
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
  bool ifTextButtons = true;
  double stepSize = 50;
  late String inputValue = '';

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
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: (){setState((){ifTextButtons = !ifTextButtons;});}, 
            child: ifTextButtons ? const Text('Icons') : const Text('Text'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Theme.of(context).primaryColorDark)),
                child: Stack(
                  children: [
                    Positioned(
                      left: positionX,
                      top: positionY,
                      child: Square(
                        size: sizeSquare,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => moveSquare(0, -stepSize),
                      child: ifTextButtons ? const Text('Up') : const Icon(Icons.arrow_upward),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => moveSquare(-stepSize, 0),
                      child: ifTextButtons ? const Text('Left') : const Icon(Icons.arrow_back),
                      ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () => moveSquare(stepSize, 0),
                      child: ifTextButtons ? const Text('Right') : const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => moveSquare(0, stepSize),
                        child: ifTextButtons ? const Text('Down') : const Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      child: TextField(
                        onChanged: (value) => setState((){
                          inputValue = value;
                          stepSize = double.parse(inputValue);  
                        }),
                        decoration: const InputDecoration(
                        labelText: 'Step size: '
                          ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    //хотел добавить так же и по нажатию кнопки сохранение 
                    //введённого значения в переменную, но пока не успел разобраться как
                    // ElevatedButton(
                    //   onPressed: (){}, 
                    //   child: ifTextButtons ? const Text('OK') : const Icon(Icons.done),),
                    const SizedBox(width: 20,),
                    //Text('$inputValue'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

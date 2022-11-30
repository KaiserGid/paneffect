import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage('assets/back.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              )),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(2, 3, 0.0001)
                ..rotateX(0.001 * _offset.dy)
                ..rotateY(-0.001 * _offset.dx),
              alignment: FractionalOffset.center,
              child: GestureDetector(
                onPanUpdate: (details) => setState(() {
                  print(_offset.dx);
                  _offset += details.delta;
                  print(_offset.dx);
                }),
                onTap: () => setState(() => _offset = Offset.zero),
                child: FractionallySizedBox(
                    widthFactor: 0.7,
                    heightFactor: 0.5,
                    child: (_offset.dx > -1500) || _offset.dx > 1550
                        ? const Image(
                            image: AssetImage('assets/richarlison.png'))
                        : const Icon(Icons.abc_outlined)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

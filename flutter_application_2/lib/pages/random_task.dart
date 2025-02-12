import 'package:flutter/material.dart';
import 'dart:math';

class RandomPhrase extends StatefulWidget {
  const RandomPhrase({super.key});

  @override
  State<RandomPhrase> createState() => _RandomPhraseState();
}

class _RandomPhraseState extends State<RandomPhrase> {
  final List phrases = [
    ["El éxito no es un destino, es un viaje, disfrútalo."],
    ["No tengas miedo de fallar, ten miedo de no intentarlo."],
    ["El fracaso es éxito si aprendemos de él."],
    ["La vida es demasiado corta como para preocuparse por cosas sin importancia."],
    ["No importan los años de tu vida, sino la vida de tus años."],
    ["El éxito consiste en pasar de fracaso en fracaso sin perder entusiasmo."],
    ["La vida es un lienzo en blanco, ¡pinta tu propio destino!"],
    ["La vida es como una montaña rusa, disfruta todo el trayecto."],
    ["Sonríe, porque cada pequeño logro es una victoria en sí misma."],
    ["Tu actitud positiva puede convertir los días grises en días llenos de luz."]
];

  late String _currentTask;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _currentTask = _getRandomPhrase();
  }

  String _getRandomPhrase() {
    return phrases[_random.nextInt(phrases.length)][0];
  }

  void _updateTask() {
    setState(() {
      _currentTask = _getRandomPhrase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspiración Diaria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tu frase del día es:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                _currentTask,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateTask,
              child: const Text('Obtener otra tarea'),
            ),
          ],
        ),
      ),
    );
  }
}
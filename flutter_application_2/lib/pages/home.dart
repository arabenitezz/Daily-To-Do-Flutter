import 'package:flutter/material.dart';
import '/pages/random_phrase.dart';
import '/pages/to_do_list.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily To Do'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Bienvenido/a',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomPhrase()),
                );
              },
              child: const Text('Inspiración Diaria'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoWidget()),
                );
              },
              child: const Text('Lista de tareas'),
            ),

          ],
        ),
      ),
    );
  }
}
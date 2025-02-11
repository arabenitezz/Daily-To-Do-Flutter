import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/to_do_list.dart';

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
                // Acción para obtener una tarea aleatoria
              },
              child: const Text('Tarea aleatoria'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción para ir a la lista de tareas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToDoWidget()),
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
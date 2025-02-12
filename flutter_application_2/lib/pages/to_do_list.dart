import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/to_do_utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

class ToDoWidget extends StatefulWidget {
  const ToDoWidget({super.key});

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  final _controller = TextEditingController();
  List toDoList = [];
  
  @override
  void initState() {
    super.initState();
    // loadTasks();
  }

// // Cargar tareas guardadas
// Future<void> loadTasks() async {
//   final prefs = await SharedPreferences.getInstance();
//   setState(() {
//     String? tasksJson = prefs.getString('tasks');
//     if (tasksJson != null) {
//       toDoList = json.decode(tasksJson);
//     } else {
//       toDoList = []; // Inicializar lista vacía si no hay datos guardados
//     }
//   });
// }


//   // Guardar tareas en SharedPreferences
//   Future<void> saveTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     String tasksJson = json.encode(toDoList);
//     await prefs.setString('tasks', tasksJson);
//   }

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      // saveTasks(); // Guardar después de cambiar el estado
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      // saveTasks(); // Guardar después de eliminar
    });
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
        // saveTasks(); // Guardar después de agregar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily To Do'),
      ),
      body: toDoList.isEmpty
          ? const Center(
              child: Text(
                'No hay tareas. ¡Agrega una!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, index) {
                return TodoList(
                  taskName: toDoList[index][0],
                  taskCompleted: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Agregar nueva tarea',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onSubmitted: (_) => saveNewTask(),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
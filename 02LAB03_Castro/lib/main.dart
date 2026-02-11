import 'package:flutter/material.dart';



void main() {

  runApp(const MyApp());

}



class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Simple To-Do List',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,

        useMaterial3: true,

      ),

      home: const TodoListScreen(),

    );

  }

}



class TodoListScreen extends StatefulWidget {

  const TodoListScreen({Key? key}) : super(key: key);



  @override

  State<TodoListScreen> createState() => _TodoListScreenState();

}




class _TodoListScreenState extends State<TodoListScreen> {

  final List<TodoItem> _tasks = [];

  final TextEditingController _controller = TextEditingController();



  void _addTask() {

  final task = _controller.text.trim();

  if (task.isNotEmpty) {

    setState(() {

      _tasks.add(TodoItem(title: task));

    });

    _controller.clear();

  }

}



void _toggleTask(int index) {

  setState(() {

    _tasks[index].isCompleted = !_tasks[index].isCompleted;

  });

}



void _removeTask(int index) {

  setState(() {

    _tasks.removeAt(index);

  });

}



@override

void dispose() {

  _controller.dispose();

  super.dispose();

}



  @override

Widget build(BuildContext context) {

  return Scaffold(

    appBar: AppBar(

      title: const Text('Simple To-Do List'),

      elevation: 2,

    ),

    body: Column(

      children: [

        Padding(

  padding: const EdgeInsets.all(16.0),

    child: Row(

      children: [

        Expanded(

          child: TextField(

            controller: _controller,

            decoration: const InputDecoration(

              hintText: 'Enter a new task',

              border: OutlineInputBorder(),

            ),

            onSubmitted: (_) => _addTask(),

          ),

        ),

        const SizedBox(width: 8),

        IconButton(

          icon: const Icon(Icons.add_circle, size: 40),

          color: Colors.blue,

          onPressed: _addTask,

        ),

      ],

    ),

  ),

const Divider(height: 1),




        Expanded(

  child: _tasks.isEmpty

      ? const Center(

          child: Text(

            'No tasks yet. Add one above!',

            style: TextStyle(fontSize: 16, color: Colors.grey),

          ),

        )

      : ListView.builder(

          itemCount: _tasks.length,

          itemBuilder: (context, index) {

            final task = _tasks[index];

            return Card(

              margin: const EdgeInsets.symmetric(

                horizontal: 16,

                vertical: 4,

              ),

              child: ListTile(

                leading: Checkbox(

                  value: task.isCompleted,

                  onChanged: (_) => _toggleTask(index),

                ),

                title: Text(

                  task.title,

                  style: TextStyle(

                    decoration: task.isCompleted

                        ? TextDecoration.lineThrough

                        : null,

                    color: task.isCompleted

                        ? Colors.grey

                        : Colors.black,

                  ),

                ),

                trailing: IconButton(

                  icon: const Icon(Icons.delete, color: Colors.red),

                  onPressed: () => _removeTask(index),

                ),

              ),

            );

          },

        ),

),

      ],

    ),

  );

}



}



class TodoItem {

  String title;

  bool isCompleted;



  TodoItem({

    required this.title,

    this.isCompleted = false,

  });

}



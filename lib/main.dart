import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Layout demo'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
              child: Text('This is Drawer Header!!!'),
            ),
            ListTile(title: Text('Option 1')),
            ListTile(title: Text('Option 2')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'Container, padding and SizedBox Demo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[300],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 60,
                    child: const Text('This is Container 1!'),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 60,
                    child: const Text('This is Container 2!'),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'Column and Row Demo!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[300],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    'Row demo!!!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                        child: Center(child: Text('A')),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                        child: Center(child: Text('B')),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                        child: Center(child: Text('C')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Column demo!!!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                          child: Center(child: Text('A')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                          child: Center(child: Text('B')),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: Center(child: Text('C')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'Responsive design với MediaQuery!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[300],
                ),
              ),
            ),
            Text(
              'Kích thước màn hình: ${screenWidth.toStringAsFixed(0)}x${screenHeight.toStringAsFixed(0)}',
            ),
            if (screenWidth < 500)
              Column(
                children: [
                  Container(
                    color: Colors.blue[100],
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text('Container 1'),
                  ),
                  Container(
                    color: Colors.green[100],
                    padding: const EdgeInsets.all(16),
                    child: const Text('Container 2'),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.blue[100],
                    padding: const EdgeInsets.all(16),
                    child: const Text('Container 1'),
                  ),
                  Container(
                    color: Colors.green[100],
                    padding: const EdgeInsets.all(16),
                    child: const Text('Container 2'),
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Pressed FloatingActionButton'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

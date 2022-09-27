import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<Widget> _paginas = [
    const Text("Home screen",
        style: TextStyle(fontSize: 16, color: Colors.green)),
    const Text("Notifications",
        style: TextStyle(fontSize: 16, color: Colors.green)),
    const Text("Settings", style: TextStyle(fontSize: 16, color: Colors.green)),
  ];
  int _elementoselecionado = 0;
  void _aoPressionar(int indice) {
    setState(() {
      _elementoselecionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Bottom NavBar Navigation"))),
        body: Center(
          child: _paginas.elementAt(_elementoselecionado),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: _elementoselecionado,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            onTap: _aoPressionar));
  }
}

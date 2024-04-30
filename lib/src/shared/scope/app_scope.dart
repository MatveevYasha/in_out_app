import 'package:flutter/material.dart';

class AppScope extends StatefulWidget {
  final List<Widget> child;

  const AppScope({required this.child, super.key});

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Бюджетный трекер - test_app'),
      ),
      body: widget.child[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_rounded),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Список',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Статистика',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

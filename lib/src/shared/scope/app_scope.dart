import 'package:flutter/material.dart';
import 'package:in_out_app/src/shared/scope/widgets/filter_bottom_sheet.dart';

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
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              builder: (context) => const FilterBottomSheet(),
            ),
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
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

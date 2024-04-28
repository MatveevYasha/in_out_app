import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/data/entities/deal.dart';

class HomePage extends StatelessWidget {
  final List<Deal> deals;

  const HomePage({required this.deals, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Доходы',
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  Text(
                    deals.first.amount.toString(),
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () => _dialogBuilder(context),
                        icon: Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.white,
                          size: MediaQuery.sizeOf(context).width / 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

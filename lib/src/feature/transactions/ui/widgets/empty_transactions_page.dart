import 'package:flutter/material.dart';

class EmptyTransactionsPage extends StatelessWidget {
  const EmptyTransactionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Список транзакций пуст, необходимо добавить покупку или доход на передыдущем экране.',
        style: TextStyle(fontSize: 21),
        textAlign: TextAlign.center,
      ),
    );
  }
}

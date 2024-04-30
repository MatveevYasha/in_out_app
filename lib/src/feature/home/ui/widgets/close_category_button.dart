import 'package:flutter/material.dart';

class CloseCategoryButton extends StatelessWidget {
  const CloseCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: const Text('Закрыть'),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

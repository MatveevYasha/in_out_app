import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/amount_dialog.dart';

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  IncomeDealType? incomeCategory = IncomeDealType.salary;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выберете категорию'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: IncomeDealType.values
            .map(
              (e) => RadioListTile<IncomeDealType>(
                title: Text(IncomeDealType.toEntity(e)),
                value: e,
                groupValue: incomeCategory,
                onChanged: (value) {
                  setState(() {
                    incomeCategory = value;
                  });
                },
              ),
            )
            .toList(),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Закрыть'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Далее'),
          onPressed: () {
            Navigator.of(context).pop();
            _amountDialog(context, incomeCategory);
          },
        ),
      ],
    );
  }

  Future<void> _amountDialog(BuildContext context, IncomeDealType? incomeCategory) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AmountDialog(incomeCategory: incomeCategory);
      },
    );
  }
}

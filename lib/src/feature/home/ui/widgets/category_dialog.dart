import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/amount_dialog.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/close_category_button.dart';

class CategoryDialog extends StatefulWidget {
  final String title;

  const CategoryDialog({required this.title, super.key});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  IncomeDealType? incomeCategory = IncomeDealType.salary;
  ExpensesDealType? expenseCategory = ExpensesDealType.supermarkets;

  @override
  Widget build(BuildContext context) {
    final categoryIsIncome = widget.title == 'Доходы';

    return AlertDialog(
      title: const Text('Выберете категорию'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: categoryIsIncome
            ? IncomeDealType.values
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
                .toList()
            : ExpensesDealType.values
                .map(
                  (e) => RadioListTile<ExpensesDealType>(
                    title: Text(ExpensesDealType.toEntity(e)),
                    value: e,
                    groupValue: expenseCategory,
                    onChanged: (value) {
                      setState(() {
                        expenseCategory = value;
                      });
                    },
                  ),
                )
                .toList(),
      ),
      actions: [
        const CloseCategoryButton(),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Далее'),
          onPressed: () {
            Navigator.of(context).pop();
            _amountDialog(
              context,
              categoryIsIncome: categoryIsIncome,
              incomeCategory: incomeCategory,
              expenseCategory: expenseCategory,
            );
          },
        ),
      ],
    );
  }

  Future<void> _amountDialog(
    BuildContext context, {
    required bool categoryIsIncome,
    required IncomeDealType? incomeCategory,
    required ExpensesDealType? expenseCategory,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        if (categoryIsIncome) {
          return AmountDialog(
            incomeCategory: incomeCategory,
            categoryIsIncome: categoryIsIncome,
          );
        }

        return AmountDialog(
          expenseCategory: expenseCategory,
          categoryIsIncome: categoryIsIncome,
        );
      },
    );
  }
}

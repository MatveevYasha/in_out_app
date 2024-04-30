import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/home/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/amout_text_field_with_buttons.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/close_category_button.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AmountDialog extends StatefulWidget {
  final bool categoryIsIncome;
  final IncomeDealType? incomeCategory;
  final ExpensesDealType? expenseCategory;

  const AmountDialog({
    required this.categoryIsIncome,
    this.incomeCategory,
    this.expenseCategory,
    super.key,
  });

  @override
  State<AmountDialog> createState() => _AmountDialogState();
}

class _AmountDialogState extends State<AmountDialog> {
  final _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('ru'),
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);
    final dateString = (selectedDate.day == DateTime.now().day && selectedDate.month == DateTime.now().month)
        ? 'Сегодня'
        : DateFormat.MMMEd('ru').format(selectedDate);

    return AlertDialog(
      title: const Text('Введите сумму и выберете дату'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AmoutTextFieldWithButtons(
            controller: _controller,
            formKey: _formKey,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Выберете дату:'),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Text(dateString),
              ),
            ],
          ),
          if (selectedDate.compareTo(DateTime.now()) > 0)
            const Text(
              'Вы ввели дату из будущего, вы уверены?',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
      actions: [
        const CloseCategoryButton(),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Записать'),
          onPressed: () => _recordTransaction(bloc, context),
        ),
      ],
    );
  }

  void _recordTransaction(MainBloc bloc, BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (widget.categoryIsIncome) {
        bloc.add(
          AddDealEvent(
            incomeDeal: widget.incomeCategory,
            expensesDeal: null,
            amount: int.parse(_controller.text),
            date: selectedDate,
          ),
        );
      }
      if (!widget.categoryIsIncome) {
        bloc.add(
          AddDealEvent(
            incomeDeal: null,
            expensesDeal: widget.expenseCategory,
            amount: int.parse(_controller.text),
            date: selectedDate,
          ),
        );
      }

      _controller.clear();
      Navigator.of(context).pop();
    }
  }
}

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/home/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AmountDialog extends StatefulWidget {
  final IncomeDealType? incomeCategory;

  const AmountDialog({this.incomeCategory, super.key});

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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty && _controller.text.contains(RegExp(r'\d'))) {
                      int inv = int.parse(_controller.text);
                      setState(() {
                        if (inv > 0) {
                          inv = inv - 1;
                          _controller.text = '$inv';
                        }
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите сумму';
                      }
                      if (value.contains(RegExp(r'\D'))) {
                        return 'Введите целое число';
                      }

                      return null;
                    },
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty && _controller.text.contains(RegExp(r'\d'))) {
                      int inv = int.parse(_controller.text);
                      setState(() {
                        inv = inv + 1;
                        _controller.text = '$inv';
                      });
                    } else {
                      _controller.text = '1';
                    }
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
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
        ],
      ),
      actions: [
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
          child: const Text('Записать'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              bloc.add(
                AddDealEvent(
                  incomeDeal: widget.incomeCategory,
                  expensesDeal: null,
                  amount: int.parse(_controller.text),
                  date: selectedDate,
                ),
              );
              _controller.clear();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

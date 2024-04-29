import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/handbooks/expenses_deal_type.dart';
import 'package:in_out_app/src/feature/data/handbooks/income_deal_type.dart';
import 'package:in_out_app/src/feature/home/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:intl/intl.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class HomePage extends StatefulWidget {
  final List<Deal> deals;
  final int incomeAmount;
  final int expensesAmount;

  const HomePage({
    required this.deals,
    required this.incomeAmount,
    required this.expensesAmount,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int amount;
  late DateTime date;

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
                    '${widget.incomeAmount}',
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () => _categoryDialog(context),
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

  Future<void> _categoryDialog(BuildContext context) {
    IncomeDealType? incomeCategory = IncomeDealType.salary;

    return showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
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
          ),
        );
      },
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

class AmountDialog extends StatefulWidget {
  final IncomeDealType? incomeCategory;

  const AmountDialog({
    super.key,
    this.incomeCategory,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/bloc/main_event.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('ru'),
      context: context,
      initialDate: (selectedStartDate != null) ? selectedStartDate : DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('ru'),
      context: context,
      initialDate: (selectedEndDate != null) ? selectedEndDate : DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(fontSize: 18);
    final hasDateError =
        selectedStartDate != null && selectedEndDate != null && selectedStartDate!.compareTo(selectedEndDate!) > 0;

    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: (selectedStartDate == null)
                ? const Text(
                    'Установить фильтр даты начала',
                    style: defaultTextStyle,
                  )
                : Text(
                    DateFormat.yMEd('ru').format(selectedStartDate!),
                    style: defaultTextStyle,
                  ),
            onPressed: () => _selectStartDate(context),
          ),
          TextButton(
            child: (selectedEndDate == null)
                ? const Text(
                    'Установить фильтр даты окончания',
                    style: defaultTextStyle,
                  )
                : Text(
                    DateFormat.yMEd('ru').format(selectedEndDate!),
                    style: defaultTextStyle,
                  ),
            onPressed: () => _selectEndDate(context),
          ),
          if ((selectedStartDate != null || selectedEndDate != null) && !hasDateError)
            TextButton(
              child: const Text(
                'Применить фильтры',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(
                  AddFilterEvent(startDate: selectedStartDate, endDate: selectedEndDate),
                );
                Navigator.of(context).pop();
              },
            ),
          if (hasDateError)
            const Center(
              child: Text(
                'Даты введены неверно',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          TextButton(
            child: const Text(
              'Сбросить все фильтры',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(InitialMainEvent());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

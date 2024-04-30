import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/bloc/main_event.dart';

class RemoveDialog extends StatelessWidget {
  final Deal deal;

  const RemoveDialog({required this.deal, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Вы действительно хотите удалить запись?'),
      content: const SizedBox.shrink(),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Нет'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Да'),
          onPressed: () {
            BlocProvider.of<MainBloc>(context).add(
              RemoveDealEvent(deal: deal),
            );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

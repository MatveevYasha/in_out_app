import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/amount_button.dart';

class AmoutTextFieldWithButtons extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const AmoutTextFieldWithButtons({
    required this.formKey,
    required this.controller,
    super.key,
  });

  @override
  State<AmoutTextFieldWithButtons> createState() => _AmoutTextFieldWithButtonsState();
}

class _AmoutTextFieldWithButtonsState extends State<AmoutTextFieldWithButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AmountButton(
          onPressed: () {
            if (widget.controller.text.isNotEmpty && widget.controller.text.contains(RegExp(r'\d'))) {
              int inv = int.parse(widget.controller.text);
              setState(() {
                if (inv > 1) {
                  inv = inv - 1;
                  widget.controller.text = '$inv';
                }
              });
            }
          },
          icon: Icons.remove_circle_outline,
        ),
        Expanded(
          child: Form(
            key: widget.formKey,
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
              controller: widget.controller,
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
        AmountButton(
          onPressed: () {
            if (widget.controller.text.isNotEmpty && widget.controller.text.contains(RegExp(r'\d'))) {
              int inv = int.parse(widget.controller.text);
              setState(() {
                inv = inv + 1;
                widget.controller.text = '$inv';
              });
            } else {
              widget.controller.text = '1';
            }
          },
          icon: Icons.add_circle_outline,
        ),
      ],
    );
  }
}

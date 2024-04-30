import 'package:flutter/material.dart';

class AmountButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const AmountButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}

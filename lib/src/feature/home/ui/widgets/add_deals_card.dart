import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/ui/widgets/category_dialog.dart';

class AddDealsCard extends StatelessWidget {
  final int amount;
  final String title;
  final Color? color;

  const AddDealsCard({
    required this.amount,
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 48,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Text(
              '$amount',
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
    );
  }

  Future<void> _categoryDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return const CategoryDialog();
      },
    );
  }
}
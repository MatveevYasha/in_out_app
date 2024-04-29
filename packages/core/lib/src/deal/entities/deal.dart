abstract class Deal {
  // Transaction amount
  final int amount;

  // The date when the transfer was made
  final DateTime date;

  Deal({
    required this.amount,
    required this.date,
  });
}

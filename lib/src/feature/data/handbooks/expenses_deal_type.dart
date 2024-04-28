enum ExpensesDealType {
  supermarkets,
  home,
  taxi,
  cafe,
  entertainments,
  pharmacy;

  static String toEntity(ExpensesDealType type) {
    return switch (type) {
      ExpensesDealType.cafe => 'Кафе',
      ExpensesDealType.entertainments => 'Развлечения',
      ExpensesDealType.home => 'Для дома',
      ExpensesDealType.pharmacy => 'Аптека',
      ExpensesDealType.supermarkets => 'Супермаркеты',
      ExpensesDealType.taxi => 'Такси',
    };
  }
}

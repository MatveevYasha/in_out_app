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

  static ExpensesDealType toEnum(String name) {
    return switch (name) {
      'Кафе' => ExpensesDealType.cafe,
      'Развлечения' => ExpensesDealType.entertainments,
      'Для дома' => ExpensesDealType.home,
      'Аптека' => ExpensesDealType.pharmacy,
      'Супермаркеты' => ExpensesDealType.supermarkets,
      _ => ExpensesDealType.taxi,
    };
  }
}

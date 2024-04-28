enum IncomeDealType {
  salary,
  other;

  static String toEntity(IncomeDealType type) {
    return switch (type) {
      IncomeDealType.salary => 'Зарплата',
      IncomeDealType.other => 'Другое',
    };
  }
}

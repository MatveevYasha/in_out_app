enum IncomeDealType {
  salary,
  other;

  static String toEntity() {
    return switch (IncomeDealType.values.first) {
      IncomeDealType.salary => 'Зарплата',
      IncomeDealType.other => 'Другое',
    };
  }
}

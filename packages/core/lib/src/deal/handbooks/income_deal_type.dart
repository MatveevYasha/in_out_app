enum IncomeDealType {
  salary,
  other;

  static String toEntity(IncomeDealType type) {
    return switch (type) {
      IncomeDealType.salary => 'Зарплата',
      IncomeDealType.other => 'Другое',
    };
  }

  static IncomeDealType toEnum(String name) {
    return switch (name) {
      'Зарплата' => IncomeDealType.salary,
      _ => IncomeDealType.other,
    };
  }
}

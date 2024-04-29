// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DBExpensesDealTable extends DBExpensesDeal
    with TableInfo<$DBExpensesDealTable, DBExpensesDealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBExpensesDealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, amount, date, categoryName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_b_expenses_deal';
  @override
  VerificationContext validateIntegrity(Insertable<DBExpensesDealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBExpensesDealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBExpensesDealData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
    );
  }

  @override
  $DBExpensesDealTable createAlias(String alias) {
    return $DBExpensesDealTable(attachedDatabase, alias);
  }
}

class DBExpensesDealData extends DataClass
    implements Insertable<DBExpensesDealData> {
  final int id;
  final int amount;
  final DateTime date;
  final String categoryName;
  const DBExpensesDealData(
      {required this.id,
      required this.amount,
      required this.date,
      required this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<DateTime>(date);
    map['category_name'] = Variable<String>(categoryName);
    return map;
  }

  DBExpensesDealCompanion toCompanion(bool nullToAbsent) {
    return DBExpensesDealCompanion(
      id: Value(id),
      amount: Value(amount),
      date: Value(date),
      categoryName: Value(categoryName),
    );
  }

  factory DBExpensesDealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBExpensesDealData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<DateTime>(date),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  DBExpensesDealData copyWith(
          {int? id, int? amount, DateTime? date, String? categoryName}) =>
      DBExpensesDealData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        categoryName: categoryName ?? this.categoryName,
      );
  @override
  String toString() {
    return (StringBuffer('DBExpensesDealData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, date, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBExpensesDealData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.categoryName == this.categoryName);
}

class DBExpensesDealCompanion extends UpdateCompanion<DBExpensesDealData> {
  final Value<int> id;
  final Value<int> amount;
  final Value<DateTime> date;
  final Value<String> categoryName;
  const DBExpensesDealCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  DBExpensesDealCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required DateTime date,
    required String categoryName,
  })  : amount = Value(amount),
        date = Value(date),
        categoryName = Value(categoryName);
  static Insertable<DBExpensesDealData> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<DateTime>? date,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  DBExpensesDealCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<DateTime>? date,
      Value<String>? categoryName}) {
    return DBExpensesDealCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBExpensesDealCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $DBIncomeDealTable extends DBIncomeDeal
    with TableInfo<$DBIncomeDealTable, DBIncomeDealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBIncomeDealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, amount, date, categoryName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_b_income_deal';
  @override
  VerificationContext validateIntegrity(Insertable<DBIncomeDealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBIncomeDealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBIncomeDealData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
    );
  }

  @override
  $DBIncomeDealTable createAlias(String alias) {
    return $DBIncomeDealTable(attachedDatabase, alias);
  }
}

class DBIncomeDealData extends DataClass
    implements Insertable<DBIncomeDealData> {
  final int id;
  final int amount;
  final DateTime date;
  final String categoryName;
  const DBIncomeDealData(
      {required this.id,
      required this.amount,
      required this.date,
      required this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<DateTime>(date);
    map['category_name'] = Variable<String>(categoryName);
    return map;
  }

  DBIncomeDealCompanion toCompanion(bool nullToAbsent) {
    return DBIncomeDealCompanion(
      id: Value(id),
      amount: Value(amount),
      date: Value(date),
      categoryName: Value(categoryName),
    );
  }

  factory DBIncomeDealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBIncomeDealData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<DateTime>(date),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  DBIncomeDealData copyWith(
          {int? id, int? amount, DateTime? date, String? categoryName}) =>
      DBIncomeDealData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        categoryName: categoryName ?? this.categoryName,
      );
  @override
  String toString() {
    return (StringBuffer('DBIncomeDealData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, date, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBIncomeDealData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.categoryName == this.categoryName);
}

class DBIncomeDealCompanion extends UpdateCompanion<DBIncomeDealData> {
  final Value<int> id;
  final Value<int> amount;
  final Value<DateTime> date;
  final Value<String> categoryName;
  const DBIncomeDealCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  DBIncomeDealCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required DateTime date,
    required String categoryName,
  })  : amount = Value(amount),
        date = Value(date),
        categoryName = Value(categoryName);
  static Insertable<DBIncomeDealData> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<DateTime>? date,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  DBIncomeDealCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<DateTime>? date,
      Value<String>? categoryName}) {
    return DBIncomeDealCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBIncomeDealCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $DBExpensesDealTable dBExpensesDeal = $DBExpensesDealTable(this);
  late final $DBIncomeDealTable dBIncomeDeal = $DBIncomeDealTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dBExpensesDeal, dBIncomeDeal];
}

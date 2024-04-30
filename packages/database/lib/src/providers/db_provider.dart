import 'dart:async';

import 'package:core/core.dart';
import 'package:database/src/database.dart';
import 'package:drift/drift.dart';

import '../../database.dart';

class DataBaseDataProvider implements DBDataProvider {
  final Database _database;

  DataBaseDataProvider(Database database) : _database = database;

  // @override
  // Stream<ScannedItem> getScansHistory({PaginationValue? pagination}) {
  //   final controller = StreamController<ScannedItem>();
  //   _getScannedItems(controller, pagination: pagination).whenComplete(controller.close);

  //   return controller.stream;
  // }

  // @override
  // Future<void> saveScannedItem(ScannedItem item) async {
  //   final (objectId, type) = switch (item) {
  //     final ScannedProduct product => (
  //         await _database.productSetter.saveProduct(product),
  //         DBScannedItemTypes.product,
  //       ),
  //     final ScannedEmployee employee => (
  //         await _database.clientSetter.saveEmployee(employee),
  //         DBScannedItemTypes.employee,
  //       ),
  //     final ScannedDistibutor distributor => (
  //         await _database.clientSetter.saveDistributor(distributor),
  //         DBScannedItemTypes.distributor,
  //       ),
  //     _ => throw UnsupportedError('Unsupported ScannedItem implementation'),
  //   };

  //   await _database.scansHistorySetter.saveScannedItem(
  //     objectId: objectId,
  //     type: type,
  //     scannedAt: item.scannedAt,
  //   );
  // }

  // Private implementations

  // Future<void> _getScannedItems(
  //   StreamController<ScannedItem> controller, {
  //   PaginationValue? pagination,
  // }) async {
  //   final scansHistory = await _database.scansHistoryGetter.getScansHistory(pagination: pagination);

  //   final operations = <Future<Object?>>[];
  //   for (final scannedItem in scansHistory) {
  //     final entityGetter = switch (DBScannedItemTypesMapper.fromDB(scannedItem.type)) {
  //       DBScannedItemTypes.product => _database.productGetter
  //           .getProductById(scannedItem.objectId)
  //           .then((product) => ScannedProduct.fromProduct(product, scannedItem.scannedAt)),
  //       DBScannedItemTypes.employee => _database.clientGetter
  //           .getEmployeeById(scannedItem.objectId)
  //           .then((employee) => ScannedEmployee.fromEmployee(employee, scannedItem.scannedAt)),
  //       DBScannedItemTypes.distributor => _database.clientGetter
  //           .getDistributorById(scannedItem.objectId)
  //           .then((distributor) => ScannedDistibutor.fromDistributor(distributor, scannedItem.scannedAt)),
  //     };
  //     final operation = entityGetter.then((entity) => controller.add(entity));

  //     operations.add(operation);
  //   }
  //   await Future.wait(operations);
  // }

  Future<void> _getExpensesDealItems(StreamController<ExpensesDeal> controller) async {
    final history = await _database.allExpensesDealData;

    final operations = <Future<Object?>>[];
    for (final item in history) {
      // final entityGetter = switch (DBScannedItemTypesMapper.fromDB(item.type)) {
      //   DBScannedItemTypes.product => _database.productGetter
      //       .getProductById(item.objectId)
      //       .then((product) => ScannedProduct.fromProduct(product, item.scannedAt)),
      //   DBScannedItemTypes.employee => _database.clientGetter
      //       .getEmployeeById(item.objectId)
      //       .then((employee) => ScannedEmployee.fromEmployee(employee, item.scannedAt)),
      //   DBScannedItemTypes.distributor => _database.clientGetter
      //       .getDistributorById(item.objectId)
      //       .then((distributor) => ScannedDistibutor.fromDistributor(distributor, item.scannedAt)),
      // };
      final operation = item..then((entity) => controller.add(entity));

      operations.add(operation);
    }
    await Future.wait(operations);
  }

  @override
  Future<List<ExpensesDeal>> getExpensesDeals() {
    // final controller = StreamController<ExpensesDeal>();
    //  final history = await _database.allExpensesDealData;
    // // _getExpensesDealItems(controller).whenComplete(controller.close);

    // return controller.stream;
    // select(employee).get();
    final foo = _database.allExpensesDealData;

    // return foo.
  }

  @override
  Future<void> saveExpensesDeal(ExpensesDeal item) async {
    await _database.addExpensesDeal(
      DBExpensesDealCompanion(
        amount: Value(item.amount),
        date: Value(item.date),
        categoryName: Value(item.incomeType.name),
      ),
    );
  }
}

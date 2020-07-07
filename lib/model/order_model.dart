import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
class Orders extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get price => text().withLength(min: 3, max: 32)();
  TextColumn get productName => text().named('product')();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey =>{id};
}
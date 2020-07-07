import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_test1/app_database.dart';
import 'package:moor_test1/model/order_model.dart';
part 'order_dao.g.dart';

@UseDao(
    tables: [Orders]
)
class OrderDao extends DatabaseAccessor<AppDatabase> with _$OrderDaoMixin {
  final AppDatabase db;
  OrderDao(this.db): super(db);
  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();
  Future insertNewOrder(Order order) => into(orders).insert(order);
  Future deleteOrder(Order order) => delete(orders).delete(order);
}
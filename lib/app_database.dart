import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor_test1/daos/order_dao.dart';
import 'package:moor_test1/model/order_model.dart';

part 'app_database.g.dart';
@UseMoor(tables: [Orders],daos: [OrderDao])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(FlutterQueryExecutor
          .inDatabaseFolder(path: "db.sqlite", logStatements: true)
  );

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String price;
  final String productName;
  Order({@required this.id,this.price, @required this.productName});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Order(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      productName:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}product']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || productName != null) {
      map['product'] = Variable<String>(productName);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      price: serializer.fromJson<String>(json['price']),
      productName: serializer.fromJson<String>(json['productName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'price': serializer.toJson<String>(price),
      'productName': serializer.toJson<String>(productName),
    };
  }

  Order copyWith({int id, String price, String productName}) => Order(
        id: id ?? this.id,
        price: price ?? this.price,
        productName: productName ?? this.productName,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(price.hashCode, productName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.price == this.price &&
          other.productName == this.productName);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> price;
  final Value<String> productName;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.productName = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    @required String price,
    @required String productName,
  })  : price = Value(price),
        productName = Value(productName);
  static Insertable<Order> custom({
    Expression<int> id,
    Expression<String> price,
    Expression<String> productName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (productName != null) 'product': productName,
    });
  }

  OrdersCompanion copyWith(
      {Value<int> id, Value<String> price, Value<String> productName}) {
    return OrdersCompanion(
      id: id ?? this.id,
      price: price ?? this.price,
      productName: productName ?? this.productName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (productName.present) {
      map['product'] = Variable<String>(productName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn('price', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, price, productName];
  @override
  $OrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'orders';
  @override
  final String actualTableName = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productNameMeta,
          productName.isAcceptableOrUnknown(data['product'], _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  OrderDao _orderDao;
  OrderDao get orderDao => _orderDao ??= OrderDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}

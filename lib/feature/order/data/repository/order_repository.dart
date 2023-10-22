import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/order/data/models/checkout_model/checkout_model.dart';
import 'package:ketaby/feature/order/data/models/create_order_model/create_order_model.dart';
import 'package:ketaby/feature/order/data/models/governorates_model/governorates_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, CheckoutModel>> getCheckoutData();
  Future<Either<Failure, GovernoratesModel>> getGovernorates();
  Future<Either<Failure, CreateOrderModel>> createOrder({
  required String name,
  required String email,
  required String address,
  required String phone,
  required String governoratesId,
});
}

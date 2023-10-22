import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart_item.dart';

abstract class CartRepository {
  Future<Either<ServerFailure, Cart>> getCart();
  Future<Either<ServerFailure, List<CartItem>>> addToCart(
      {required String bookId});
  Future<Either<Failure, Cart>> updateCart(
      {required String bookId, required String quantity});
  Future<Either<ServerFailure, List<CartItem>>> removeFromCart(
      {required String bookId});
}

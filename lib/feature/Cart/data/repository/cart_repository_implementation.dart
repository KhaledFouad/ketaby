import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart_item.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';

class CartRepositoryImplementation extends CartRepository {
  final ApiServices apiServices;

  CartRepositoryImplementation(this.apiServices);

  @override
  Future<Either<ServerFailure, Cart>> getCart() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.getCart,
        token: AppConstants.token,
      );

      return Right(Cart.fromJson(response.data));
      // return Right(
      //     (response.data['data']['data'] as List<dynamic>).map((product) {
      //   return CartItem.fromJson(product);
      // }).toList());
    } catch (error) {
      print(error);
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailure, List<CartItem>>> addToCart(
      {required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.addToCart,
        token: AppConstants.token,
        data: {
          'product_id': bookId,
        },
      );
      return Right((data.data['data']['data'] as List<dynamic>).map((product) {
        return CartItem.fromJson(product);
      }).toList());
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

 @override
  Future<Either<Failure, Cart>> updateCart(
      {required String bookId, required String quantity}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.updateCart,
        token: AppConstants.token,
        data: {
          'cart_item_id': bookId,
          'quantity': quantity,
        },
      );
      return Right(Cart.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailure, List<CartItem>>> removeFromCart(
      {required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.removeFromCart,
        token: AppConstants.token,
        data: {
          'cart_item_id': bookId,
        },
      );

      return Right((data.data['data']['data'] as List<dynamic>).map((product) {
        return CartItem.fromJson(product);
      }).toList());
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

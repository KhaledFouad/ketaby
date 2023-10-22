import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/data/repository/favourites_repository.dart';

class FavouritesRepositoryImplementation extends FavouritesRepository {
  final ApiServices apiServices;

  FavouritesRepositoryImplementation(this.apiServices);

  @override
  Future<Either<ServerFailure, List<Product>>> getFavourites() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getwishList,
        token: AppConstants.token,
      );

      return Right((data.data['data']['data'] as List<dynamic>).map((product) {
        return Product.fromJson(product);
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
  Future<Either<ServerFailure, List<Product>>> addToFavourites(
      {required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.addToWishList,
        token: AppConstants.token,
        data: {
          'product_id': bookId,
        },
      );
      return Right((data.data['data']['data'] as List<dynamic>).map((product) {
        return Product.fromJson(product);
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
  Future<Either<ServerFailure, List<Product>>> removeFromFavourites(
      {required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.removeFromWishList,
        token: AppConstants.token,
        data: {
          'product_id': bookId,
        },
      );
      return Right((data.data['data']['data'] as List<dynamic>).map((product) {
        return Product.fromJson(product);
      }).toList());
    } catch (error) {
      if (error is DioError) {
        print(error);
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class FavouritesRepository {
  Future<Either<ServerFailure, List<Product>>> getFavourites();
  Future<Either<ServerFailure, List<Product>>> addToFavourites(
      {required String bookId});
  Future<Either<ServerFailure, List<Product>>> removeFromFavourites(
      {required String bookId});
}

import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Product>>> getBooks();
}

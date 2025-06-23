import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/books/data/repository/book_repo.dart';

class BookRepositoryImplementation extends BookRepository {
  final ApiServices apiServices;

  BookRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<Product>>> getBooks() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.products,
        token: AppConstants.token,
      );
      return Right(
          (data.data['data']['products'] as List<dynamic>).map((product) {
        return Product.fromJson(product);
      }).toList());
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

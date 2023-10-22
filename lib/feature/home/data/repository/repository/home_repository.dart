import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/best_seller_model/best_seller_model.dart';
import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';
import 'package:ketaby/feature/home/data/models/new_arrival_model/new_arrival_model.dart';
import 'package:ketaby/feature/home/data/models/slider_model/slider_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, SliderModel>> getSliders();
  Future<Either<Failure, BestSellerModel>> getBestSeller();
  Future<Either<Failure, CategoriesModel>> getCategories();
  Future<Either<Failure, NewArrivalModel>> getNewArrival();
}

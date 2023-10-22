import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/home/data/models/best_seller_model/best_seller_model.dart';
import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';
import 'package:ketaby/feature/home/data/models/new_arrival_model/new_arrival_model.dart';
import 'package:ketaby/feature/home/data/models/slider_model/slider_model.dart';

import 'home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, SliderModel>> getSliders() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.sliders,
        token: AppConstants.token,
      );
      return Right(SliderModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BestSellerModel>> getBestSeller() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.bestseller,
        token: AppConstants.token,
      );
      return Right(BestSellerModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, NewArrivalModel>> getNewArrival() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.newArrival,
        token: AppConstants.token,
      );
      return Right(NewArrivalModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.categories,
        token: AppConstants.token,
      );
      return Right(CategoriesModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

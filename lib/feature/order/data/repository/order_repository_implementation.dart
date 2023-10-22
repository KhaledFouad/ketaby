import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/order/data/models/checkout_model/checkout_model.dart';
import 'package:ketaby/feature/order/data/models/create_order_model/create_order_model.dart';
import 'package:ketaby/feature/order/data/models/governorates_model/governorates_model.dart';
import 'package:ketaby/feature/order/data/repository/order_repository.dart';

class OrderRepositoryImplementation extends OrderRepository {
  final ApiServices apiServices;

  OrderRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CheckoutModel>> getCheckoutData() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.checkout,
        token: AppConstants.token,
      );
      return Right(CheckoutModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GovernoratesModel>> getGovernorates() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.governorates,
        token: AppConstants.token,
      );
      return Right(GovernoratesModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CreateOrderModel>> createOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required String governoratesId,
  }) async{
    try {
      Response response = await apiServices.post(
        endPoint: EndPoints.createOrder,
        token: AppConstants.token,
        data: {
          'name':name,
          'email':email,
          'address':address,
          'phone':phone,
          'governorate_id':governoratesId,
        }
      );
      return Right(CreateOrderModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        print(error.response!.data.toString());
        return Left(ServerFailure(error.response!.data.toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

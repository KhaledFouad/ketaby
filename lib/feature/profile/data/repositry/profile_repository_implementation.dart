import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';
import 'package:ketaby/feature/profile/data/repositry/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ApiServices apiServices;

  ProfileRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getUserProfile,
        token: AppConstants.token,
      );
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        print(error);
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updateUserProfile({
    File? image,
    required String name,
    required String email,
    required String address,
    required String city,
    required String phone,
  }) async {
    try {
      Response data = await apiServices.post(
          endPoint: EndPoints.updateUserProfile,
          token: AppConstants.token,
          data: {
            'name': name,
            'email': email,
            'address': address,
            'city': city,
            'phone': phone,
          });
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        print(error.response!.data.toString());
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}

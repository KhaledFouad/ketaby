import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
  Future<Either<Failure, ProfileModel>> updateUserProfile({
    File? image,
    required String name,
    required String email,
    required String address,
    required String city,
    required String phone,
  });
}

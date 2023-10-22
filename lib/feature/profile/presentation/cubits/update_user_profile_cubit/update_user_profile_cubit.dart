import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';
import 'package:ketaby/feature/profile/data/repositry/profile_repository.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit(this.profileRepository)
      : super(UpdateUserProfileInitialState());

  final ProfileRepository profileRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static UpdateUserProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  Future<void> updateUserProfile({required BuildContext context}) async {
    emit(UpdateUserProfileLoadingState());
    Either<Failure, ProfileModel> result;
    result = await profileRepository.updateUserProfile(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      city: cityController.text,
      phone: phoneController.text,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(UpdateUserProfileFailureState(failure.error));
    }, (profileModel) {
      this.profileModel = profileModel;
      showSuccessSnackBar(context: context, message: profileModel.message!);
      emit(UpdateUserProfileSuccessState(profileModel));
    });
  }
}

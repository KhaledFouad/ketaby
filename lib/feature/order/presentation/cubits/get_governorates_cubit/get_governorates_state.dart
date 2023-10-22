import 'package:ketaby/feature/order/data/models/governorates_model/governorates_model.dart';

abstract class GetGovernoratesState {}

class GetGovernoratesInitialState extends GetGovernoratesState {}

class GetGovernoratesLoadingState extends GetGovernoratesState {}

class GetGovernoratesSuccessState extends GetGovernoratesState {
  final GovernoratesModel governoratesModel;

  GetGovernoratesSuccessState(this.governoratesModel);
}

class GetGovernoratesFailureState extends GetGovernoratesState {
  final String error;

  GetGovernoratesFailureState(this.error);
}

class ChangeDropdownValueForGovernoratesState extends GetGovernoratesState {}

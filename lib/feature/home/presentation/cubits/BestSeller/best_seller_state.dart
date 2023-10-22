import 'package:ketaby/feature/home/data/models/best_seller_model/best_seller_model.dart';

abstract class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final BestSellerModel bestSellerModel;

  BestSellerSuccessState(this.bestSellerModel);
}

class BestSellerFailureState extends BestSellerState {
  final String error;

  BestSellerFailureState(this.error);
}

import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';

abstract class GetCartState {}

final class GetCartInitialState extends GetCartState {}

class GetCartLoadingState extends GetCartState {}

class GetCartSuccessState extends GetCartState {
  final Cart prudutes;

  GetCartSuccessState(this.prudutes);
}

class GetCartFailureState extends GetCartState {
  final String error;

  GetCartFailureState(this.error);
}

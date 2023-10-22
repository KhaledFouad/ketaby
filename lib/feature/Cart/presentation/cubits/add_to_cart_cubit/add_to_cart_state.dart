import 'package:ketaby/feature/Cart/data/model/cart/cart_item.dart';

abstract class AddToCartState {}

final class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  final List<CartItem> prudutes;

  AddToCartSuccessState(this.prudutes);
}

class AddToCartFailureState extends AddToCartState {
  final String error;

  AddToCartFailureState(this.error);
}

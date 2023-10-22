part of 'remove_from_cart_cubit.dart';

@immutable
sealed class RemoveFromCartState {}

final class RemoveFromCartInitial extends RemoveFromCartState {}

class RemoveFromCartLoadingState extends RemoveFromCartState {}

class RemoveFromCartSuccessState extends RemoveFromCartState {
  final List<CartItem> prudutes;

  RemoveFromCartSuccessState(this.prudutes);
}

class RemoveFromCartFailureState extends RemoveFromCartState {
  final String error;

  RemoveFromCartFailureState(this.error);
}

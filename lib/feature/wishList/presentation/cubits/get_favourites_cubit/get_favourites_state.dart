import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class GetFavouritesState {}

final class GetFavouritesInitialState extends GetFavouritesState {}

class GetFavouritesLoadingState extends GetFavouritesState {}

class GetFavouritesSuccessState extends GetFavouritesState {
  final List<Product> prudutes;

  GetFavouritesSuccessState(this.prudutes);
}

class GetFavouritesFailureState extends GetFavouritesState {
  final String error;

  GetFavouritesFailureState(this.error);
}

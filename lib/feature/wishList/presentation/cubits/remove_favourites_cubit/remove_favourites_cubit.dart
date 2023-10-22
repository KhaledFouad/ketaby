import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/remove_favourites_cubit/remove_favourites_state.dart';

class RemoveFrmoFavouritesCubit extends Cubit<RemoveFrmoFavouritesState> {
  RemoveFrmoFavouritesCubit(this.favouritesRepository)
      : super(RemoveFrmoFavouritesInitialState());

  static RemoveFrmoFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  Future<void> removefromFavourites({required String bookId}) async {
    emit(RemoveFrmoFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.removeFromFavourites(bookId: bookId);
    result.fold((failure) {
      emit(RemoveFrmoFavouritesFailureState(failure.error));
    }, (products) {
      this.products = products;

      emit(RemoveFrmoFavouritesSuccessState(products));
    });
  }
}

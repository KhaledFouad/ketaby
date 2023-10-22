import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_cubit.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_state.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';

class GetFavouritesCubit extends Cubit<GetFavouritesState> {
  GetFavouritesCubit(
      this.favouritesRepository, this.addAndRemoveFavouritesCubit)
      : super(GetFavouritesInitialState()) {
    streamSubscription = addAndRemoveFavouritesCubit.stream
        .listen((AddToFavouritesState addToFavouritesState) {
      if (addToFavouritesState is AddToFavouritesSuccessState 
      // &&
          // RemoveFrmoFavouritesState is RemoveFrmoFavouritesSuccessState
          ) {
        getFavourites();
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  late final StreamSubscription streamSubscription;

  static GetFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final AddToFavouritesCubit addAndRemoveFavouritesCubit;

  final FavouritesRepository favouritesRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  Future<void> getFavourites() async {
    emit(GetFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.getFavourites();
    result.fold((failure) {
      emit(GetFavouritesFailureState(failure.error));
    }, (products) {
      this.products = products;

      emit(GetFavouritesSuccessState(products));
    });
  }
}

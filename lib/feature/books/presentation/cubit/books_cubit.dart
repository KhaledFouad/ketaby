import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/books/data/repository/book_repo.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.bookRepository) : super(BooksInitialState());

  static BooksCubit get(BuildContext context) => BlocProvider.of(context);

  final BookRepository bookRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  Future<void> getBooks() async {
    emit(BooksLoadingState());
    Either<Failure, List<Product>> result;
    result = await bookRepository.getBooks();
    result.fold((failure) {
      emit(BooksFailureState(failure.error));
    }, (products) {
      this.products = products;
      emit(BooksSuccessState(products));
    });
  }

  List<Product> searchedBooksList = [];

  void getSearchedDoctorsList({required String bookName}) {
    searchedBooksList = products.where((element) {
      return element.name!.toLowerCase().contains(bookName.toLowerCase());
    }).toList();
    emit(GetSearchedBooksList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(ChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(ChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(ChangeIsSearchingState());
  }
}

import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class BooksState {}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksSuccessState extends BooksState {
  final List<Product> products;

  BooksSuccessState(this.products);
}

class BooksFailureState extends BooksState {
  final String error;

  BooksFailureState(this.error);
}

class GetSearchedBooksList extends BooksState {}

class ChangeIsSearchingState extends BooksState {}

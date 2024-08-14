import 'package:ecommerce_shopping_project/models/textfield_model.dart';

class SearchQueryFormState {
  SearchQueryFormState({required this.query, this.status = false});

  final TextFieldModel query;
  final bool? status;

  SearchQueryFormState copyWith({
    TextFieldModel? query,
    bool? status,
  }) {
    return SearchQueryFormState(
      query: query ?? this.query,
      status: status ?? this.status,
    );
  }
}

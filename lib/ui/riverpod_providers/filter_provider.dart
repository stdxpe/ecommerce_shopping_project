import 'package:ecommerce_shopping_project/ui/riverpod_providers/search_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/deprecated/filter.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final filterProvider = StateNotifierProvider<FilterNotifier, Filter>((ref) {
  return FilterNotifier(ref);
});

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier(Ref ref)
      : super(
          Filter(
            query: '',
            // query: ref.watch(searchQueryProvider).query.text,
            priceMin: 0,
            priceMax: 1000,
            sortBy: AppStrings.filterSortByRating,
            sizes: AppStrings.filterSizeList,
            collections: [AppStrings.filterCollectionAll],
          ),
        );

  resetAllFilters() {
    state = Filter(
      query: '',
      priceMin: 0,
      priceMax: 1000,
      sortBy: AppStrings.filterSortByRating,
      sizes: AppStrings.filterSizeList,
      collections: [AppStrings.filterCollectionAll],
    );
  }

  setFilterParameter({
    String? query,
    double? priceMin,
    double? priceMax,
    String? sortBy,
    List<String>? sizes,
    List<String>? brands,
    List<String>? collections,
  }) {
    Filter newFilter = state.copyWith(
      query: query ?? state.query,
      priceMin: priceMin ?? state.priceMin,
      priceMax: priceMax ?? state.priceMax,
      sortBy: sortBy ?? state.sortBy,
      sizes: sizes ?? state.sizes,
      collections: collections ?? state.collections,
    );
    state = newFilter;
    print('newFilter: $newFilter');
  }

  toggleSizeElement({required String size}) {
    if (state.sizes!.contains(size)) {
      setFilterParameter(
          sizes: [...state.sizes!.where((element) => element != size)]);
    } else {
      setFilterParameter(sizes: [...state.sizes!, size]);
    }
  }

  toggleCollectionElement({required String collection}) {
    /// When 'All' selected, disables all the other selections
    if (collection == AppStrings.filterCollectionAll) {
      setFilterParameter(collections: [AppStrings.filterCollectionAll]);
      return;
    }

    /// Selecting other items, disables 'All' selection
    if (collection != AppStrings.filterCollectionAll) {
      setFilterParameter(collections: [
        ...state.collections!
            .where((element) => element != AppStrings.filterCollectionAll)
      ]);
    }

    /// Toggles an item
    if (state.collections!.contains(collection)) {
      setFilterParameter(collections: [
        ...state.collections!.where((element) => element != collection)
      ]);
    } else {
      setFilterParameter(collections: [...state.collections!, collection]);
    }
  }
}

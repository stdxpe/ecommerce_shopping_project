import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_filter_lists.dart';

final filterSelectorProvider =
    StateNotifierProvider<FilterSelectorNotifier, void>((ref) {
  return FilterSelectorNotifier();
});

class FilterSelectorNotifier extends StateNotifier<void> {
  FilterSelectorNotifier() : super(null);
}

final filterPriceRangeProvider = StateProvider<RangeValues>((ref) {
  return const RangeValues(150, 750);
});

final filterSortByProvider = StateProvider<int>((ref) {
  return 0;
});

final filterSortByIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(filterSortByProvider) == index ? true : false;
});

final filterSizeProvider =
    StateNotifierProvider<FilterSizeNotifier, List<int>>((ref) {
  return FilterSizeNotifier();
});

class FilterSizeNotifier extends StateNotifier<List<int>> {
  FilterSizeNotifier() : super([0]);

  toggleSizeElement({required int index}) {
    if (state.contains(index)) {
      state = state
          .where(
            (element) => element != index,
          )
          .toList();
    } else {
      state = [...state, index];
    }
  }

  resetState() {
    state = [0];
  }
}

final filterSizeIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(filterSizeProvider).contains(index);
});

final filterBrandProvider =
    StateNotifierProvider<FilterBrandNotifier, List<int>>((ref) {
  return FilterBrandNotifier();
});

class FilterBrandNotifier extends StateNotifier<List<int>> {
  FilterBrandNotifier() : super([0]);

  toggleBrandElement({required int index}) {
    /// When 'All' selected, disables all the other selections
    if (index == 0) {
      state = [0];
      return;
    }

    /// Selecting other items, disables 'All' selection
    if (index != 0) {
      state = state.where(
        (element) {
          return element != 0;
        },
      ).toList();
    }

    /// Toggles an item
    if (state.contains(index)) {
      state = state
          .where(
            (element) => element != index,
          )
          .toList();
    } else {
      state = [...state, index];
    }
  }

  resetState() {
    state = [0];
  }
}

final filterBrandIsSelectedProvider =
    StateProvider.family<bool, int>((ref, index) {
  return ref.watch(filterBrandProvider).contains(index);
});

final filterAllProviders =
    StateNotifierProvider<FilterAllNotifier, void>((ref) {
  return FilterAllNotifier();
});

class FilterAllNotifier extends StateNotifier<void> {
  FilterAllNotifier() : super(null);

  Filter getAllFilterSelections(WidgetRef ref) {
    double priceMin = ref.watch(filterPriceRangeProvider).start;
    double priceMax = ref.watch(filterPriceRangeProvider).end;
    String sortBy = dummySortList[ref.watch(filterSortByProvider)];
    List<String> sizes =
        ref.watch(filterSizeProvider).map((e) => dummySizeList[e]).toList();
    List<String> brands =
        ref.watch(filterBrandProvider).map((e) => dummyBrandList[e]).toList();

    Filter selectedFilter = Filter(
        priceMin: priceMin,
        priceMax: priceMax,
        sortBy: sortBy,
        sizes: sizes,
        brands: brands);
    print('selectedFilter: ${selectedFilter.toString()}');
    return selectedFilter;
  }

  void resetAllFilters(WidgetRef ref) {
    ref.read(filterPriceRangeProvider.notifier).state =
        const RangeValues(150, 750);
    ref.read(filterSortByProvider.notifier).state = 0;
    ref.read(filterSizeProvider.notifier).resetState();
    ref.read(filterBrandProvider.notifier).resetState();
  }
}

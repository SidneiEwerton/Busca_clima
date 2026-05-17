// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_city_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchCityUseCase)
final searchCityUseCaseProvider = SearchCityUseCaseProvider._();

final class SearchCityUseCaseProvider
    extends
        $FunctionalProvider<
          SearchCityUseCase,
          SearchCityUseCase,
          SearchCityUseCase
        >
    with $Provider<SearchCityUseCase> {
  SearchCityUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchCityUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchCityUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchCityUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchCityUseCase create(Ref ref) {
    return searchCityUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchCityUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchCityUseCase>(value),
    );
  }
}

String _$searchCityUseCaseHash() => r'a3cdc69a4eb161a8a57295647391229e579ca277';

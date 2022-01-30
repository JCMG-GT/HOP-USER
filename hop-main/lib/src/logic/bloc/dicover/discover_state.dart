part of 'discover_bloc.dart';

@immutable
class DiscoverState {
  const DiscoverState({
    this.favorite = false,
    this.loading = false,
  });

  DiscoverState copyWith({
    bool? favorite,
    bool? loading,
  }) =>
      DiscoverState(
        favorite: favorite ?? this.favorite,
        loading: loading ?? this.loading,
      );

  final bool? favorite;
  final bool? loading;
}

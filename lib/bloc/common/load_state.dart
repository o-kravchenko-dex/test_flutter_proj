enum LoadState {
  uninitialized,
  idle,
  loading,
  error;

  String toJson() => name;

  static LoadState fromJson(String json) => values.byName(json);
}

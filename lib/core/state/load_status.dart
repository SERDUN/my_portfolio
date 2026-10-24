/// Where a page's primary data is. Shared by every cubit so views branch on
/// one vocabulary.
enum LoadStatus {
  initial,
  loading,
  success,
  failure;

  /// Nothing to show yet: the first load has not finished.
  bool get isPending => this == initial || this == loading;
}

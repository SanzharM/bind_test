class Currency {
  final int? id;
  final String? symbol;
  final String? fullTitle;
  final String? shortTitle;
  final String? flagUrl;

  const Currency({this.id, this.symbol, this.shortTitle, this.fullTitle, this.flagUrl});

  @override
  String toString() {
    return '${shortTitle ?? ''} ${fullTitle ?? ''}';
  }
}

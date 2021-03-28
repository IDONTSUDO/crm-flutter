abstract class IDocument {
  String id;
  Map<String, dynamic> toJson() => {'id': id};
  fromJson(Map<String, dynamic> json) => IDocument;
  dynamic get(String key) => toJson()[key];
}

enum CompareOperator {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  whereIn,
  whereNotIn,
  isNull
}

class Filter {
  final String key;
  final dynamic value;
  final CompareOperator compareOperator;
  Filter(
      {this.key, this.value, this.compareOperator = CompareOperator.isEqualTo});
}

class Sort {
  final String key;
  final bool descending;
  Sort({this.key, this.descending = false});
}

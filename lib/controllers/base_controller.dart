import 'package:bogdashka/interfaces/database.dart';
import 'package:get/get.dart';

import '../interfaces/document.dart';

class BaseController<T extends IDocument> extends GetxController {
  int pageSize = 10;
  String path;

  final _list = Rx<List<T>>([]);
  List<T> get list => this._list.value;
  Stream<List<T>> get list$ => _list.stream;

  final _document = Rx<T>();
  T get document => this._document.value;
  Stream<T> get document$ => _document.stream;

  final _limit = Rx<int>(10);
  int get limit => this._limit.value;
  set limit(int value) => this._limit.value = value;
  Stream<int> get limit$ => _limit.stream;

  final _filterBy = Rx<List<Filter>>([]);
  set filterBy(List<Filter> value) => this._filterBy.value = value;
  List<Filter> get filterBy => this._filterBy.value;
  Stream<List<Filter>> get filterBy$ => _filterBy.stream;

  final _sortBy = Rx<List<Sort>>([]);
  set sortBy(List<Sort> value) => this._sortBy.value = value;
  List<Sort> get sortBy => this._sortBy.value;
  Stream<List<Sort>> get sortBy$ => _sortBy.stream;

  final _connect = Rx<bool>(false);
  bool get connect => this._connect.value;
  set connect(bool value) => this._connect.value = value;
  Stream<bool> get connect$ => _connect.stream;

  IDatabase db;
  T Function(Map<String, dynamic> json) _builder;

  BaseController(this.path, this.db, this._builder);

  @override
  void onInit() {
    super.onInit();
    this.pageSize = this._limit.value;
    _list.bindStream(db.query<T>(
        path: this.path,
        builder: this._builder,
        limit: this._limit.stream,
        filterBy: this._filterBy.stream,
        sortBy: this._sortBy.stream,
        connect: this._connect.stream));
  }

  loadMore() => this._limit.value += this.pageSize;

  // FILTER
  void addFilter(Filter value) {
    final list = [...this._filterBy.value];
    list.removeWhere((f) => f.key == value.key);
    list.add(value);
    this._filterBy.value = list;
  }

  void removeFilter(String key) {
    final list = [...this._filterBy.value];
    list.removeWhere((f) => f.key == key);
    this._filterBy.value = list;
  }

  Filter getFilter(String key) =>
      _filterBy.value.firstWhere((f) => f.key == key, orElse: () => null);

  // SORT
  void addSort(Sort value) {
    final list = [...this._sortBy.value];
    list.removeWhere((f) => f.key == value.key);
    list.add(value);
    this._sortBy.value = list;
  }

  void removeSort(String key) {
    final list = [...this._sortBy.value];
    list.removeWhere((f) => f.key == key);
    this._sortBy.value = list;
  }

  Sort getSort(String key) =>
      _sortBy.value.firstWhere((f) => f.key == key, orElse: () => null);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:jetti/controllers/api.dart';
import 'package:jetti/models/order.dart';

class OrdersController extends GetxController {
  Api _api = Api("OrderListView");

  RxList<Order> _orderList = List<Order>().obs;
  RxBool _isLoading = true.obs;
  RxBool _loadMoreLoading = false.obs;
  int _pageNumber = 1;

  RxList<Order> get orderList => this._orderList;
  RxBool get isLoading => this._isLoading;
  RxBool get loadMoreLoading => this._loadMoreLoading;

  @override
  void onInit() {
    // _orders.bindStream(fetchOrders());
    fetchOrders();
    super.onInit();
  }

  void fetchOrders({int pageNumber = 1}) {
    Stream<QuerySnapshot> _streamData = _api
        .getRef()
        .orderBy("created", descending: true)
        .limit(20 * pageNumber)
        .snapshots();
    List<Order> data = [];
    _streamData.listen((snapshot) {
      snapshot.docChanges.forEach((element) {
        Order order = Order.fromMap(element.doc.data(), element.doc.id);
        data.add(order);
      });
      _orderList.value = data;
      _loadMoreLoading.value = false;
      _isLoading.value = false;
    });

    // return _streamData.map((doc) {
    //   doc.docs.forEach(
    //     (QueryDocumentSnapshot element) {
    //       _queryDocumentSnapshots.add(element);
    //       // _orders.add(Order.fromMap(element.data(), element.id));
    //       // print(DateTime.parse(element.data()['deliveryTime']).runtimeType);
    //       // print(element.data()['total']['typePayment'].runtimeType);
    //     },
    //   );

    //   _isLoading.value = false;
    //   return _orders.value;
    // });
  }

  void loadMore() {
    _loadMoreLoading.value = true;
    _pageNumber++;
    fetchOrders(pageNumber: _pageNumber);
  }
}

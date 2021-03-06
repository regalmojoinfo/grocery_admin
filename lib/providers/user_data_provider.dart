// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:grocery_admin/config/config.dart';
// // import 'package:grocery_admin/config/paths.dart';
// import 'package:grocery_admin/models/admin.dart';
// import 'package:grocery_admin/models/banner.dart';
// import 'package:grocery_admin/models/cart_info.dart';
// import 'package:grocery_admin/models/category.dart';
// import 'package:grocery_admin/models/coupon.dart';
// import 'package:grocery_admin/models/delivery_user.dart';
// import 'package:grocery_admin/models/delivery_user_analytics.dart';
// import 'package:grocery_admin/models/inventory_analytics.dart';
// import 'package:grocery_admin/models/message_analytics.dart';
// import 'package:grocery_admin/models/order.dart';
// import 'package:grocery_admin/models/order_analytics.dart';
// import 'package:grocery_admin/models/payment_methods.dart';
// import 'package:grocery_admin/models/product.dart';
// import 'package:grocery_admin/models/product_analytics.dart';
// import 'package:grocery_admin/models/seller_notification.dart';
// import 'package:grocery_admin/models/user.dart';
// import 'package:grocery_admin/models/user_analytics.dart';
// import 'package:grocery_admin/models/user_report.dart';
// import 'package:grocery_admin/providers/base_provider.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:grocery_admin/models/user_report.dart';
import 'package:grocery_admin/models/user_analytics.dart';
import 'package:grocery_admin/models/user.dart';
import 'package:grocery_admin/models/seller_notification.dart';
import 'package:grocery_admin/models/product_analytics.dart';
import 'package:grocery_admin/models/product.dart';
import 'package:grocery_admin/models/payment_methods.dart';
import 'package:grocery_admin/models/order_analytics.dart';
import 'package:grocery_admin/models/order.dart';
import 'package:grocery_admin/models/message_analytics.dart';
import 'package:grocery_admin/models/inventory_analytics.dart';
import 'package:grocery_admin/models/delivery_user_analytics.dart';
import 'package:grocery_admin/models/delivery_user.dart';
import 'package:grocery_admin/models/coupon.dart';
import 'package:grocery_admin/models/category.dart';
import 'package:grocery_admin/models/cart_info.dart';
import 'package:grocery_admin/models/admin.dart';
import 'package:grocery_admin/providers/base_provider.dart';
import 'package:http/http.dart' as http;

class UserDataProvider extends BaseUserDataProvider {
  String baseurl = "https://regalmojo.in";
  @override
  void dispose() {}

  @override
  Future<bool> addNewCategory(
      {String mainCat, String catImage, String subCat}) async {
    Map data = {
      "useModel": "ProductCategory",
      "useWhere": {"status": 1},
      "useSort": "categoryName",
      "useMessage": "Category Info",
      "useData": {
        "categoryName": mainCat,
        "profileImage": catImage.toString(),
        "subCategory": [
          {"name": subCat}
        ]
      }
    };

    String url = "$baseurl/groceryServer/api/common/insertOne";

    try {
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Authorization':
                "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDQwMjA0YjQ3MjMwMWZjOTVlMzM4OGYiLCJsb2dpblR5cGUiOiJBZG1pbiIsIm5ld0RiTmFtZSI6Imdyb2NlcnktcmVnYWwiLCJpYXQiOjE2MTU0NDQ4NDF9.lBSLR9dI7CJ-5oVdJwJ8IxVMcDhBS88pKdnHiWSf5zI"
          },
          body: json.encode(data));
      print(data);
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future getAllCategories() async {
    String url = "$baseurl/groceryServer/api/common/getAll";
    Map data = {
      "useModel": "ProductCategory",
      "useWhere": {"status": 1},
      "useSort": "categoryName",
      "useMessage": "Category Info"
    };
    var body = json.encode(data);
    try {
      final res = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Authorization':
                "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDQwMjA0YjQ3MjMwMWZjOTVlMzM4OGYiLCJsb2dpblR5cGUiOiJBZG1pbiIsIm5ld0RiTmFtZSI6Imdyb2NlcnktcmVnYWwiLCJpYXQiOjE2MTU0NDQ4NDF9.lBSLR9dI7CJ-5oVdJwJ8IxVMcDhBS88pKdnHiWSf5zI"
          },
          body: body);
      print(res.body);
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        final category = Category.fromJson(data);
        return category.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
//   @override
//   Future<bool> addNewCategory(Map category) async {
//     try {
//       var uuid = Uuid().v4();
//       StorageReference storageReference =
//           firebaseStorage.ref().child('categoryImages/$uuid');
//       StorageUploadTask storageUploadTask =
//           storageReference.putFile(category['categoryImage']);
//       StorageTaskSnapshot storageTaskSnapshot =
//           await storageUploadTask.onComplete;
//       var url = await storageTaskSnapshot.ref.getDownloadURL();

//       var docId = Uuid().v4();

//       db.collection(Paths.categoriesPath).doc(docId).set({
//         'categoryName': category['categoryName'],
//         'imageLink': url,
//         'categoryId': docId,
//         'subCategories': category['subCategories'],
//       });
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

  @override
  Future<bool> addNewProduct(Map product) async {
    String url = "https://regalmojo.in/groceryServer/api/common/insertOne";
    http.post(url);
  }

  @override
  Future<bool> activateAdmin(String uid) {
    // TODO: implement activateAdmin
    throw UnimplementedError();
  }

  @override
  Future<bool> activateDeliveryUser(String uid) {
    // TODO: implement activateDeliveryUser
    throw UnimplementedError();
  }

  @override
  Future<bool> addNewAdmin(Map adminMap) {
    // TODO: implement addNewAdmin
    throw UnimplementedError();
  }

  @override
  Future<String> addNewCoupon(Map<String, dynamic> map) {
    // TODO: implement addNewCoupon
    throw UnimplementedError();
  }

  @override
  Future<bool> addNewDeliveryUser(Map deliveryUserMap) {
    // TODO: implement addNewDeliveryUser
    throw UnimplementedError();
  }

  @override
  Future<bool> blockUser(String uid) {
    // TODO: implement blockUser
    throw UnimplementedError();
  }

  @override
  Future<bool> cancelOrder(Map cancelOrderMap) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<bool> checkIfInitialSetupDone() {
    // TODO: implement checkIfInitialSetupDone
    throw UnimplementedError();
  }

  @override
  Future<bool> checkIfNewAdmin(String uid) {
    // TODO: implement checkIfNewAdmin
    throw UnimplementedError();
  }

  @override
  Future<bool> deactivateAdmin(String uid) {
    // TODO: implement deactivateAdmin
    throw UnimplementedError();
  }

  @override
  Future<bool> deactivateDeliveryUser(String uid) {
    // TODO: implement deactivateDeliveryUser
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCategory(String categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<bool> editCategory(Map category) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<String> editCoupon(Map<String, dynamic> map) async {
    // TODO: implement editCoupon
    throw UnimplementedError();
  }

  @override
  Future<bool> editDeliveryUser(Map deliveryUserMap) {
    // TODO: implement editDeliveryUser
    throw UnimplementedError();
  }

  @override
  Future<bool> editProduct(Map product) {
    // TODO: implement editProduct
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getActivatedDeliveryUsers() {
    // TODO: implement getActivatedDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getActiveDeliveryUsers() {
    // TODO: implement getActiveDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getActiveProducts() {
    // TODO: implement getActiveProducts
    throw UnimplementedError();
  }

  @override
  Future<List<GroceryUser>> getActiveUsers() {
    // TODO: implement getActiveUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Admin>> getAllAdmins() {
    // TODO: implement getAllAdmins
    throw UnimplementedError();
  }

  @override
  Future<Map> getAllBanners() {
    // TODO: implement getAllBanners
    throw UnimplementedError();
  }

  @override
  Future<List<Coupon>> getAllCoupons() {
    // TODO: implement getAllCoupons
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getAllDeliveryUsers() {
    // TODO: implement getAllDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllMessages() {
    // TODO: implement getAllMessages
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List<GroceryUser>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<List<GroceryUser>> getBlockedUsers() {
    // TODO: implement getBlockedUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getCancelledOrders() {
    // TODO: implement getCancelledOrders
    throw UnimplementedError();
  }

  @override
  Future<CartInfo> getCartInfo() {
    // TODO: implement getCartInfo
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getDeactivatedDeliveryUsers() {
    // TODO: implement getDeactivatedDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getDeliveredOrders() {
    // TODO: implement getDeliveredOrders
    throw UnimplementedError();
  }

  @override
  Stream<DeliveryUserAnalytics> getDeliveryUserAnalytics() {
    // TODO: implement getDeliveryUserAnalytics
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getFeaturedProducts() {
    // TODO: implement getFeaturedProducts
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getInactiveDeliveryUsers() {
    // TODO: implement getInactiveDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getInactiveProducts() {
    // TODO: implement getInactiveProducts
    throw UnimplementedError();
  }

  @override
  Future<List<GroceryUser>> getInactiveUsers() {
    // TODO: implement getInactiveUsers
    throw UnimplementedError();
  }

  @override
  Stream<InventoryAnalytics> getInventoryAnalytics() {
    // TODO: implement getInventoryAnalytics
    throw UnimplementedError();
  }

  @override
  Stream<List<Product>> getLowInventoryProducts() {
    List<Product> products;
  }

  @override
  Stream<MessageAnalytics> getMessageAnalytics() {
    // TODO: implement getMessageAnalytics
    throw UnimplementedError();
  }

  @override
  Future<Admin> getMyAccountDetails() {
    // TODO: implement getMyAccountDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getNewMessages() {
    // TODO: implement getNewMessages
    throw UnimplementedError();
  }

  @override
  Stream<List<Order>> getNewOrders() {
    // TODO: implement getNewOrders
    throw UnimplementedError();
  }

  @override
  Stream<SellerNotification> getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  Stream<OrderAnalytics> getOrderAnalytics() {
    // TODO: implement getOrderAnalytics
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOutForDeliveryOrders() {
    // TODO: implement getOutForDeliveryOrders
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethods> getPaymentMethods() {
    // TODO: implement getPaymentMethods
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getPendingRefundOrders() {
    // TODO: implement getPendingRefundOrders
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getProcessedOrders() {
    // TODO: implement getProcessedOrders
    throw UnimplementedError();
  }

  @override
  Stream<ProductAnalytics> getProductAnalytics() {
    // TODO: implement getProductAnalytics
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryUser>> getReadyDeliveryUsers() {
    // TODO: implement getReadyDeliveryUsers
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getTrendingProducts() {
    // TODO: implement getTrendingProducts
    throw UnimplementedError();
  }

  @override
  Stream<UserAnalytics> getUserAnalytics() {
    // TODO: implement getUserAnalytics
    throw UnimplementedError();
  }

  @override
  Future<Product> getUserReportProduct(String id) {
    // TODO: implement getUserReportProduct
    throw UnimplementedError();
  }

  @override
  Stream<List<UserReport>> getUserReports() {
    // TODO: implement getUserReports
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getUsersOrder(List orderIds) {
    // TODO: implement getUsersOrder
    throw UnimplementedError();
  }

  @override
  Future<bool> initiateRefund(Map initiateRefundMap) {
    // TODO: implement initiateRefund
    throw UnimplementedError();
  }

  @override
  Future<void> markNotificationRead() {
    // TODO: implement markNotificationRead
    throw UnimplementedError();
  }

  @override
  Future<bool> postAnswer(String id, String ans, String queId) {
    // TODO: implement postAnswer
    throw UnimplementedError();
  }

  @override
  Future<bool> proceedInitialSetup(Map map) {
    // TODO: implement proceedInitialSetup
    throw UnimplementedError();
  }

  @override
  Future<bool> proceedOrder(Map proceedOrderMap) {
    // TODO: implement proceedOrder
    throw UnimplementedError();
  }

  @override
  Future<String> sendNewNotification(Map map) {
    // TODO: implement sendNewNotification
    throw UnimplementedError();
  }

  @override
  Future<bool> unblockUser(String uid) {
    // TODO: implement unblockUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateAdminDetails(Map adminMap) {
    // TODO: implement updateAdminDetails
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBanners(Map bannersMap) {
    // TODO: implement updateBanners
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCartInfo(Map map) {
    // TODO: implement updateCartInfo
    throw UnimplementedError();
  }

  @override
  Future<bool> updateLowInventoryProduct(String id, int quantity) {
    // TODO: implement updateLowInventoryProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> updateNewOrders(List<Order> allOrders) {
    // TODO: implement updateNewOrders
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePaymentMethods(Map map) {
    // TODO: implement updatePaymentMethods
    throw UnimplementedError();
  }
}
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   // final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//   // final FirebaseAuth mAuth = FirebaseAuth.instance;

//   @override
//   void dispose() {}

//   @override
//   Stream<List<Order>> getNewOrders() {
//     List<Order> newOrders = List();

//     try {
//       CollectionReference collectionReference = db.collection(Paths.ordersPath);

//       return collectionReference
//           .where('orderStatus', isEqualTo: 'Processing')
//           .orderBy('orderTimestamp', descending: true)
//           .snapshots()
//           .transform(StreamTransformer<QuerySnapshot, List<Order>>.fromHandlers(
//             handleData: (QuerySnapshot snap, EventSink<List<Order>> sink) {
//               if (snap.docs != null) {
//                 newOrders = List<Order>.from(
//                   snap.docs.map(
//                     (e) => Order.fromFirestore(e),
//                   ),
//                 );
//                 sink.add(newOrders);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getDeliveredOrders() async {
//     List<Order> deliveredOrders = List();

//     try {
//       QuerySnapshot snapshot = await db
//           .collection(Paths.ordersPath)
//           .orderBy('orderTimestamp', descending: true)
//           .where('orderStatus', isEqualTo: 'Delivered')
//           .get();

//       if (snapshot.docs != null) {
//         deliveredOrders = List<Order>.from(
//           (snapshot.docs).map(
//             (e) => Order.fromFirestore(e),
//           ),
//         );
//         return deliveredOrders;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getCancelledOrders() async {
//     List<Order> cancelledOrders = List();

//     try {
//       QuerySnapshot snapshot = await db
//           .collection(Paths.ordersPath)
//           .orderBy('orderTimestamp', descending: true)
//           .where('orderStatus', isEqualTo: 'Cancelled')
//           .get();

//       if (snapshot.docs != null) {
//         cancelledOrders = List<Order>.from(
//           (snapshot.docs).map(
//             (e) => Order.fromFirestore(e),
//           ),
//         );
//         return cancelledOrders;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> updateNewOrders(List<Order> allOrders) async {
//     try {
//       List<Order> newOrders = List();
//       for (var order in allOrders) {
//         if (order.orderStatus == 'Processing' ||
//             order.orderStatus == 'Processed') {
//           newOrders.add(order);
//         }
//       }
//       return newOrders;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Stream<OrderAnalytics> getOrderAnalytics() {
//     OrderAnalytics orderAnalytics;

//     try {
//       DocumentReference documentReference = db.doc(Paths.orderAnalyticsPath);

//       return documentReference.snapshots().transform(
//               StreamTransformer<DocumentSnapshot, OrderAnalytics>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot snap, EventSink<OrderAnalytics> sink) {
//               if (snap.data != null) {
//                 orderAnalytics = OrderAnalytics.fromFirestore(snap);
//                 sink.add(orderAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getProcessedOrders() async {
//     List<Order> processedOrders = List();

//     try {
//       QuerySnapshot snapshot = await db
//           .collection(Paths.ordersPath)
//           .where('orderStatus', isEqualTo: 'Processed')
//           .orderBy('orderTimestamp', descending: true)
//           .get();

//       if (snapshot.docs != null) {
//         processedOrders = List<Order>.from(
//           (snapshot.docs).map(
//             (e) => Order.fromFirestore(e),
//           ),
//         );
//         return processedOrders;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getOutForDeliveryOrders() async {
//     List<Order> outForDeliveryOrders = List();

//     try {
//       QuerySnapshot snapshot = await db
//           .collection(Paths.ordersPath)
//           .where('orderStatus', isEqualTo: 'Out for delivery')
//           .orderBy('orderTimestamp', descending: true)
//           .get();

//       if (snapshot.docs != null) {
//         outForDeliveryOrders = List<Order>.from(
//           (snapshot.docs).map(
//             (e) => Order.fromFirestore(e),
//           ),
//         );
//         return outForDeliveryOrders;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getAllProducts() async {
//     List<Product> products;
//     try {
//       QuerySnapshot snap = await db.collection(Paths.productsPath).get();

//       products = List<Product>.from(
//         (snap.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       return products;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Stream<List<Product>> getLowInventoryProducts() {
//     List<Product> products;

//     try {
//       CollectionReference collectionReference =
//           db.collection(Paths.productsPath);

//       return collectionReference
//           .where('quantity', isLessThanOrEqualTo: Config().lowInventoryNo)
//           .snapshots()
//           .transform(
//               StreamTransformer<QuerySnapshot, List<Product>>.fromHandlers(
//             handleData: (QuerySnapshot snap, EventSink<List<Product>> sink) {
//               if (snap.docs != null) {
//                 products = List<Product>.from(
//                   snap.docs.map(
//                     (e) => Product.fromFirestore(e),
//                   ),
//                 );
//                 sink.add(products);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Category>> getAllCategories() async {
//     List<Category> categories;

//     try {
//       CollectionReference collectionReference =
//           db.collection(Paths.categoriesPath);

//       QuerySnapshot querySnapshot = await collectionReference.get();

//       categories = List<Category>.from(
//         querySnapshot.docs.map(
//           (e) => Category.fromFirestore(e),
//         ),
//       );
//       return categories;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Stream<ProductAnalytics> getProductAnalytics() {
//     ProductAnalytics productAnalytics;

//     try {
//       DocumentReference documentReference = db.doc(Paths.productAnalyticsPath);

//       return documentReference.snapshots().transform(StreamTransformer<
//               DocumentSnapshot, ProductAnalytics>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot snap, EventSink<ProductAnalytics> sink) {
//               if (snap.data != null) {
//                 productAnalytics = ProductAnalytics.fromFirestore(snap);
//                 sink.add(productAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
Stream<InventoryAnalytics> getInventoryAnalytics() {
  InventoryAnalytics inventoryAnalytics;
}

//     try {
//       DocumentReference documentReference =
//           db.doc(Paths.inventoryAnalyticsPath);

//       return documentReference.snapshots().transform(StreamTransformer<
//               DocumentSnapshot, InventoryAnalytics>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot snap, EventSink<InventoryAnalytics> sink) {
//               if (snap.data != null) {
//                 inventoryAnalytics = InventoryAnalytics.fromFirestore(snap);
//                 sink.add(inventoryAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getActiveProducts() async {
//     List<Product> products;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.productsPath)
//           .where('isListed', isEqualTo: true)
//           .get();

//       products = List<Product>.from(
//         (snap.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       return products;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getFeaturedProducts() async {
//     List<Product> products;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.productsPath)
//           .where('featured', isEqualTo: true)
//           .get();

//       products = List<Product>.from(
//         (snap.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       return products;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getInactiveProducts() async {
//     List<Product> products;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.productsPath)
//           .where('isListed', isEqualTo: false)
//           .get();

//       products = List<Product>.from(
//         (snap.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       return products;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getTrendingProducts() async {
//     List<Product> products;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.productsPath)
//           .where('trending', isEqualTo: true)
//           .get();

//       products = List<Product>.from(
//         (snap.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       return products;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Stream<MessageAnalytics> getMessageAnalytics() {
//     MessageAnalytics messageAnalytics;

//     try {
//       DocumentReference documentReference = db.doc(Paths.messageAnalyticsPath);

//       return documentReference.snapshots().transform(StreamTransformer<
//               DocumentSnapshot, MessageAnalytics>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot snap, EventSink<MessageAnalytics> sink) {
//               if (snap.data != null) {
//                 messageAnalytics = MessageAnalytics.fromFirestore(snap);
//                 sink.add(messageAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getAllMessages() async {
//     List<Product> products = List();
//     List<Product> allMessagesProducts = List();
//     try {
//       QuerySnapshot querySnapshot =
//           await db.collection(Paths.productsPath).get();

//       products = List<Product>.from(
//         (querySnapshot.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       for (var prod in products) {
//         if (prod.queAndAns.length > 0) {
//           allMessagesProducts.add(prod);
//         }
//       }

//       return allMessagesProducts;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Product>> getNewMessages() async {
//     List<Product> products = List();
//     List<Product> newMessagesProducts = List();
//     try {
//       QuerySnapshot querySnapshot =
//           await db.collection(Paths.productsPath).get();

//       products = List<Product>.from(
//         (querySnapshot.docs).map(
//           (e) => Product.fromFirestore(e),
//         ),
//       );

//       for (var prod in products) {
//         for (var que in prod.queAndAns) {
//           if (que.ans.isEmpty) {
//             newMessagesProducts.add(prod);
//             break;
//           }
//         }
//       }

//       return newMessagesProducts;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updateLowInventoryProduct(String id, int quantity) async {
//     try {
//       await db.collection(Paths.productsPath).doc(id).set(
//         {
//           'quantity': quantity,
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> addNewProduct(Map product) async {
//     String productId;
//     List<String> urls = List();

//     try {
//       //get the current PID
//       DocumentSnapshot productCounterDoc =
//           await db.doc(Paths.productCounterPath).get();

//       String productPrefix = productCounterDoc.data()['prefix'];
//       String productIdCounter = productCounterDoc.data()['productIdCounter'];
//       productIdCounter = (int.parse(productIdCounter) + 1)
//           .toString()
//           .padLeft(productIdCounter.length, '0');

//       productId = productPrefix + productIdCounter;

//       //upload images first
//       for (var image in product['productImages']) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('productImages/$uuid');
//         StorageUploadTask storageUploadTask = storageReference.putFile(image);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         var url = await storageTaskSnapshot.ref.getDownloadURL();

//         urls.add(url);
//       }

//       //upload product to db
//       db.collection(Paths.productsPath).doc(productId).set({
//         'additionalInfo': {
//           'bestBefore': product['bestBefore'],
//           'brand': product['brand'],
//           'manufactureDate': product['manufactureDate'],
//           'shelfLife': product['shelfLife'],
//         },
//         'category': product['category'],
//         'description': product['description'],
//         'featured': product['featured'],
//         'id': productId,
//         'inStock': product['inStock'],
//         'isListed': product['isListed'],
//         'name': product['name'],
//         'ogPrice': product['ogPrice'],
//         'price': product['price'],
//         'productImages': urls,
//         'quantity': product['quantity'],
//         'queAndAns': {},
//         'reviews': {},
//         'subCategory': product['subCategory'],
//         'timestamp': Timestamp.now(),
//         'trending': false,
//         'unitQuantity': product['unitQuantity'],
//         'views': 0,
//       });

//       //update PID
//       await db.doc(Paths.productCounterPath).set(
//         {
//           'currentProductId': productId,
//           'productIdCounter': productIdCounter,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> editProduct(Map product) async {
//     String productId;
//     List<String> urls = List();
//     List productImagesUrl = List();

//     try {
//       productId = product['id'];
//       productImagesUrl = product['productImages'];

//       //upload images first
//       if (product['newProductImages'].length > 0) {
//         for (var image in product['newProductImages']) {
//           var uuid = Uuid().v4();
//           StorageReference storageReference =
//               firebaseStorage.ref().child('productImages/$uuid');
//           StorageUploadTask storageUploadTask = storageReference.putFile(image);
//           StorageTaskSnapshot storageTaskSnapshot =
//               await storageUploadTask.onComplete;
//           var url = await storageTaskSnapshot.ref.getDownloadURL();

//           urls.add(url);
//         }

//         for (var item in urls) {
//           productImagesUrl.add(item);
//         }
//       }

//       //upload product to db
//       db.collection(Paths.productsPath).doc(productId).set(
//         {
//           'additionalInfo': {
//             'bestBefore': product['bestBefore'],
//             'brand': product['brand'],
//             'manufactureDate': product['manufactureDate'],
//             'shelfLife': product['shelfLife'],
//           },
//           'category': product['category'],
//           'description': product['description'],
//           'featured': product['featured'],
//           'id': productId,
//           'inStock': product['inStock'],
//           'isListed': product['isListed'],
//           'name': product['name'],
//           'ogPrice': product['ogPrice'],
//           'price': product['price'],
//           'productImages': productImagesUrl,
//           'quantity': product['quantity'],
//           'subCategory': product['subCategory'],
//           'timestamp': Timestamp.now(),
//           'unitQuantity': product['unitQuantity'],
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> addNewCategory(Map category) async {
//     try {
//       var uuid = Uuid().v4();
//       StorageReference storageReference =
//           firebaseStorage.ref().child('categoryImages/$uuid');
//       StorageUploadTask storageUploadTask =
//           storageReference.putFile(category['categoryImage']);
//       StorageTaskSnapshot storageTaskSnapshot =
//           await storageUploadTask.onComplete;
//       var url = await storageTaskSnapshot.ref.getDownloadURL();

//       var docId = Uuid().v4();

//       db.collection(Paths.categoriesPath).doc(docId).set({
//         'categoryName': category['categoryName'],
//         'imageLink': url,
//         'categoryId': docId,
//         'subCategories': category['subCategories'],
//       });
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> editCategory(Map category) async {
//     try {
//       if (category['newImage'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('categoryImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(category['newImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         var url = await storageTaskSnapshot.ref.getDownloadURL();

//         var docId = category['categoryId'];

//         db.collection(Paths.categoriesPath).doc(docId).set(
//           {
//             'categoryName': category['categoryName'],
//             'imageLink': url,
//             'subCategories': category['subCategories'],
//           },
//           SetOptions(merge: true),
//         );
//       } else {
//         var docId = category['categoryId'];

//         db.collection(Paths.categoriesPath).doc(docId).set(
//           {
//             'categoryName': category['categoryName'],
//             'subCategories': category['subCategories'],
//           },
//           SetOptions(merge: true),
//         );
//       }

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> postAnswer(String id, String ans, String queId) async {
//     try {
//       await db.collection(Paths.productsPath).doc(id).set(
//         {
//           'queAndAns': {
//             queId: {
//               'ans': ans,
//             }
//           }
//         },
//         SetOptions(merge: true),
//       );

//       //update analytics
//       await http.post(Config().updateMessagesUrl);
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> deleteProduct(String id) async {
//     try {
//       await db.collection(Paths.productsPath).doc(id).delete();
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> deleteCategory(String categoryId) async {
//     try {
//       await db.collection(Paths.categoriesPath).doc(categoryId).delete();
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Stream<UserAnalytics> getUserAnalytics() {
//     UserAnalytics userAnalytics;

//     try {
//       DocumentReference documentReference = db.doc(Paths.userAnalyticsPath);

//       return documentReference.snapshots().transform(
//               StreamTransformer<DocumentSnapshot, UserAnalytics>.fromHandlers(
//             handleData: (DocumentSnapshot snap, EventSink<UserAnalytics> sink) {
//               if (snap.data != null) {
//                 userAnalytics = UserAnalytics.fromFirestore(snap);
//                 sink.add(userAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<GroceryUser>> getActiveUsers() async {
//     List<GroceryUser> users;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.usersPath)
//           .where('accountStatus', isEqualTo: 'Active')
//           .get();

//       users = List<GroceryUser>.from(
//         (snap.docs).map(
//           (e) => GroceryUser.fromFirestore(e),
//         ),
//       );

//       return users;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<GroceryUser>> getAllUsers() async {
//     List<GroceryUser> users;
//     try {
//       QuerySnapshot snap = await db.collection(Paths.usersPath).get();

//       users = List<GroceryUser>.from(
//         (snap.docs).map(
//           (e) => GroceryUser.fromFirestore(e),
//         ),
//       );

//       return users;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<GroceryUser>> getBlockedUsers() async {
//     List<GroceryUser> users;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.usersPath)
//           .where('isBlocked', isEqualTo: true)
//           .get();

//       users = List<GroceryUser>.from(
//         (snap.docs).map(
//           (e) => GroceryUser.fromFirestore(e),
//         ),
//       );

//       return users;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<GroceryUser>> getInactiveUsers() async {
//     List<GroceryUser> users;
//     try {
//       QuerySnapshot snap = await db
//           .collection(Paths.usersPath)
//           .where('accountStatus', isEqualTo: 'Inactive')
//           .get();

//       users = List<GroceryUser>.from(
//         (snap.docs).map(
//           (e) => GroceryUser.fromFirestore(e),
//         ),
//       );

//       return users;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Stream<List<UserReport>> getUserReports() {
//     List<UserReport> userReports;

//     try {
//       CollectionReference collectionReference =
//           db.collection(Paths.userReportsPath);

//       return collectionReference.snapshots().transform(
//               StreamTransformer<QuerySnapshot, List<UserReport>>.fromHandlers(
//             handleData: (QuerySnapshot snap, EventSink<List<UserReport>> sink) {
//               if (snap.docs != null) {
//                 userReports = List<UserReport>.from(
//                   snap.docs.map(
//                     (e) => UserReport.fromFirestore(e),
//                   ),
//                 );
//                 sink.add(userReports);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<Product> getUserReportProduct(String id) async {
//     try {
//       DocumentSnapshot documentSnapshot =
//           await db.collection(Paths.productsPath).doc(id).get();
//       return Product.fromFirestore(documentSnapshot);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getUsersOrder(List<dynamic> orderIds) async {
//     try {
//       List<Order> orders = List();
//       for (var orderId in orderIds.reversed) {
//         DocumentSnapshot snap = await orderId.get();
//         orders.add(Order.fromFirestore(snap));
//       }
//       return orders;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<Admin> getMyAccountDetails() async {
//     try {
//       FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//       print('INSIDE');

//       if (firebaseAuth.currentUser != null) {
//         User firebaseUser = firebaseAuth.currentUser;
//         print(firebaseUser.uid);
//         DocumentSnapshot snapshot =
//             await db.collection(Paths.adminsPath).doc(firebaseUser.uid).get();
//         return Admin.fromFirestore(snapshot);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> blockUser(String uid) async {
//     try {
//       await db.collection(Paths.usersPath).doc(uid).set(
//         {
//           'isBlocked': true,
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> unblockUser(String uid) async {
//     try {
//       await db.collection(Paths.usersPath).doc(uid).set(
//         {
//           'isBlocked': false,
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> proceedInitialSetup(Map map) async {
//     try {
//       //1: create cart info
//       await db.collection(Paths.adminInfoPath).doc('cartInfo').set({
//         'discountAmt': map['discountAmt'],
//         'discountPer': map['discountPer'],
//         'shippingAmt': map['shippingAmt'],
//         'taxPer': map['taxPer'],
//       });

//       //2:create all the required docs
//       await db.collection(Paths.adminInfoPath).doc('banners').set({
//         'bottomBanner': {
//           'bottomBanner': '',
//           'category': '',
//         },
//         'middleBanner': {
//           'middleBanner': '',
//           'category': '',
//         },
//         'topBanner': [],
//       });

//       await db.collection(Paths.adminInfoPath).doc('paymentMethods').set({
//         'cod': true,
//         'razorpay': true,
//         'storePickup': true,
//         'stripe': true,
//         'paypal': true,
//       });

//       //creating analytics
//       await db.collection(Paths.adminInfoPath).doc('inventoryAnalytics').set({
//         'allCategories': 0,
//         'lowInventory': 0,
//       });

//       await db.collection(Paths.adminInfoPath).doc('messageAnalytics').set({
//         'allMessages': 0,
//         'newMessages': 0,
//       });

//       await db.collection(Paths.adminInfoPath).doc('orderAnalytics').set({
//         'cancelledOrders': 0,
//         'cancelledSales': 0,
//         'deliveredOrders': 0,
//         'deliveredSales': 0,
//         'newOrders': 0,
//         'newSales': 0,
//         'processedOrders': 0,
//         'processedSales': 0,
//         'totalOrders': 0,
//         'totalSales': 0,
//       });

//       await db.collection(Paths.adminInfoPath).doc('orderIdCounter').set({
//         'currentOrderId': 'OID0000000',
//         'orderIdCounter': '0000000',
//         'prefix': 'OID',
//       });

//       await db.collection(Paths.adminInfoPath).doc('productAnalytics').set({
//         'activeProducts': 0,
//         'allProducts': 0,
//         'featuredProducts': 0,
//         'inactiveProducts': 0,
//         'trendingProducts': 0,
//       });

//       await db.collection(Paths.adminInfoPath).doc('productIdCounter').set({
//         'currentProductId': 'PID0000000',
//         'productIdCounter': '0000000',
//         'prefix': 'PID',
//       });

//       await db.collection(Paths.adminInfoPath).doc('userAnalytics').set({
//         'activeUsers': 0,
//         'allUsers': 0,
//         'blockedUsers': 0,
//         'inactiveUsers': 0,
//       });
//       await db
//           .collection(Paths.adminInfoPath)
//           .doc('deliveryUserAnalytics')
//           .set({
//         'activatedUsers': 0,
//         'activeUsers': 0,
//         'allUsers': 0,
//         'deactivatedUsers': 0,
//         'inactiveUsers': 0,
//       });
//       return true;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> checkIfNewAdmin(String uid) async {
//     try {
//       QuerySnapshot querySnapshot = await db.collection(Paths.adminsPath).get();
//       if (querySnapshot.docs.length > 0) {
//         //already created
//         DocumentSnapshot snap =
//             await db.collection(Paths.adminsPath).doc(uid).get();

//         if (snap.exists) {
//           //not new
//           return true;
//         } else {
//           //new
//           FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//           User firebaseUser = firebaseAuth.currentUser;

//           await db.collection('Admins').doc(uid).set({
//             'uid': uid,
//             'primaryAdmin': true,
//             'name': 'ADMIN_' + Random.secure().nextInt(10000).toString(),
//             'email': firebaseUser.email,
//             'timestamp': FieldValue.serverTimestamp(),
//             'tokenId': '',
//             'mobileNo': '',
//             'accountStatus': 'Active',
//             'profileImageUrl': '',
//             'password': '',
//             'activated': true,
//           });
//           return true;
//         }
//       } else {
//         //new
//         FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//         User firebaseUser = firebaseAuth.currentUser;

//         db.collection('Admins').doc(uid).set({
//           'uid': uid,
//           'primaryAdmin': true,
//           'name': 'ADMIN_' + Random.secure().nextInt(10000).toString(),
//           'email': firebaseUser.email,
//           'timestamp': FieldValue.serverTimestamp(),
//           'tokenId': '',
//           'mobileNo': '',
//           'accountStatus': 'Active',
//           'profileImageUrl': '',
//           'password': '',
//           'activated': true,
//         });
//       }
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> checkIfInitialSetupDone() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     try {
//       DocumentSnapshot snap = await db.doc(Paths.cartInfo).get();
//       if (snap.exists) {
//         sharedPreferences.setBool('initialSetupCompleted', true);

//         return true;
//       } else {
//         sharedPreferences.setBool('initialSetupCompleted', false);

//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Admin>> getAllAdmins() async {
//     List<Admin> admins = List();
//     try {
//       QuerySnapshot querySnapshot = await db.collection(Paths.adminsPath).get();

//       for (var item in querySnapshot.docs) {
//         admins.add(Admin.fromFirestore(item));
//       }
//       return admins;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updateAdminDetails(Map adminMap) async {
//     try {
//       var url = adminMap['profileImageUrl'];

//       if (adminMap['profileImage'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('deliveryProfileImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(adminMap['profileImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         url = await storageTaskSnapshot.ref.getDownloadURL();
//       }
//       await db.collection(Paths.adminsPath).doc(adminMap['uid']).set(
//         {
//           'uid': adminMap['uid'],
//           // 'primaryAdmin': adminMap['primaryAdmin'],
//           'name': adminMap['name'],
//           'email': adminMap['email'],
//           'timestamp': FieldValue.serverTimestamp(),
//           'tokenId': adminMap['tokenId'],
//           'mobileNo':
//               '${Config().countryMobileNoPrefix}${adminMap['mobileNo']}',
//           // 'accountStatus': adminMap['accountStatus'],
//           'profileImageUrl': url ?? adminMap['profileImageUrl'],
//           // 'password': adminMap['password'],
//           // 'activated': adminMap['activated'],
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<Map> getAllBanners() async {
//     Map map = Map();
//     List<Category> categories = List();
//     try {
//       QuerySnapshot querySnapshot =
//           await db.collection(Paths.categoriesPath).get();

//       categories = List<Category>.from(
//         querySnapshot.docs.map(
//           (e) => Category.fromFirestore(e),
//         ),
//       );

//       map.putIfAbsent('categories', () => categories);

//       DocumentSnapshot snapshot = await db.doc(Paths.bannersPath).get();
//       map.putIfAbsent('banner', () => Banner.fromFirestore(snapshot));

//       return map;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updateBanners(Map bannersMap) async {
//     List topBanners = List();
//     List newTopBannerUrls = List();
//     String middleBannerUrl;
//     String bottomBannerUrl;

//     try {
//       //top banner
//       for (var image in bannersMap['newTopBannerImages']) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('banners/$uuid');
//         StorageUploadTask storageUploadTask = storageReference.putFile(image);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         var url = await storageTaskSnapshot.ref.getDownloadURL();

//         newTopBannerUrls.add(url);
//       }
//       //add new top banner images
//       for (var item in newTopBannerUrls) {
//         topBanners.add(item);
//       }

//       //add previous top banner images
//       for (var item in bannersMap['topBanner']) {
//         topBanners.add(item);
//       }

//       //middle banner
//       if (bannersMap['newMiddleBannerImage'] != null) {
//         //new image upload
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('banners/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(bannersMap['newMiddleBannerImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         var url = await storageTaskSnapshot.ref.getDownloadURL();
//         middleBannerUrl = url;
//       } else {
//         middleBannerUrl = bannersMap['middleBanner'].middleBanner;
//       }

//       //bottom banner
//       if (bannersMap['newBottomBannerImage'] != null) {
//         //new image upload
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('banners/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(bannersMap['newBottomBannerImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         var url = await storageTaskSnapshot.ref.getDownloadURL();
//         bottomBannerUrl = url;
//       } else {
//         bottomBannerUrl = bannersMap['bottomBanner'].bottomBanner;
//       }

//       //update all data
//       await db.doc(Paths.bannersPath).set(
//         {
//           'bottomBanner': {
//             'bottomBanner': bottomBannerUrl,
//             'category': bannersMap['bottomBanner'].category,
//           },
//           'middleBanner': {
//             'middleBanner': middleBannerUrl,
//             'category': bannersMap['middleBanner'].category,
//           },
//           'topBanner': topBanners,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> addNewDeliveryUser(Map deliveryUserMap) async {
//     try {
//       String password = Uuid().v4().substring(0, 8);
//       var url = '';

//       if (deliveryUserMap['profileImage'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('deliveryProfileImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(deliveryUserMap['profileImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         url = await storageTaskSnapshot.ref.getDownloadURL();
//       }

//       //call function
//       Map<dynamic, dynamic> map = {
//         'mobileNo':
//             '${Config().countryMobileNoPrefix}${deliveryUserMap['mobileNo']}',
//         'name': deliveryUserMap['name'],
//         'url': url,
//         'password': password,
//         'email': deliveryUserMap['email'],
//         'activated': '${deliveryUserMap['activated']}',
//       };

//       var refundRes = await http.post(
//         'https://us-central1-grocery-admin-4e767.cloudfunctions.net/createDeliveryUserAccount', //TODO: change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/createDeliveryUserAccount
//         body: map,
//       );

//       var refund = jsonDecode(refundRes.body);

//       if (refund['message'] != 'Success') {
//         return false;
//       }

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Stream<DeliveryUserAnalytics> getDeliveryUserAnalytics() {
//     DeliveryUserAnalytics userAnalytics;

//     try {
//       DocumentReference documentReference =
//           db.doc(Paths.deliveryUserAnalyticsPath);

//       return documentReference.snapshots().transform(StreamTransformer<
//               DocumentSnapshot, DeliveryUserAnalytics>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot snap, EventSink<DeliveryUserAnalytics> sink) {
//               if (snap.data != null) {
//                 userAnalytics = DeliveryUserAnalytics.fromFirestore(snap);
//                 sink.add(userAnalytics);
//               }
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getActivatedDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot = await db
//           .collection(Paths.deliveryUsersPath)
//           .where('activated', isEqualTo: true)
//           .get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getActiveDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot = await db
//           .collection(Paths.deliveryUsersPath)
//           .where('accountStatus', isEqualTo: 'Active')
//           .get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getAllDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot =
//           await db.collection(Paths.deliveryUsersPath).get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getDeactivatedDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot = await db
//           .collection(Paths.deliveryUsersPath)
//           .where('activated', isEqualTo: false)
//           .get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getInactiveDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot = await db
//           .collection(Paths.deliveryUsersPath)
//           .where('accountStatus', isEqualTo: 'Inactive')
//           .get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> activateDeliveryUser(String uid) async {
//     try {
//       await db.collection(Paths.deliveryUsersPath).doc(uid).set(
//         {
//           'activated': true,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> deactivateDeliveryUser(String uid) async {
//     try {
//       await db.collection(Paths.deliveryUsersPath).doc(uid).set(
//         {
//           'activated': false,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> editDeliveryUser(Map deliveryUserMap) async {
//     try {
//       var url = deliveryUserMap['profileImageUrl'];

//       if (deliveryUserMap['profileImageNew'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('deliveryProfileImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(deliveryUserMap['profileImageNew']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         url = await storageTaskSnapshot.ref.getDownloadURL();
//       }

//       await db
//           .collection(Paths.deliveryUsersPath)
//           .doc(deliveryUserMap['uid'])
//           .set(
//         {
//           'activated': deliveryUserMap['activated'],
//           'email': deliveryUserMap['email'],
//           'mobileNo':
//               '${Config().countryMobileNoPrefix}${deliveryUserMap['mobileNo']}',
//           'name': deliveryUserMap['name'],
//           'profileImageUrl': url,
//           'timestamp': FieldValue.serverTimestamp(),
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> cancelOrder(Map cancelOrderMap) async {
//     try {
//       print(cancelOrderMap['paymentMethod']);
//       switch (cancelOrderMap['paymentMethod']) {
//         case 'COD':
//           //COD
//           //no refund
//           await db
//               .collection(Paths.ordersPath)
//               .doc(cancelOrderMap['orderId'])
//               .set(
//             {
//               'deliveryDetails': {
//                 'timestamp': FieldValue.serverTimestamp(),
//               },
//               'orderStatus': 'Cancelled',
//               'cancelledBy': 'Seller',
//               'reason': cancelOrderMap['reason'],
//               'refundStatus': 'NA',
//             },
//             SetOptions(merge: true),
//           );
//           return true;
//           break;
//         case 'CARD':
//           //card
//           //refund
//           Map<dynamic, dynamic> refundMap = {
//             'transactionId': cancelOrderMap['transactionId'],
//           };
//           var refundRes = await http.post(
//             'https://us-central1-grocery-admin-4e767.cloudfunctions.net/createStripeRefund', //TODO: Change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/createStripeRefund
//             body: refundMap,
//           );

//           var refund = jsonDecode(refundRes.body);

//           if (refund['message'] != 'Success' ||
//               (refund['data']['status'] == 'failed' ||
//                   refund['data']['status'] == 'canceled')) {
//             return false;
//           }

//           String refundId = refund['data']['id'];

//           await db
//               .collection(Paths.ordersPath)
//               .doc(cancelOrderMap['orderId'])
//               .set(
//             {
//               'deliveryDetails': {
//                 'timestamp': FieldValue.serverTimestamp(),
//               },
//               'orderStatus': 'Cancelled',
//               'cancelledBy': 'Seller',
//               'reason': cancelOrderMap['reason'],
//               'refundStatus': 'Processed',
//               'refundTransactionId': refundId,
//             },
//             SetOptions(merge: true),
//           );
//           return true;
//           break;
//         case 'RAZORPAY':
//           //razorpay
//           //refund
//           Map<dynamic, dynamic> refundMap = {
//             'paymentId': cancelOrderMap['transactionId'],
//           };
//           var refundRes = await http.post(
//             'https://us-central1-grocery-admin-4e767.cloudfunctions.net/initiateRefundForRazorpay', //TODO: change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/initiateRefundForRazorpay
//             body: refundMap,
//           );

//           print(refundRes.body);
//           var refund = jsonDecode(refundRes.body);

//           if (refund['message'] != 'Success') {
//             return false;
//           }

//           String refundId = refund['data']['id'];

//           await db
//               .collection(Paths.ordersPath)
//               .doc(cancelOrderMap['orderId'])
//               .set(
//             {
//               'deliveryDetails': {
//                 'timestamp': FieldValue.serverTimestamp(),
//               },
//               'orderStatus': 'Cancelled',
//               'cancelledBy': 'Seller',
//               'reason': cancelOrderMap['reason'],
//               'refundStatus': 'Processed',
//               'refundTransactionId': refundId,
//             },
//             SetOptions(merge: true),
//           );
//           return true;
//           break;
//         case 'PAYPAL':
//           break;
//         default:
//           return false;
//       }
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> proceedOrder(Map proceedOrderMap) async {
//     try {
//       if (proceedOrderMap['assignDeliveryGuy']) {
//         await db
//             .collection(Paths.ordersPath)
//             .doc(proceedOrderMap['orderId'])
//             .set(
//           {
//             'deliveryDetails': {
//               'deliveryStatus': proceedOrderMap['deliveryStatus'],
//               'mobileNo': proceedOrderMap['mobileNo'],
//               'name': proceedOrderMap['name'],
//               'otp': proceedOrderMap['otp'],
//               'timestamp': FieldValue.serverTimestamp(),
//               'uid': proceedOrderMap['uid'],
//             },
//             'orderStatus': 'Out for delivery',
//           },
//           SetOptions(merge: true),
//         );
//       } else {
//         await db
//             .collection(Paths.ordersPath)
//             .doc(proceedOrderMap['orderId'])
//             .set(
//           {
//             'deliveryDetails': {
//               'deliveryStatus': proceedOrderMap['deliveryStatus'],
//               'timestamp': FieldValue.serverTimestamp(),
//             },
//             'orderStatus': 'Processed',
//           },
//           SetOptions(merge: true),
//         );
//       }

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<List<DeliveryUser>> getReadyDeliveryUsers() async {
//     try {
//       List<DeliveryUser> deliveryUsers = List();

//       QuerySnapshot snapshot = await db
//           .collection(Paths.deliveryUsersPath)
//           .where('accountStatus', isEqualTo: 'Active')
//           .where('activated', isEqualTo: true)
//           .get();

//       deliveryUsers = List.from(
//         snapshot.docs.map(
//           (e) => DeliveryUser.fromFirestore(e),
//         ),
//       );

//       return deliveryUsers;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Order>> getPendingRefundOrders() async {
//     List<Order> pendingRefundOrders = List();

//     try {
//       QuerySnapshot snapshot = await db
//           .collection(Paths.ordersPath)
//           .orderBy('orderTimestamp', descending: true)
//           .where('orderStatus', isEqualTo: 'Cancelled')
//           .where('refundStatus', isEqualTo: 'Not processed')
//           .get();

//       if (snapshot.docs != null) {
//         pendingRefundOrders = List<Order>.from(
//           (snapshot.docs).map(
//             (e) => Order.fromFirestore(e),
//           ),
//         );
//         return pendingRefundOrders;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> initiateRefund(Map initiateRefundMap) async {
//     try {
//       //refund
//       switch (initiateRefundMap['paymentMethod']) {
//         case 'CARD':
//           Map<dynamic, dynamic> refundMap = {
//             'transactionId': initiateRefundMap['transactionId'],
//           };
//           var refundRes = await http.post(
//             'https://us-central1-grocery-admin-4e767.cloudfunctions.net/createStripeRefund', //TODO: Change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/createStripeRefund
//             body: refundMap,
//           );

//           var refund = jsonDecode(refundRes.body);

//           if (refund['message'] != 'Success' ||
//               (refund['data']['status'] == 'failed' ||
//                   refund['data']['status'] == 'canceled')) {
//             return false;
//           }

//           String refundId = refund['data']['id'];

//           await db
//               .collection(Paths.ordersPath)
//               .doc(initiateRefundMap['orderId'])
//               .set(
//             {
//               'refundStatus': 'Processed',
//               'refundTransactionId': refundId,
//             },
//             SetOptions(merge: true),
//           );
//           return true;
//           break;
//         case 'RAZORPAY':
//           Map<dynamic, dynamic> refundMap = {
//             'paymentId': initiateRefundMap['transactionId'],
//           };
//           var refundRes = await http.post(
//             'https://us-central1-grocery-admin-4e767.cloudfunctions.net/initiateRefundForRazorpay', //TODO: CHANGE this to your url //it should look something like : https://us-********-**********.cloudfunctions.net/initiateRefundForRazorpay
//             body: refundMap,
//           );

//           var refund = jsonDecode(refundRes.body);

//           if (refund['message'] != 'Success') {
//             return false;
//           }

//           String refundId = refund['data']['id'];

//           await db
//               .collection(Paths.ordersPath)
//               .doc(initiateRefundMap['orderId'])
//               .set(
//             {
//               'refundStatus': 'Processed',
//               'refundTransactionId': refundId,
//             },
//             SetOptions(merge: true),
//           );
//           return true;
//           break;
//         default:
//       }
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> addNewAdmin(Map adminMap) async {
//     try {
//       String password = Uuid().v4().substring(0, 8);
//       var url = '';

//       if (adminMap['profileImage'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('adminProfileImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(adminMap['profileImage']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         url = await storageTaskSnapshot.ref.getDownloadURL();
//       }

//       //call function
//       Map<dynamic, dynamic> map = {
//         'mobileNo': '${Config().countryMobileNoPrefix}${adminMap['mobileNo']}',
//         'name': 'ADMIN_' + Random.secure().nextInt(10000).toString(),
//         'url': url,
//         'password': password,
//         'email': adminMap['email']
//       };
//       var refundRes = await http.post(
//         'https://us-central1-grocery-admin-4e767.cloudfunctions.net/createAdminAccount', //TODO: change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/createAdminAccount
//         body: map,
//       );

//       var refund = jsonDecode(refundRes.body);

//       if (refund['message'] != 'Success') {
//         return false;
//       }

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Stream<SellerNotification> getNotifications() {
//     String uid = mAuth.currentUser.uid;

//     DocumentReference documentReference =
//         db.collection(Paths.noticationsPath).doc(uid);

//     print('inside notifications');
//     return documentReference.snapshots().transform(
//           StreamTransformer<DocumentSnapshot, SellerNotification>.fromHandlers(
//             handleData:
//                 (DocumentSnapshot docSnap, EventSink<SellerNotification> sink) {
//               SellerNotification userNotification =
//                   SellerNotification.fromFirestore(docSnap);
//               print('UID :: ${userNotification.uid}');
//               sink.add(userNotification);
//             },
//             handleError: (error, stackTrace, sink) {
//               print('ERROR: $error');
//               print(stackTrace);
//               sink.addError(error);
//             },
//           ),
//         );
//   }

//   @override
//   Future<void> markNotificationRead() async {
//     try {
//       String uid = mAuth.currentUser.uid;

//       await db.collection(Paths.noticationsPath).doc(uid).set({
//         'unread': false,
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> activateAdmin(String uid) async {
//     try {
//       await db.collection(Paths.adminsPath).doc(uid).set(
//         {
//           'activated': true,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<bool> deactivateAdmin(String uid) async {
//     try {
//       await db.collection(Paths.adminsPath).doc(uid).set(
//         {
//           'activated': false,
//         },
//         SetOptions(merge: true),
//       );

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<CartInfo> getCartInfo() async {
//     try {
//       DocumentSnapshot snap = await db.doc(Paths.cartInfo).get();
//       return CartInfo.fromFirestore(snap);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updateCartInfo(Map map) async {
//     try {
//       db.doc(Paths.cartInfo).set(
//         {
//           'discountAmt': map['discountAmt'],
//           'discountPer': map['discountPer'],
//           'shippingAmt': map['shippingAmt'],
//           'taxPer': map['taxPer'],
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<PaymentMethods> getPaymentMethods() async {
//     try {
//       DocumentSnapshot snap = await db.doc(Paths.paymentMethods).get();
//       return PaymentMethods.fromFirestore(snap);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<bool> updatePaymentMethods(Map map) async {
//     try {
//       db.doc(Paths.paymentMethods).set(
//         {
//           'cod': map['cod'],
//           'razorpay': map['razorpay'],
//           'storePickup': map['storePickup'],
//           'stripe': map['stripe'],
//           'paypal': map['paypal'],
//         },
//         SetOptions(merge: true),
//       );
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   @override
//   Future<String> sendNewNotification(Map map) async {
//     try {
//       var url = '';
//       Map notifMap = Map();
//       notifMap.putIfAbsent('title', () => map['title']);
//       notifMap.putIfAbsent('body', () => map['body']);
//       notifMap.putIfAbsent('notificationType', () => map['notificationType']);

//       if (map['category'] != null) {
//         notifMap.putIfAbsent('category', () => map['category']);
//       }

//       if (map['image'] != null) {
//         var uuid = Uuid().v4();
//         StorageReference storageReference =
//             firebaseStorage.ref().child('pushNotificationImages/$uuid');
//         StorageUploadTask storageUploadTask =
//             storageReference.putFile(map['image']);
//         StorageTaskSnapshot storageTaskSnapshot =
//             await storageUploadTask.onComplete;
//         url = await storageTaskSnapshot.ref.getDownloadURL();

//         notifMap.putIfAbsent('imageUrl', () => url);
//       }

//       print(url);

//       //call function
//       var refundRes = await http.post(
//         'https://us-central1-grocery-admin-4e767.cloudfunctions.net/sendNewNotification', //TODO: change this URL //it should look something like : https://us-********-**********.cloudfunctions.net/sendNewNotification
//         body: notifMap,
//       );

//       var refund = jsonDecode(refundRes.body);

//       if (refund['message'] != 'Success') {
//         return 'Failed to send notification!';
//       }

//       return '';
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<String> addNewCoupon(Map<String, dynamic> map) async {
//     try {
//       var docId = Uuid().v4();

//       map.putIfAbsent('couponId', () => docId);
//       map.putIfAbsent('active', () => true);

//       QuerySnapshot snapshot = await db
//           .collection(Paths.couponsPath)
//           .where('couponCode', isEqualTo: map['couponCode'])
//           .where('active', isEqualTo: true)
//           .get();

//       if (snapshot.size > 0) {
//         //exists
//         return '${map['couponCode']} coupon code is already active!';
//       }

//       await db.collection(Paths.couponsPath).doc(docId).set(map);

//       return '';
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<String> editCoupon(Map<String, dynamic> map) async {
//     try {
//       await db.collection(Paths.couponsPath).doc(map['couponId']).set(
//             map,
//             SetOptions(merge: true),
//           );

//       return '';
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   @override
//   Future<List<Coupon>> getAllCoupons() async {
//     try {
//       List<Coupon> coupons = List();
//       QuerySnapshot snapshot = await db
//           .collection(Paths.couponsPath)
//           .orderBy('active', descending: true)
//           .get();

//       if (snapshot.size > 0) {
//         //exists
//         coupons = List.from(
//           snapshot.docs.map(
//             (e) => Coupon.fromFirestore(e),
//           ),
//         );
//       }
//       return coupons;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }

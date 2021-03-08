import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:shimmer/shimmer.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          //BlocBuilder(
          //cubit: ordersBloc,
          // buildWhen: (previous, current) {
          //return false;
          // if (current is UpdateOrderAnalyticsState ||
          //     current is GetOrderAnalyticsFailedState ||
          //     current is GetOrderAnalyticsInProgressState) {
          //   return false;
          // }
          // return false;
          //}, builder: (context, state) {
          // if (state is GetOrderAnalyticsInProgressState) {
          //   return Shimmer.fromColors(
          //     period: Duration(milliseconds: 800),
          //     baseColor: Colors.grey.withOpacity(0.5),
          //     highlightColor: Colors.black.withOpacity(0.5),
          //     child: ShimmerCommonMainPageItem(size: size),
          //   );
          // }
          // if (state is GetOrderAnalyticsFailedState) {
          //   return Center(child: Text('FAILED'));
          // }
          // if (state is UpdateOrderAnalyticsState) {
          // orderAnalytics = state.orderAnalytics;

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              child: InkWell(
                splashColor: Colors.blue.withOpacity(0.3),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => NewOrdersScreen(),
                //     ),
                //   );
                // },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "order analytics",
                            // '${orderAnalytics.newOrders}',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'New Orders',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.2),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.shoppingBag,
                          color: Colors.orange.shade500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 15.0,
          ),
          // BlocBuilder(
          //     // cubit: productsBloc,
          //     buildWhen: (previous, current) {
          //   return false;
          //   // if (current is GetProductAnalyticsCompletedState ||
          //   //     current is GetProductAnalyticsFailedState ||
          //   //     current is GetProductAnalyticsInProgressState) {
          //   //   return false;
          //   // }
          //   // return false;
          // }, builder: (context, state) {
          // if (state is GetProductAnalyticsInProgressState) {
          //   return Shimmer.fromColors(
          //     period: Duration(milliseconds: 800),
          //     baseColor: Colors.grey.withOpacity(0.5),
          //     highlightColor: Colors.black.withOpacity(0.5),
          //     child: ShimmerCommonMainPageItem(size: size),
          //   );
          // }
          // if (state is GetProductAnalyticsFailedState) {
          //   return Center(child: Text('FAILED'));
          // }
          //if (state is GetProductAnalyticsCompletedState) {
          // productAnalytics = state.productAnalytics;

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              child: InkWell(
                splashColor: Colors.blue.withOpacity(0.3),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => AllProductsScreen(),
                //     ),
                //   );
                // },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "product analytics",
                            // '${productAnalytics.allProducts}',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Total Products',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 55.0,
                        height: 55.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.boxes,
                          color: Colors.blue.shade500,
                          size: 23.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          //BlocBuilder(
          //cubit: inventoryBloc,
          // buildWhen: (previous, current) {
          //   if (current is GetInventoryAnalyticsCompletedState ||
          //       current is GetInventoryAnalyticsFailedState ||
          //       current is GetInventoryAnalyticsInProgressState) {
          //     return false;
          //   }
          //   return false;
          // },
          // builder: (context, state) {
          // if (state is GetInventoryAnalyticsInProgressState) {
          //   return Shimmer.fromColors(
          //     period: Duration(milliseconds: 800),
          //     baseColor: Colors.grey.withOpacity(0.5),
          //     highlightColor: Colors.black.withOpacity(0.5),
          //     child: ShimmerCommonMainPageItem(size: size),
          //   );
          // // }
          // if (state is GetInventoryAnalyticsFailedState) {
          //   return Center(child: Text('FAILED'));
          // }
          // if (state is GetInventoryAnalyticsCompletedState) {
          //   inventoryAnalytics = state.inventoryAnalytics;

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              child: InkWell(
                splashColor: Colors.blue.withOpacity(0.3),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LowInventoryScreen(),
                //     ),
                //   );
                // },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "dsdla",
                            //${inventoryAnalytics.lowInventory}',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Low Inventory',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 55.0,
                        height: 55.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.withOpacity(0.2),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.boxOpen,
                          color: Colors.green.shade500,
                          size: 22.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 15.0,
          ),
          //
          // if (state is GetMessageAnalyticsInProgressState) {
          //   return Shimmer.fromColors(
          //     period: Duration(milliseconds: 800),
          //     baseColor: Colors.grey.withOpacity(0.5),
          //     highlightColor: Colors.black.withOpacity(0.5),
          //     child: ShimmerCommonMainPageItem(size: size),
          //   );
          // }
          // if (state is GetMessageAnalyticsFailedState) {
          //   return Center(child: Text('FAILED'));
          // }
          // if (state is GetMessageAnalyticsCompletedState) {
          //   messageAnalytics = state.messageAnalytics;

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              child: InkWell(
                splashColor: Colors.blue.withOpacity(0.3),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => NewMessagesScreen(),
                //     ),
                //   );
                // },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "message analytic",
                            //'${messageAnalytics.newMessages}',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'New Messages',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 55.0,
                        height: 55.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink.withOpacity(0.2),
                        ),
                        child: Icon(
                          Icons.mail,
                          color: Colors.pink.shade500,
                          size: 25.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SUMMARY',
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // BlocBuilder(
          //     //cubit: ordersBloc,
          //     buildWhen: (previous, current) {
          //   return false;
          //   // if (current is UpdateOrderAnalyticsState ||
          //   //     current is GetOrderAnalyticsFailedState ||
          //   //     current is GetOrderAnalyticsInProgressState) {
          //   //   return false;
          //   // }
          //   // return false;
          // }, builder: (context, state) {
          //   // if (state is GetOrderAnalyticsInProgressState) {
          //   return Shimmer.fromColors(
          //     period: Duration(milliseconds: 800),
          //     baseColor: Colors.grey.withOpacity(0.5),
          //     highlightColor: Colors.black.withOpacity(0.5),
          //     child: ShimmerCommonMainPageSmallItem(size: size),
          //   );
          // }
          // if (state is GetOrderAnalyticsFailedState) {
          //   return Center(child: Text('FAILED'));
          // }
          // if (state is UpdateOrderAnalyticsState) {
          //   orderAnalytics = state.orderAnalytics;

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.blue.withOpacity(0.3),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.01),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Total Orders',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'order',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.blue.withOpacity(0.3),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.01),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Total Sales',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "currency",
                                    //'${Config().currency}${double.parse(orderAnalytics.totalSales.toString()).toStringAsFixed(2)}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

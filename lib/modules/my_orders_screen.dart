import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopmart/cubit/shopCubit.dart';
import 'package:shopmart/cubit/states.dart';
import 'package:shopmart/models/order_model.dart';
import 'package:shopmart/shared/component.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is CancelOrderSuccessState) {
          if (state.cancelOrderModel.status) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.SCALE,
              title: 'Order has been Cancelled.',
              desc: "Your order was cancelled successfully!",
              btnOkOnPress: () {},
            )..show();
          } else {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Text(
                  'Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: Row(
            //       children: [
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Container(
                    //       width: 35,
                    //       height: 35,
                    //       decoration: BoxDecoration(
                    //         color: Colors.black,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),
                    //     Text(
                    //       '${ShopCubit.get(context).ordersDetails.length}',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w900,
                    //         fontSize: 20,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Items',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w800,
                    //     fontSize: 18,
                    //     color: Colors.red,
                    //   ),
                    // ),
                //  ],
               // ),
           //   ),
          //  ],
          ),
           body: buildNoOrders(context)
          // ConditionalBuilder(
          //   condition: ShopCubit.get(context).orderModel!.data.data.length > 0,
          //   builder: (context) => ConditionalBuilder(
          //     condition: ShopCubit.get(context).ordersDetails.isNotEmpty &&
          //         state is! CancelOrderLoadingState,
          //     builder: (context) => SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             height: 10,
          //           ),
          //           ListView.separated(
          //             itemBuilder: (context, index) => buildOrderItem(
          //                 ShopCubit.get(context).ordersDetails[index].data,
          //                 context,
          //                 state),
          //             separatorBuilder: (context, index) => Container(),
          //             itemCount: ShopCubit.get(context).ordersDetails.length,
          //             shrinkWrap: true,
          //             physics: NeverScrollableScrollPhysics(),
          //           ),
          //         ],
          //       ),
          //     ),
          //     fallback: (context) => Center(child: CircularProgressIndicator()),
          //   ),
          //
          //     fallback: (context) => buildNoOrders(context),
          //
          // ),
        );
      },
    );
  }

  Widget buildOrderItem(OrderDetailsData model, context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Order ID:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.id.toString(),
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      model.date,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "Cairo",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Cost : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "${NumberFormat.currency(decimalDigits: 0, symbol: "").format(model.cost)} LE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo",
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "VAT : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "${NumberFormat.currency(decimalDigits: 0, symbol: "").format(model.vat)} LE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo",
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "Total Amount : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${NumberFormat.currency(decimalDigits: 0, symbol: "").format(model.total)} LE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo",
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.status,
                      style: TextStyle(
                        color: (model.status == "New")
                            ? Colors.green
                            : Colors.red,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    if (model.status == "New")
                      primaryButton(
                        text: "Cancel",
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            animType: AnimType.SCALE,
                            title: 'Are you Sure for Cancel Order ?',
                            btnOkOnPress: () {
                              ShopCubit.get(context).cancelOrder(id: model.id);
                            },
                            btnCancelOnPress: () {},
                          )..show();
                        },
                        width: 100,
                        height: 30,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildNoOrders(context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 50,
              child: Icon(
                Icons.list_alt_outlined,
                size: 60,
                color:Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You have no orders in progress!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'All your orders will be saved here for you to access their state anytime',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: primaryButton(
                  text: "Start Shopping",
                  onPressed: () {
                    ShopCubit.get(context).changeBottomNav(0);
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      );
}

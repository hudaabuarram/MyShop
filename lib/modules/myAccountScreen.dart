import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shopmart/cubit/appCubit.dart';
import 'package:shopmart/cubit/shopCubit.dart';
import 'package:shopmart/cubit/states.dart';
import 'package:shopmart/modules/LoginScreen.dart';
import 'package:shopmart/modules/addressesScreen.dart';
import 'package:shopmart/modules/changePasswordScreen.dart';
import 'package:shopmart/modules/favoritesScreen.dart';
import 'package:shopmart/modules/helpScreen.dart';
import 'package:shopmart/modules/my_orders_screen.dart';
import 'package:shopmart/modules/profileScreen.dart';
import 'package:shopmart/shared/component.dart';
import 'package:shopmart/shared/constants.dart';

import 'SearchScreen.dart';

class MyAccountScreen extends StatefulWidget {




  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state) {},
        builder: (context,state)
      {
        ShopCubit cubit =  ShopCubit.get(context);
        bool value = false;
        var user = ShopCubit.get(context).userModel!.data!;
        return  Container(

                height: MediaQuery.of(context).size.height,

                child: Stack(
        children: [

                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 220,
                        color: Colors.redAccent.withOpacity(.8),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment(-0.9, -0.90),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top:45),
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment(1,1),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                            ),
                            Expanded(


                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(top:55),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 270,
                                        child: Text(
                                          "Hello, ${user.name!.toUpperCase()}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "UID: ${user.id}",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.9),
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Email: ${user.email!.toUpperCase()}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.9),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),

        Positioned.fill(
        child: Align(
        alignment: Alignment(1.1,1.1),
        child: Container(
        
        width:double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
        ),
        child: SingleChildScrollView(
        child: Column(
        children: [

      InkWell(
      onTap: () {
      navigateTo(context, MyOrdersScreen());
      },
      child: Padding(
      padding:
      const EdgeInsetsDirectional.fromSTEB(
      15, 15, 5, 19),
      child: Row(
      children: [
      Icon(
      Icons.view_list,
      size: 25,
      color: Colors.redAccent,
      ),
      SizedBox(
      width: 35,
      ),
      Text(
      "My Orders",
      style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15),
      ),
      Spacer(),
      Text(
      "Total (${ShopCubit.get(context).ordersDetails.length})",
      style: TextStyle(
      color: Colors.deepOrangeAccent
          .withOpacity(0.6),
      fontFamily: "Roboto",
      fontSize: 13,
      ),
      ),
      Icon(
      Icons.arrow_right,
      size: 30,
      color: Colors.grey.withOpacity(0.6),
      ),
      ],
      ),
      ),
      ),
      buildRowIcons(
      onTap: () {
      navigateTo(context, AddressesScreen());
      },
      text: "My Address",
      icon: Icons.location_on,
      color: Colors.orange),
      buildRowIcons(
      onTap: () {
      navigateTo(context, ProfileScreen());
      },
      text: "My Profile",
      icon: Icons.account_box,
      ),
      buildRowIcons(
      onTap: () {
      navigateTo(
      context, ChangePasswordScreen());
      },
      text: "Change Password",
      icon: Icons.vpn_key,
      color: Colors.indigo),

      buildRowIcons(
      text: "Sign Out",
      icon: Icons.logout,
      onTap: () {
      signOut(context);
      },
      ),


















              ],
            ),
          ),
        ),
        ),
        ),
        ],
      ),

        );
      },
    );
  }
  Widget buildRowIcons({text, icon, color, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 5, 19),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: Colors.grey.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}

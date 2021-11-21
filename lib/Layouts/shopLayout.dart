import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmart/cubit/shopCubit.dart';
import 'package:shopmart/cubit/states.dart';
import 'package:shopmart/modules/LoginScreen.dart';
import 'package:shopmart/modules/SearchScreen.dart';
import 'package:shopmart/modules/cartScreen.dart';
import 'package:shopmart/remoteNetwork/cacheHelper.dart';
import 'package:shopmart/shared/component.dart';
import 'package:shopmart/shared/constants.dart';


class ShopLayout extends StatelessWidget {
  bool showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state) {
        if(state is HomeSuccessState)
          int cartLen = ShopCubit.get(context).cartModel.data!.cartItems.length;
      },
       builder: (context,state) {
        ShopCubit cubit =  ShopCubit.get(context);

        return  Scaffold(

          appBar: AppBar(
            titleSpacing: 10,
            title: Row(
              children: [
                Image(image: AssetImage('assets/images/shop.png'),width: 27, height: 27,),
                Text('MyShop'),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {

                    navigateTo(context, SearchScreen(ShopCubit.get(context)));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    navigateTo(context, CartScreen());
                  },
                  icon: Icon(Icons.shopping_cart_outlined)),

              // Padding(
              //    padding:
              //    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              //    child: buildIconWithNumber(
              //        condition: ShopCubit.get(context).cartModel.data!.cartItems.length> 0,
              //        icon: Icons.shopping_cart_outlined  ,
              //        number:ShopCubit.get(context).cartModel.data!.cartItems.length,
              //        radius: 8,
              //        fontSize: 12,
              //        alignment: Alignment(0.6, -0.5),
              //        onPressed: () {
              //          navigateTo(context, CartScreen());
              //        }),
              //  ),
            ],
          ),


          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
          items: cubit.bottomItems,
          height: 50,
          color: Colors.redAccent,
          animationCurve: Curves.easeInOutCubic,
          buttonBackgroundColor:Color(0xffDDDDDD),
          backgroundColor: Color(0xFF222831),
            index: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNav(index),



            ),
            );

             },
    );
  }
}

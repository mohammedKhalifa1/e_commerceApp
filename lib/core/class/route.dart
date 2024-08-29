import 'package:e_commerce/core/class/route_name.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:e_commerce/view/items_items_view.dart';
import 'package:flutter/material.dart';
import '../../view/home_view.dart';
import '../../view/start_page.dart';
import '../widget/custom/pages/archive_page.dart';
import '../widget/custom/pages/proceed_buy.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const Home(),
  RouteName.signUp: (context) => const SignUp(),
  RouteName.login: (context) => const LogIn(),
  RouteName.home: (context) => const HomeView(),
  RouteName.itemsView: (context) => const ItemsView(),
  RouteName.proceedBuy: (context) => const ProceedBuy(),
  RouteName.archive: (context) => const Archive(),
};

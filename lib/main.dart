import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/cart/bloc/get_cost/get_cost_bloc.dart';
import '../../presentation/cart/bloc/order/order_bloc.dart';
import '../../presentation/order/bloc/buyer_order/buyer_order_bloc.dart';
import '../../presentation/order/bloc/cek_resi/cek_resi_bloc.dart';
import '../../presentation/payment/bloc/bloc/order_detail_bloc.dart';
import '../../presentation/shipping_address/bloc/add_address/add_address_bloc.dart';
import '../../presentation/shipping_address/bloc/city/city_bloc.dart';
import '../../presentation/shipping_address/bloc/get_address/get_address_bloc.dart';
import '../../presentation/shipping_address/bloc/province/province_bloc.dart';
import '../../presentation/shipping_address/bloc/subdistrict/subdistrict_bloc.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../presentation/auth/login_page.dart';
import '../../presentation/dashboard/dashboard_page.dart';
import '../../presentation/home/bloc/products/products_bloc.dart';
import '../../presentation/auth/bloc/login/login_bloc.dart';
import '../../presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/cart/bloc/cart/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsBloc()..add(const ProductsEvent.getAll()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(),
        ),
        BlocProvider(
          create: (context) => CityBloc(),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(),
        ),
        BlocProvider(
          create: (context) => GetAddressBloc(),
        ),
        BlocProvider(
          create: (context) => GetCostBloc(),
        ),
        BlocProvider(
          create: (context) => BuyerOrderBloc(),
        ),
        BlocProvider(
          create: (context) => CekResiBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.purple.shade100,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payment_app/infra/pages/filter.dart';
import 'package:payment_app/infra/pages/home.dart';
import 'package:payment_app/infra/pages/payment_form.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     routes: {
      "/":(_)=> const HomePage(),
      "/form":(_)=> const PaymentForm(),
      "/filter":(_)=> const FilterForm()
     },
     initialRoute: "/",
    );
  }
}



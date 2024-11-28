import 'currency_converter_page.dart';
import 'package:flutter/material.dart';

void main(){
  // runApp(Text(
  //   'Hello mera app hai??? ',
  //   textDirection: TextDirection.ltr,
  //   ));
  runApp(const MyApp()); 
}

// widgets :- stateless(inmutatble state) and statfull(mutagle state)
// state is data widget uses 

// 1.Material design by google  it adds navigation to our app
// 2. Cupertino Design by Apple

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key:key); //both are same
  const MyApp({super.key}); // inside statless super.key then widge have a key and passing it to super widget;

  @override
  Widget build(BuildContext context) {
    
    // this is widget tree;
    return const MaterialApp(  // Matarial App make the global part of the app;
      home: CurrencyConverterMaterialPage(),
    );
  }
}
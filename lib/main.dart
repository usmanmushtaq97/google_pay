import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBQ Apple Pay',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CBQ Testing Google Pay'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const   Text('Welcome to Commercial Bank'),
              GooglePayButton(
                width: 300,
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
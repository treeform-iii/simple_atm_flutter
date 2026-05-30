import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final TextEditingController amountController = TextEditingController();

  void deposit() {
    String amount = amountController.text.trim();

    if (amount.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter an amount")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Deposit Successful")));

    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deposit")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView(
          children: [
            Text(
              "Deposit Funds",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text("Enter Amount", style: TextStyle(fontSize: 18)),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Amount"),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: deposit, child: Text("Confirm")),
          ],
        ),
      ),
    );
  }
}

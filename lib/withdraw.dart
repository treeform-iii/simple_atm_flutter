import 'package:flutter/material.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final TextEditingController amountController = TextEditingController();

  void withdraw() {
    String amount = amountController.text.trim();

    if (amount.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter an amount")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Withdrawal Successful")));

    amountController.clear();
  }

  void setAmount(String amount) {
    amountController.text = amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Withdraw")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView(
          children: [
            Text(
              "Withdraw Funds",
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

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => setAmount("500"),
                  child: Text("₱500"),
                ),

                ElevatedButton(
                  onPressed: () => setAmount("1000"),
                  child: Text("₱1000"),
                ),

                ElevatedButton(
                  onPressed: () => setAmount("2000"),
                  child: Text("₱2000"),
                ),

                ElevatedButton(
                  onPressed: () => setAmount("5000"),
                  child: Text("₱5000"),
                ),
              ],
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: withdraw, child: Text("Confirm")),
          ],
        ),
      ),
    );
  }
}

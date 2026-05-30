import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final TextEditingController recipientController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void transfer() {
    String recipient = recipientController.text.trim();
    String amount = amountController.text.trim();

    if (recipient.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in all fields")));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully transferred ₱$amount to $recipient"),
      ),
    );

    recipientController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfer")),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Transfer Funds",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          Text(
            "Recipient Account Name / Number",
            style: TextStyle(fontSize: 18),
          ),

          TextField(
            controller: recipientController,
            decoration: InputDecoration(hintText: "Enter recipient"),
          ),

          SizedBox(height: 20),

          Text("Amount", style: TextStyle(fontSize: 18)),

          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter amount"),
          ),

          SizedBox(height: 30),

          ElevatedButton(onPressed: transfer, child: Text("Transfer")),
        ],
      ),
    );
  }
}

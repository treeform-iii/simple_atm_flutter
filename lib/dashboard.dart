import 'package:flutter/material.dart';
import 'withdraw.dart';
import 'deposit.dart';
import 'transfer.dart';
import 'settings.dart';

class DashboardScreen extends StatelessWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pedro's Bank Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Welcome, $username!",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // Account Balance
          const Text("Current Balance", style: TextStyle(fontSize: 18)),

          const Text(
            "₱25,000.00",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 76, 167, 175),
            ),
          ),

          const SizedBox(height: 30),

          // Quick Actions
          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Withdraw()),
              );
            },
            child: const Text("Withdraw"),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Deposit()),
              );
            },
            child: const Text("Deposit"),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Transfer()),
              );
            },
            child: const Text("Transfer"),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            child: const Text("Profile / Settings"),
          ),

          const SizedBox(height: 30),

          // Recent Transactions
          const Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const ListTile(
            title: Text("Deposit"),
            subtitle: Text("August 15, 2026"),
            trailing: Text("+ ₱5,000"),
          ),

          const ListTile(
            title: Text("Withdrawal"),
            subtitle: Text("August 14, 2026"),
            trailing: Text("- ₱1,000"),
          ),

          const ListTile(
            title: Text("Transfer"),
            subtitle: Text("August 13, 2026"),
            trailing: Text("- ₱2,500"),
          ),
        ],
      ),
    );
  }
}

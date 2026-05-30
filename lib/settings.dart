import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;

  void changePin() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Change PIN not yet here")));
  }

  void changePassword() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Change Password not yet here")));
  }

  void toggleNotifications(bool value) {
    setState(() {
      notificationsEnabled = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? "Notifications ON" : "Notifications OFF")),
    );
  }

  void logout() {
    Navigator.popUntil(context, (route) => route.isFirst);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Logged out successfully")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile / Settings")),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [
          // profile information
          Text(
            "Profile Information",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 15),

          ListTile(title: Text("Username"), subtitle: Text("Pedro")),

          ListTile(title: Text("Address"), subtitle: Text("Sa Pilipinas")),

          ListTile(
            title: Text("Account ID"),
            subtitle: Text("XXXX-XXX-XXX-XXXX"),
          ),

          SizedBox(height: 20),

          // change pin/password settings
          Text(
            "Security",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          ElevatedButton(onPressed: changePin, child: Text("Change PIN")),

          SizedBox(height: 10),

          ElevatedButton(
            onPressed: changePassword,
            child: Text("Change Password"),
          ),

          SizedBox(height: 20),

          // notifs enable/disable settings
          Text(
            "Notifications",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SwitchListTile(
            title: Text("Enable Notifications"),
            value: notificationsEnabled,
            onChanged: toggleNotifications,
          ),

          SizedBox(height: 30),

          // logout button
          ElevatedButton(
            onPressed: logout,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 210, 84, 75),
            ),
            child: Text("LOGOUT", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

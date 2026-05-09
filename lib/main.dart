import 'dart:io';

String pinCorrect = "1234";
double balance = 1000.00;

// MAIN FUNCTION
void main() {
  bool isPinCorrect = false;
  int attempts = 3;

  while (!isPinCorrect && attempts > 0) {
    stdout.write("Enter your PIN: ");
    String? enteredPin = stdin.readLineSync();

    if (enteredPin == pinCorrect) {
      isPinCorrect = true;

      print("\nPIN is correct.");
      print("Thank you for choosing Pedro's Bank.");

      menuPanel();
    } else {
      attempts--;
      print("Pincode is incorrect, you have $attempts attempts remaining.");
    }
  }

  if (!isPinCorrect) {
    print("Too many incorrect attempts.");
  }
}

void menuPanel() {
  bool activeMenu = true;

  while (activeMenu) {
    print("\n    MENU PANEL   ");
    print("------------------");
    print("[1] Balance Inquiry");
    print("[2] Cash Withdrawal");
    print("[3] Transfer");
    print("[4] Deposit");
    print("[5] Change PIN");
    print("[6] Pay Bills");
    print("[7] Exit");

    stdout.write("\nPlease select an option: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        balanceInquiry();
        break;

      case "2":
        cashWithdrawal();
        break;

      case "3":
        transferCash();
        break;

      case "4":
        depositCash();
        break;

      case "5":
        changePin();
        break;

      case "6":
        payBills();
        break;

      case "7":
        print("\nThank you for using Pedro's Bank ATM services!");
        activeMenu = false;
        break;

      default:
        print("Invalid option.");
    }
  }
}

// Menu Options' Functions
// Cash Balance
void balanceInquiry() {
  print("\nYour current balance is: ₱$balance");
}

// Withdrawal Cash
void cashWithdrawal() {
  stdout.write("\nEnter amount to withdraw: ");
  double amount = double.parse(stdin.readLineSync()!);

  if (amount <= balance) {
    balance -= amount;

    print("Withdrawal successful.");
    print("Remaining balance: ₱$balance");
  } else {
    print("Insufficient balance.");
  }
}

// Transfer Cash
void transferCash() {
  stdout.write("\nEnter amount to transfer: ");
  double amount = double.parse(stdin.readLineSync()!);

  if (amount <= balance) {
    balance -= amount;

    print("Transfer successful.");
    print("Remaining balance: ₱$balance");
  } else {
    print("Insufficient balance.");
  }
}

// Deposit Cash
void depositCash() {
  stdout.write("\nEnter amount to deposit: ");
  double amount = double.parse(stdin.readLineSync()!);

  balance += amount;

  print("Deposit successful.");
  print("New balance: ₱$balance");
}

// Change account PIN
void changePin() {
  stdout.write("\nEnter new PIN: ");
  String? newPin = stdin.readLineSync();

  pinCorrect = newPin!;

  print("PIN changed successfully.");
}

// Bills Payment
void payBills() {
  stdout.write("Enter bill amount: ");
  double bill = double.parse(stdin.readLineSync()!);

  if (bill <= balance) {
    balance -= bill;

    print("Bill paid successfully.");
    print("Remaining balance: ₱$balance");
  } else {
    print("Insufficient balance.");
  }
}

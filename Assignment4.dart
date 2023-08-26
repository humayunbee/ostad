//Assignment 4 Submited by Md. Humayun Farid

abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {
  var savingsAccount = SavingsAccount(12345, 1000.0, 0.05);
  print('Savings Account');
  print('Initial Balance: \$${savingsAccount.balance.toStringAsFixed(2)}');
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(200.0);
  print('Remaining Balance: \$${savingsAccount.balance.toStringAsFixed(2)}\n');

  var currentAccount = CurrentAccount(67890, 2000.0, 1000.0);
  print('Current Account');
  print('Initial Balance: \$${currentAccount.balance.toStringAsFixed(2)}');
  currentAccount.deposit(300.0);
  currentAccount.withdraw(2500.0);
  print('Remaining Balance: \$${currentAccount.balance.toStringAsFixed(2)}');
}

// Student: Abdalrahman Abdalkarim
// Reg no: 27052
const String regNo = '27052';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by A.A.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by A.A.
  String str = amount.abs().toString();
  String result = '';
  int i = str.length - 1;
  int count = 0;

  while (i >= 0) {
    result = str[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = ',' + result;
    }
    i--;
  }

  if (amount < 0) {
    result = '-' + result;
  }
  return result + ' RWF';
}

bool isValidPin(String pin) {
  // by A.A.
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  bool allSame = true;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false;
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }

  if (allSame) return false;

  return true;
}

int sendMoney(int balance, int amount) {
  // by A.A.
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance -= (amount + fee);
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(balance)}');
  return balance;
}

int buyAirtime(int balance, int amount) {
  // by A.A.
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount (airtime must be 100 to 50,000 RWF)');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance -= amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(balance)}');
  return balance;
}

void main() {
  // by A.A.
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // My own tests (expected output in the comment)
  print(formatRwf(100)); // expected: 100 RWF
  print(formatRwf(1000000)); // expected: 1,000,000 RWF
  print(formatRwf(-123456)); // expected: -123,456 RWF (might break: negative sign + commas)
  print(formatRwf(0)); // expected: 0 RWF
  print(isValidPin('00000')); // expected: false (same digit five times)
  print(isValidPin('')); // expected: false (empty string, might break)
  print(isValidPin('4821 ')); // expected: false (a space is not a digit)
}

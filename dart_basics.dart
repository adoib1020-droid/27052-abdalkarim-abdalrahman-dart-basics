// Student: Abdalrahman Abdalbasit Abdalrahman Abdalkarim
// Reg no: 27052
const String regNo = '27052';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by A.A.
  int count = 0;
  String lowerText = text.toLowerCase();
  int i = 0;
  while (i < lowerText.length) {
    String char = lowerText[i];
    if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by A.A.
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(' ');
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by A.A.
  if (height <= 0) return;
  int i = 1;
  while (i <= height) {
    String row = '';
    int spaces = height - i;
    int s = 0;
    while (s < spaces) {
      row += ' ';
      s++;
    }
    String char = (i % 2 == 0) ? '#' : '*';
    int c = 0;
    while (c < i) {
      row += char;
      c++;
    }
    print(row);
    i++;
  }
}

int momoFee(int amount) {
  // by A.A.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by A.A.
  if (phone.length != 10) return 'INVALID';
  String masked = phone.substring(0, 3);
  int i = 3;
  while (i < phone.length - 2) {
    masked += '*';
    i++;
  }
  masked += phone.substring(phone.length - 2);
  return masked;
}

void main() {
  // by A.A.
  print('Reg no: $regNo | D = $d | T = $t');
  
  print('Abdalrahman Abdalkarim has ${countVowels('Abdalrahman Abdalkarim')} vowels');
  
  print(initials('Abdalrahman Abdalkarim'));
  print(initials(' ana  uwase '));
  print(initials(' '));
  
  drawTriangle(d + 3);
  drawTriangle(-2);
  drawTriangle(0);
  
  int i = 1;
  int sum = 0;
  String phone = maskPhone('0788123456');
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    sum += fee;
print('Receipt $i | $amount RWF | fee $fee RWF | to $phone');
    i++;
  }
  print('Total fees: $sum RWF');
}

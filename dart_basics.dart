// Student: Abdalrahman Abdalkarim
// Reg no: 27052
const String regNo = '27052';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by A.A.
int countVowels(String text) {
  int count = 0;
  String lowerText = text.toLowerCase();
  
  for (int i = 0; i < lowerText.length; i++) {
    String char = lowerText[i];
    if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
      count++;
    }
  }
  
  return count;
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');
  
  // تجربة الدالة
  print(countVowels('Abdalrahman Abdalkarim')); 
}
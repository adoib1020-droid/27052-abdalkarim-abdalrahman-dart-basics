// Student: Abdalrahman Abdalkarim
// Reg no: 27052
const String regNo = '27052';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D=$d | T=$t');
}
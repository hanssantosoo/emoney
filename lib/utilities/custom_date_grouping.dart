

int calcDaysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours ~/ 24);
}

int calcSecondsBetween(DateTime from, DateTime to) {
  from = DateTime(
      from.year, from.month, from.day, from.hour, from.minute, from.second);
  to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
  return to.difference(from).inSeconds;
}

String customGroup(DateTime transactionDate) {
  String response = '';
  DateTime latestDate = DateTime.now();
  int nDaysInBetween = calcDaysBetween(transactionDate, latestDate);
 
  int years = nDaysInBetween ~/ 365;

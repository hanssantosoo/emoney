

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
if (years == 1) {
    response = 'Last year';
  } else if (years > 1 && years <= 5) {
    response = '$years years ago';
  } else if (years > 5) {
    response = 'More than 5 years ago';
  } else {
    nDaysInBetween -= 365 * years;
    
    int months = nDaysInBetween ~/ 30;
    if (months == 1) {
      response = 'Last month';
    } else if (months > 1 && months <= 6) {
      response = '$months months ago';
    } else if (months >= 6) {
      response = 'More than 6 months ago';
    } else {
      int days = latestDate.day - transactionDate.day;

      if (days == 1) {
        response = 'Yesterday';
        
        
      } else if (days > 1 && days <= 7) {
        response = 'This week';
      } else if (days > 7 && days <= 14) {
        response = 'Last week';
      } else if (days > 14 && days <= 30) {
        int weeks = days ~/ 7;
        response = '$weeks weeks ago';
      } else {
        response = 'Today';
      }
    }
  }
  return response;
}

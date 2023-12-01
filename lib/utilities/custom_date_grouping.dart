

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
int customGroupComparator(String group1, String group2) {
  int comparison = -1;
  int group1Match = 0;
  int group2Match = 0;
  List<String> dateGroups = [
    r'Today',
    r'Yesterday',
    r'This week',
    r'Last week',
    r'\d{1} weeks ago',
    r'Last month',
    r'\d{1} months ago',
    r'More than 6 months ago',
    r'Last year',
    r'\d{1} years ago',
    r'More than 5 years ago',
  ];
for (var i = 0; i < dateGroups.length; i++) {
    if (RegExp(dateGroups[i]).hasMatch(group1)) {
      group1Match = i;
    }
    if (RegExp(dateGroups[i]).hasMatch(group2)) {
      group2Match = i;
    }
  }
  // check
  if (group1Match == group2Match) {
    comparison = group1.compareTo(group2);
  } else if (group1Match < group2Match) {
    comparison = -1;
  } else {
    comparison = 1;
  }
  return comparison;
}

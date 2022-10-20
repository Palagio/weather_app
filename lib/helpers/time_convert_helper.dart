hourTime(utc) {
  final localTime = DateTime.fromMillisecondsSinceEpoch(utc * 1000).hour;
  return localTime;
}

dayTime(utc) {
  final localTime = DateTime.fromMillisecondsSinceEpoch(utc * 1000).day;
  return localTime;
}

dayOfWeek(utc) {
  final localTime = DateTime.fromMillisecondsSinceEpoch(utc * 1000).weekday;
  var dayOfWeek = '';
  switch (localTime) {
    case 1:
      dayOfWeek = 'Sunday';
      break;
    case 2:
      dayOfWeek = 'Monday';
      break;
    case 3:
      dayOfWeek = 'Tuesday';
      break;
    case 4:
      dayOfWeek = 'Wednesday';
      break;
    case 5:
      dayOfWeek = 'Thursday';
      break;
    case 6:
      dayOfWeek = 'Friday';
      break;
    case 7:
      dayOfWeek = 'Saturday';
      break;
  }

  return dayOfWeek;
}

monthTime(utc) {
  final localTime = DateTime.fromMillisecondsSinceEpoch(utc * 1000).month;
  var month = '';
  switch (localTime) {
    case 1:
      month = 'JAN';
      break;
    case 2:
      month = 'FEV';
      break;
    case 3:
      month = 'MAR';
      break;
    case 4:
      month = 'ABR';
      break;
    case 5:
      month = 'MAI';
      break;
    case 6:
      month = 'JUN';
      break;
    case 7:
      month = 'JUL';
      break;
    case 8:
      month = 'AGO';
      break;
    case 9:
      month = 'SET';
      break;
    case 10:
      month = 'OUT';
      break;
    case 11:
      month = 'NOV';
      break;
    case 12:
      month = 'DEZ';
  }
  return month;
}

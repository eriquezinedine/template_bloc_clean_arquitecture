int createId( DateTime dateTime){
  return (dateTime.month * 30) + dateTime.day + (dateTime.year * 360) + (dateTime.minute) + (dateTime.hour)+ (dateTime.second);
}

int createIdDay(DateTime date){
  return (date.year*12*30) + (date.month * 30) + (date.day);
}
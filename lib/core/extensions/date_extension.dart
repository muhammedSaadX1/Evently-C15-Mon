import 'package:intl/intl.dart';

extension FormatDateTime on DateTime{
   String get toFormatDate{
    DateFormat formater = DateFormat("dd-MM-yyyy");
    return formater.format(this);
  }


  String  get viewMonthText{
     DateFormat formater = DateFormat("MMMM");
      String month = formater.format(this);
     return month.substring(0,3);
  }


  String get formatTime {
     DateFormat formatter = DateFormat().add_jm();
     return formatter.format(this);
  }

}
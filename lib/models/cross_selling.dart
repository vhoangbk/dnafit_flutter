import 'package:intl/intl.dart';

class CrossSelling{
  static const String CDS = 'CDS';
  static const String SAVING_AC = 'SAVING_AC';
  static const String CYBER_RISK_PURCHASE = 'CYBER_RISK_PURCHASE';

  String amount = '';
  String? sourceAcc;
  String tiedProductCode;
  String? accNo;
  String? interestRate;
  String startDate;
  String endDate;

  CrossSelling({required this.tiedProductCode, required this.amount, required this.startDate, required this.endDate, this.sourceAcc, this.accNo, this.interestRate});

  String valueDate(){
    return dateFormat(startDate);;
  }

  String dateFormat(String date){
    DateFormat format = DateFormat('dd/MM/yyyy');
    DateTime dateTime = format.parse(date);
    return DateFormat('yyyyMMdd').format(dateTime);
  }

  String matDate(){
    return dateFormat(endDate);
  }

  String amountFormat(){
    String customPattern = NumberFormat('#,##0').format(int.parse(amount));
    return customPattern;
  }

}
import 'dart:convert';
import 'dart:ffi';

import 'package:dnafit_flutter/models/cross_selling.dart';
import 'package:dnafit_flutter/widgets/text_base.dart';
import 'package:flutter/material.dart';

class CrossSellingSuccess extends StatelessWidget {
  final CrossSelling data;

  List<Map<String, String>> dataInfo = [];

  CrossSellingSuccess({super.key, required this.data}){
    if (data.tiedProductCode == CrossSelling.CDS) {
      dataInfo = [
        {
          "title": 'Mã hợp đồng',
          "value": '2234439978745',
        },
        {
          "title": 'Số tiền mua mới',
          "value": '${data.amountFormat()} VND',
        },
        {
          "title": 'Lãi suất',
          "value": '${data.interestRate}%/năm',
        },
        {
          "title": 'Ngày giao dịch',
          "value": data.startDate,
        },
        {
          "title": 'Ngày đáo hạn',
          "value": data.endDate,
        },
      ];
    } else if (data.tiedProductCode == CrossSelling.SAVING_AC){
      dataInfo = [
        {
          "title": 'Số tài khoản tiền gửi số',
          "value": data.accNo ?? '',
        },
        {
          "title": 'Số tiền',
          "value": '${data.amountFormat()} VND',
        },
        {
          "title": 'Lãi suất',
          "value": '${data.interestRate}%/năm',
        },
        {
          "title": 'Tần suất trả lãi',
          "value": 'Cuối kỳ',
        },
        {
          "title": 'Ngày bắt đầu',
          "value": data.startDate,
        },
        {
          "title": 'Ngày đến hạn',
          "value": data.endDate,
        },
        {
          "title": 'Hình thức đến hạn',
          "value": 'Tự động quay vòng gốc và lãi',
        },
      ];
    } else if (data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE) {
      dataInfo = [
        {
          "title": 'Số tiền',
          "value": '${data.amountFormat()} VND',
        },
        {
          "title": 'Số tiền được bảo vệ',
          "value": '50,000,000 VND',
        },
        {
          "title": 'Kỳ hạn bảo vệ',
          "value": '1 tháng',
        },
        {
          "title": 'Ngày bắt đầu',
          "value": data.startDate,
        },
        {
          "title": 'Ngày hết hạn',
          "value": data.endDate,
        },
        {
          "title": 'Tự động gia hạn',
          "value": data.autoRenewDate(),
        },
      ];
    }
  }

  Widget renderRow(String title, String value){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'AvenirNext',
              fontSize: 12,
              color: Color(0xff646464),
            ),
          ),
          Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'AvenirNext',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff646464),
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              width: double.infinity,
              fit: BoxFit.contain,
              image: AssetImage('assets/images/img_line_dot.png')
          ),
          SizedBox(width: 10, height: 10,),
          Text('Chứng chỉ tiền gửi'.toUpperCase(),
            style: TextStyle(
                color: Color(0xff2E2E2E),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFamily: 'AvenirNext'
            ),
          ),
          SizedBox(width: 10, height: 5,),
          ListView.builder(
            padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:dataInfo.length,
              itemBuilder: (context,index){
                return  renderRow(dataInfo[index]['title'] ?? '', dataInfo[index]['value'] ?? '');
              }),
          SizedBox(width: 10, height: 5,),
          Image(
              width: double.infinity,
              fit: BoxFit.contain,
              image: AssetImage('assets/images/img_line_dot.png')
          ),
          SizedBox(width: 10, height: 10,),
          renderRow('Tài khoản nguồn', data.refID ?? ''),
        ],
      ),
    );
  }
}

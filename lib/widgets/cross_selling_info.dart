import 'dart:ffi';

import 'package:dnafit_flutter/models/cross_selling.dart';
import 'package:dnafit_flutter/widgets/text_base.dart';
import 'package:flutter/material.dart';

class CrossSellingInfo extends StatefulWidget {

  final CrossSelling data;

  const CrossSellingInfo({super.key, required this.data});

  @override
  State<CrossSellingInfo> createState() => CrossSellingInfoState();
}

class CrossSellingInfoState extends State<CrossSellingInfo> {
  bool active = false;

  String getTitle(){
    if (widget.data.tiedProductCode == CrossSelling.CDS) {
      return 'Tích lũy thêm Chứng chỉ tiền gửi'.toUpperCase();
    } else if (widget.data.tiedProductCode == CrossSelling.SAVING_AC){
      return 'Tích lũy thêm Tiền gửi số'.toUpperCase();
    } else if (widget.data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE){
      return 'Kích hoạt khiên mất tiền mb đền'.toUpperCase();
    }
    return '';
  }

  String getSubTitle(){
    if (widget.data.tiedProductCode == CrossSelling.CDS || widget.data.tiedProductCode == CrossSelling.SAVING_AC) {
      return 'Lãi suất: ${widget.data.interestRate}%/năm';
    } else if (widget.data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE){
      return 'Bảo vệ lên đến 50,000,000 VND';
    }
    return '';
  }

  String getDescription(){
    if (widget.data.tiedProductCode == CrossSelling.CDS) {
      return 'Mua chứng chỉ tiền gửi số, có thể rút từng phần gốc linh hoạt trong thời gian gửi và nhận lãi suất hấp dẫn.';
    } else if (widget.data.tiedProductCode == CrossSelling.SAVING_AC){
      return 'Mở tài khoản tiền gửi linh hoạt, có thể chuyển thêm tiền gốc trong thời gian gửi';
    } else if (widget.data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE){
      return 'Bảo vệ lên đến 50 triệu đồng khi khách hàng mất tiền trong tài khoản thanh toán, thẻ ghi nợ quốc tế, thẻ tín dụng của khách hàng tại MB.';
    }
    return '';
  }

  String getLableEndDate(){
    if (widget.data.tiedProductCode == CrossSelling.CDS || widget.data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE) {
      return 'Ngày đáo hạn:';
    } else if (widget.data.tiedProductCode == CrossSelling.SAVING_AC){
      return 'Ngày hết hạn:';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                color: Color(0xFFEBF3FF)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTitle(),
                      style: TextStyle(
                          color: Color(0xff2E2E2E),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AvenirNext'),
                    ),
                    Text(
                      getSubTitle(),
                      style: TextStyle(
                          color: Color(0xff2E2E2E),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AvenirNext'),
                    )
                  ],
                ),
                Switch(
                  value: active,
                  onChanged: (value) {
                    setState(() {
                      active = value;
                    });
                  },
                  thumbColor: MaterialStateProperty.all<Color>(Colors.white),
                  inactiveTrackColor: Color(0xffcccccc),
                  activeTrackColor: Color(0xff141ED2),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getDescription(),
                  style: TextStyle(
                    color: Color(0xff646464),
                    fontSize: 12,
                    fontFamily: 'AvenirNext',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                InkWell(
                  onTap: (){
                    print('tap...');
                  },
                  child: Text(
                    'Tìm hiểu thêm',
                    style: TextStyle(
                        color: Color(0xff141ED2),
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline),
                  ),
                ),
                if (active == true) Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10, height: 10,),
                    Image(
                        width: double.infinity,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/img_line_dot.png')
                    ),
                    SizedBox(width: 10, height: 10,),
                    Text.rich(
                      TextSpan(
                          text: 'Số tiền: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff2E2E2E),
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: '${widget.data.amountFormat()} VND',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff141ED2),
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(width: 10, height: 10,),
                    Image(
                        width: double.infinity,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/img_line_dot.png')
                    ),
                    SizedBox(width: 10, height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ngày bắt đầu:',
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.data.startDate,
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getLableEndDate(),
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.data.endDate,
                              style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20, height: 10,)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
    );
  }
}

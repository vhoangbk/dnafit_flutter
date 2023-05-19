import 'dart:ffi';

import 'package:dnafit_flutter/widgets/text_base.dart';
import 'package:flutter/material.dart';

class CrossSellingInfo extends StatefulWidget {
  const CrossSellingInfo({super.key});

  @override
  State<CrossSellingInfo> createState() => CrossSellingInfoState();
}

class CrossSellingInfoState extends State<CrossSellingInfo> {
  bool active = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                      'Tích lũy thêm Chứng chỉ tiền gửi'.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xff2E2E2E),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'AvenirNext'),
                    ),
                    Text(
                      'Lãi suất: 8%/năm',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mua chứng chỉ tiền gửi số, có thể rút từng phần gốc linh hoạt trong thời gian gửi và nhận lãi suất hấp dẫn.',
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
                        text: '100,000 VND',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff141ED2),
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]
                  ),
                ),
                if (active == true) Row(
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
                          '17/03/2023',
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
                          'Ngày đáo hạn:',
                          style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '17/09/2023',
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
            ),
          )
        ],
    );
  }
}

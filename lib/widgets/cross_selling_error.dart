import 'dart:ffi';

import 'package:dnafit_flutter/models/cross_selling.dart';
import 'package:dnafit_flutter/widgets/text_base.dart';
import 'package:flutter/material.dart';

class CrossSellingError extends StatelessWidget {
  final CrossSelling data;

  const CrossSellingError({super.key, required this.data});

  String getTitle(){
    if (data.tiedProductCode == CrossSelling.CDS) {
      return 'Mua chứng chỉ tiền gửi thất bại';
    } else if (data.tiedProductCode == CrossSelling.SAVING_AC){
      return 'Mở tài khoản tiền gửi thất bại';
    } else if (data.tiedProductCode == CrossSelling.CYBER_RISK_PURCHASE){
      return 'Đăng ký gói bảo vệ thất bại';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Tap!!!');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xffFEEFEF),
          border: Border.all(
            color: Color(0xffFFCCCC),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(right: 10),
              child: Image(
                  width: 20,
                  height: 20,
                  image: AssetImage('assets/images/icon_error.png')),
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTitle(),
                        style: TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 12,
                          color: Color(0xff4D4D4D),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text.rich(
                        style: TextStyle(
                          color: Color(0xff4D4D4D),
                          fontSize: 12,
                        ),
                        TextSpan(
                            spellOut: true,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'AvenirNext',
                              color: Color(0xff4D4D4D),
                            ),
                            text:
                            'Có lỗi trong quá trình xử lý vui lòng thực hiện lại \n',
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                    color: Color(0xff141ED2),
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontFamily: 'AvenirNext',
                                  ),
                                  text: 'tại đây'),
                            ]),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:dealsdraytest/main.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import "package:http/http.dart" as http;

class verification extends StatefulWidget {
  final String phone;
  const verification({Key? key, required this.phone}) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  TextEditingController otpcontroller = TextEditingController();

  Future<void> verifyOtp(String otp, String phone) async {
    try {
      final response = await http.post(Uri.parse(""), body: {
        "otp": otp,
        "userId": "62b43472c84bb6dac82e0504",
        "deviceId": "62b43547c84bb6dac82e0525",
      });

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else {
        print("else error occured while otp verification");
        print("error is ${response.body}");
      }
    } catch (err) {
      print(
          "catch error occured while verifying the otp and the error is $err");
      throw Exception(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      // body: Column(children: [
      //   Container(
      //     height: 180,
      //     width: 180,
      //     child: Image.asset('assets/images/mobileicon.png')),
      //     SizedBox()

      // ]),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/mobileicon.png')),

            SizedBox(
              height: 30,
            ),
            Text(
              "OTP Verification",
              style: Theme.of(context).textTheme.headline1,
            ),

            SizedBox(
              height: 30,
            ),

            Text(
              "We have sent a unique OTP number to your mobile number",
              style: Theme.of(context).textTheme.subtitle1,
            ),

            SizedBox(height: 16),

            // PinCodeTextField(
            //   appContext: context,
            //   length: 6,
            //   onChanged: (value) {
            //     // Handle code entered
            //   },
            //   validator: (value) {
            //     if (value.length < 6) {
            //       return 'Please enter all 6 digits';
            //     }
            //     return null;
            //   },
            // ),
            PinCodeTextField(
              controller: otpcontroller,
              appContext: context,
              length: 4,
              onChanged: (value) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text('01:57'), // Timer
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                verifyOtp(otpcontroller.text, widget.phone);
              },
              child: Text('SEND AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}

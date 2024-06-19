import 'package:dealsdraytest/login.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController refferalcontroller = TextEditingController();

  // Future<void> registerUser(
  //     String email, String password, String referralcode) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(""),
  //       body: {
  //         "email": email,
  //         "password": password,
  //         "referralCode": referralcode,
  //         "userId": "62a833766ec5dafd6780fc85",
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       print("successfully logged in for the aplication");
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => login()));
  //     }
  //   } catch (err) {
  //     print("catch error occured while trying to register user");
  //     throw Exception(err.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/images/logodd.jpg')),
            ),
            Text(
              "Let's Begin!",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please enter your credentials to proceed",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'Your Email',
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: 'Create Password',
                hintStyle: TextStyle(fontSize: 13),
                suffix: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
            TextField(
              controller: refferalcontroller,
              decoration: InputDecoration(
                hintText: 'Referral Code(Optional)',
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: (){
                    // registerUser(
                    //     emailcontroller.text,
                    //     passwordcontroller.text,
                    //     refferalcontroller.text);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.red.shade400,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

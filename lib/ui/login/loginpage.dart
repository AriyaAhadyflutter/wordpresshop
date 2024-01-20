import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wordpreesapp/api/api_service.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/woocammers/register.dart';
import 'package:wordpreesapp/ui/root/root_page.dart';
import 'package:wordpreesapp/ui/singup/singup.dart';
import 'package:wordpreesapp/ui/utils/custom_appbar.dart';
import 'package:wordpreesapp/ui/utils/custom_dilog_box.dart';
import 'package:wordpreesapp/ui/utils/exstanions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ApiService apiService;
  late CustomerModel customerModel;
  bool apiCalled = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController email =
      TextEditingController(text: 'Ariya96@gmail.com');
  TextEditingController password =
      TextEditingController(text: 'Ariya96@gmail.com');

  @override
  void initState() {
    apiService = ApiService();
    customerModel = CustomerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(appBarText: 'ورود به برنامه'),
          Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Form(
                key: globalKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // ایمیل
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: MyConstantsSC.primarycolor,
                            style: const TextStyle(
                              fontFamily: 'Yekanplus',
                              fontSize: 20,
                              height: 2,
                            ),
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Yekanplus',
                                ),
                                hintTextDirection: TextDirection.ltr,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: MyConstantsSC.primarycolor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                label: Text(
                                  'ایمیل',
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 20,
                                    color: MyConstantsSC.primarycolor,
                                  ),
                                )),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'باید فیلد رو پر کنی';
                              }
                              if (!value!.toString().isValidEmail) {
                                return "ایمیل قوی نیست";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        // پسورد
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            obscureText: hidePassword,
                            controller: password,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: MyConstantsSC.primarycolor,
                            style: const TextStyle(
                              fontFamily: 'Yekanplus',
                              fontSize: 20,
                              height: 2,
                            ),
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                                prefix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (hidePassword == true) {
                                        hidePassword = false;
                                      } else {
                                        hidePassword = true;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Yekanplus',
                                ),
                                hintTextDirection: TextDirection.ltr,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: MyConstantsSC.primarycolor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                label: Text(
                                  'پسورد',
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 20,
                                    color: MyConstantsSC.primarycolor,
                                  ),
                                )),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'باید فیلد رو پر کنی';
                              }

                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyConstantsSC.primarycolor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  setState(() {
                                    apiCalled = true;
                                  });
                                  // debugPrint('${customerModel.toJson()}');

                                  apiService
                                      .loginCustomer(
                                    email.text,
                                    password.text,
                                  )
                                      .then(
                                    (retRes) {
                                      debugPrint(retRes.data!.token);
                                      debugPrint(
                                          retRes.data!.toJson().toString());
                                      setState(() {
                                        apiCalled = false;
                                      });
                                      if (retRes.success!) {
                                        CustomDialogBox.showMassage(
                                          context,
                                          "ورورد موفق",
                                          "ورود موفقیت آمیز بود",
                                          "باشه ",
                                          () {
                                            Navigator.pushReplacement(
                                              context,
                                              PageTransition(
                                                child: const Root(),
                                                type: PageTransitionType
                                                    .leftToRight,
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        CustomDialogBox.showMassage(
                                            context,
                                            "ورورد ناموفق",
                                            "ورود ناموفقیت آمیز بود",
                                            "باشه ", () {
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                "ورود",
                                style: TextStyle(
                                  fontFamily: 'iranSans',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            //
                            const SizedBox(width: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyConstantsSC.primarycolor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const SingUp(),
                                    type: PageTransitionType.leftToRight,
                                  ),
                                );
                              },
                              child: const Text(
                                "اکانت نداری؟",
                                style: TextStyle(
                                  fontFamily: 'iranSans',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        apiCalled
                            ? const Text(
                                '...لطفا منتظر بمانید',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Yekanplus',
                                ),
                              )
                            : const Text(''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

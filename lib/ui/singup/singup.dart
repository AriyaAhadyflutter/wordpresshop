import 'package:flutter/material.dart';
import 'package:wordpreesapp/api/api_service.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/woocammers/register.dart';
import 'package:wordpreesapp/ui/singup/customFilde.dart';
import 'package:wordpreesapp/ui/utils/exstanions.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  late ApiService apiService;
  late CustomerModel customerModel;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool apiCalled = false;
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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyConstantsSC.primarycolor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.close,
                    color: MyConstantsSC.primarycolor,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyConstantsSC.primarycolor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.share,
                    color: MyConstantsSC.primarycolor,
                  ),
                ),
              ],
            ),
          ),
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
                        // نام
                        CustomFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'باید فیلد رو پر کنی';
                            }
                            return null;
                          },
                          initialValue: customerModel.firstName,
                          onChanged: (value) {
                            customerModel.firstName = value;
                          },
                          textDirection: TextDirection.rtl,
                          labelName: 'نام',
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(height: 25),

                        // نام خانوادگی
                        CustomFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'باید فیلد رو پر کنی';
                            }
                            return null;
                          },
                          initialValue: customerModel.lastName,
                          onChanged: (value) {
                            customerModel.lastName = value;
                          },
                          textDirection: TextDirection.rtl,
                          labelName: 'نام خانوادگی',
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(height: 25),

                        //ایمیل
                        CustomFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'باید فیلد رو پر کنی';
                            }
                            if (!value!.toString().isValidEmail) {
                              return 'ایمیل صحیح نیست';
                            }
                            return null;
                          },
                          initialValue: customerModel.email,
                          onChanged: (value) {
                            customerModel.email = value;
                          },
                          textDirection: TextDirection.ltr,
                          labelName: 'ایمیل',
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 25),

                        // پسورد
                        CustomFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'باید فیلد رو پر کنی';
                            } 
                            if (!value!.toString().isValidPassWord){
                              return 'پسورد قوی نیست';
                            }
                            return null;
                          },
                          initialValue: customerModel.password,
                          onChanged: (value) {
                            customerModel.password = value;
                          },
                          textDirection: TextDirection.ltr,
                          labelName: 'پسورد',
                          textInputType: TextInputType.visiblePassword,
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
                                  debugPrint('${customerModel.toJson()}');
                                  apiService.createCustomer(customerModel).then(
                                    (retRes) {
                                      setState(() {
                                        apiCalled = false;
                                      });
                                      if (retRes) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                textAlign: TextAlign.center,
                                                'برنامه ووکامرس',
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontFamily: 'iranSans',
                                                ),
                                              ),
                                              content: Text(
                                                textAlign: TextAlign.center,
                                                'ثبت نام موفقیت آمیز بود',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: MyConstantsSC
                                                      .primarycolor,
                                                  fontFamily: 'yagut',
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'باشه',
                                                    style: TextStyle(
                                                      color: MyConstantsSC
                                                          .primarycolor,
                                                      fontFamily: 'Lalezar',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                textAlign: TextAlign.center,
                                                'برنامه ووکامرس',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'iranSans',
                                                ),
                                              ),
                                              content: const Text(
                                                textAlign: TextAlign.center,
                                                '!! خطا',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontFamily: 'yagut',
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'باشه',
                                                    style: TextStyle(
                                                      color: MyConstantsSC
                                                          .primarycolor,
                                                      fontFamily: 'Lalezar',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'ثبت نام',
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
                              onPressed: () {},
                              child: const Text(
                                'اکانت داری؟',
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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_2/models/model_findPassword.dart';
import 'package:today_my_school_2/pages/login.dart';
import 'package:today_my_school_2/style.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final findPasswordField =
        Provider.of<FindPasswordModel>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => FindPasswordModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.white,
          foregroundColor: ColorPalette.blue,
          title: const Text('비밀번호 변경'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '아이디(학교 웹메일)',
                                    style: TextStyleSet.light13,
                                  ),
                                  SizedBox(
                                    width: 192.w,
                                    height: 64.h,
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (email) {
                                        findPasswordField.setEmail(email);
                                      },
                                      validator: (email) {
                                        if (email!.trim().isEmpty ||
                                            !email.contains('g.kmou.ac.kr')) {
                                          return '학교 웹메일을 입력하세요';
                                        }
                                        return null;
                                      },
                                      style: TextStyleSet.regular15,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        helperText: '',
                                        errorStyle: TextStyleSet.light11
                                            .copyWith(color: ColorPalette.red),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                12, 12, 12, 12),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                            color: ColorPalette.grey,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                            color: ColorPalette.blue,
                                            width: 2,
                                          ),
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                            color: ColorPalette.red,
                                            width: 1,
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                            color: ColorPalette.red,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      cursorColor: ColorPalette.black,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 128.w,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            resetPassword();
                          },
                          child: Text(
                            '확인',
                            style: TextStyleSet.bold16
                                .copyWith(color: ColorPalette.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  Future resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(content: Text('비밀번호 초기화를 메일로 보냈습니다!')));
      } on FirebaseAuthException catch (e) {
        print(e);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(e.message as SnackBar);
      }
    }
  }
}

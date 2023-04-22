import 'package:flutter/material.dart';
import 'package:today_my_school/config/palette.dart';
import 'package:today_my_school/pages/home.dart';
import 'package:today_my_school/pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 높이 제약이 없으면 constraintsError 발생
            children: [
              const Spacer(
                flex: 4,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ID',
                        ),
                        controller: _emailController,
                        validator: (value) {
                          // 여기 value 뒤에 ! 쓰는 거랑 안 쓰는 거랑 머가 다른지...
                          if (value!.isEmpty || !value.contains('kmou.ac.kr')) {
                            return '아이디(웹메일)를 입력하세욧';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'PASSWORD',
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          // 여기 value 뒤에 ! 쓰는 거랑 안 쓰는 거랑 머가 다른지...
                          if (value!.isEmpty) {
                            return '비밀번호를 입력하세욧';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // 여기 currentState 뒤에 ! 쓰는 거랑 안 쓰는 거랑 머가 다른지...
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.pointColor),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      color: Palette.baseColor1,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

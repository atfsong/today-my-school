import 'package:flutter/material.dart';
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
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ID',
                          ),
                          controller: _emailController,
                          validator: (value) {
                            // 여기 value 뒤에 ! 쓰는 거랑 안 쓰는 거랑 머가 다른지...
                            if (value!.isEmpty ||
                                !value.contains('kmou.ac.kr')) {
                              return '아이디(웹메일)를 입력하세욧';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextFormField(
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
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
                          backgroundColor: Colors.grey),
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '시설 이용 주의 사항',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '원활한 시설 이용을 위해 정확한 예약 날짜와 시간, 장소를 확인해 주세요.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '이용 시간을 준수하고, 이용 후 자리를 깨끗이 정리해 주세요.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

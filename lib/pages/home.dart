import 'package:flutter/material.dart';
import 'package:today_my_school/pages/choose_room.dart';
import 'package:today_my_school/pages/reservations.dart';
import 'package:today_my_school/pages/user_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Icon(
                    Icons.account_circle,
                    size: 130,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '자스민',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'abc123@kmou.ac.kr',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '010-1234-5678',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChooseRoomPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 7,
                          ),
                          child: const Text(
                            '예약하기',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReservationsPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 7,
                          ),
                          child: const Text(
                            '예약 확인',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () => null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 7,
                          ),
                          child: const Text(
                            '예약하기',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserInfoPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 7,
                          ),
                          child: const Text(
                            '예약 확인',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedAmount = 1000;

  final List<int> amounts = [
    1000,
    5000,
    10000,
    50000,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "금액 선택",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...amounts.map((amount) {
              return RadioListTile<int>(
                value: amount,
                groupValue: selectedAmount,
                title: Text("${amount.toString()}원"),
                onChanged: (value) {
                  setState(() {
                    selectedAmount = value!;
                  });
                },
              );
            }),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text("💳 결제하기"),
              ),
            ),

            const SizedBox(height: 30),

            const Divider(),

            const Text(
              "결제 상태",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text("아직 결제하지 않았습니다."),

            const SizedBox(height: 25),

            const Divider(),

            const Text(
              "결제 기록",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Expanded(
              child: Center(
                child: Text("아직 결제 기록이 없습니다."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
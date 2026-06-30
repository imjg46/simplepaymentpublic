import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/payment_history.dart';
import '../services/history_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HistoryService historyService = HistoryService();

  int selectedAmount = 1000;

  final List<int> amounts = [
    1000,
    5000,
    10000,
    50000,
  ];

  List<PaymentHistory> history = [];

  bool isLoading = true;

  String status = "아직 응원하지 않았습니다.";

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    history = await historyService.loadHistory();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> support() async {
    await historyService.addHistory(selectedAmount);

    history = await historyService.loadHistory();

    setState(() {
      status = "❤️ 감사합니다!";
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${NumberFormat('#,###').format(selectedAmount)}원 응원 감사합니다 ❤️"),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat(
      "yyyy-MM-dd HH:mm",
    ).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support App"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Center(
                  child: Image.asset(
                    "assets/character.jpeg",
                    width: 180,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "응원 금액",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...amounts.map(
                  (amount) => RadioListTile<int>(
                    value: amount,
                    groupValue: selectedAmount,
                    title: Text(
                      "${NumberFormat('#,###').format(amount)}원",
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedAmount = value!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 10),

                FilledButton.icon(
                  onPressed: support,
                  icon: const Icon(Icons.favorite),
                  label: const Text("응원하기"),
                ),

                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 12),

                const Text(
                  "응원 상태",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 12),

                const Text(
                  "응원 기록",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                if (history.isEmpty)

                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text(
                        "아직 응원 기록이 없습니다.",
                      ),
                    ),
                  )

                else

                  ...history.map(
                    (item) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        title: Text(
                          "${NumberFormat('#,###').format(item.amount)}원",
                        ),
                        subtitle: Text(
                          formatDate(item.date),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
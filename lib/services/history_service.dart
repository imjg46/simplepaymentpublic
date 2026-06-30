import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/payment_history.dart';

class HistoryService {
  static const String _storageKey = "support_history";

    Future<List<PaymentHistory>> loadHistory() async {
        final prefs = await SharedPreferences.getInstance();

            final data = prefs.getStringList(_storageKey) ?? [];

                return data
                        .map(
                                  (e) => PaymentHistory.fromJson(
                                              jsonDecode(e),
                                                        ),
                                                                )
                                                                        .toList();
                                                                          }

                                                                            Future<void> addHistory(int amount) async {
                                                                                final prefs = await SharedPreferences.getInstance();

                                                                                    final data = prefs.getStringList(_storageKey) ?? [];

                                                                                        final history = PaymentHistory(
                                                                                              amount: amount,
                                                                                                    date: DateTime.now(),
                                                                                                        );

                                                                                                            data.insert(
                                                                                                                  0,
                                                                                                                        jsonEncode(history.toJson()),
                                                                                                                            );

                                                                                                                                await prefs.setStringList(
                                                                                                                                      _storageKey,
                                                                                                                                            data,
                                                                                                                                                );
                                                                                                                                                  }

                                                                                                                                                    Future<void> clearHistory() async {
                                                                                                                                                        final prefs = await SharedPreferences.getInstance();

                                                                                                                                                            await prefs.remove(_storageKey);
                                                                                                                                                        }
                                }
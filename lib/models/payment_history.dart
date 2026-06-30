class PaymentHistory {
  final int amount;
  final DateTime date;

  const PaymentHistory({
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }
}
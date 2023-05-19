class Transaction {
  final String title;
  final String id;
  final double value;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.id,
      required this.value,
      required this.date});
}

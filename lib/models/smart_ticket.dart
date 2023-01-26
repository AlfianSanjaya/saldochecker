class SmartTicket {
  final int timestamp;
  final int value;

  SmartTicket(
    this.timestamp,
    this.value,
  );

  SmartTicket.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        value = json['value'];
}

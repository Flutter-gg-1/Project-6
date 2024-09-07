class Reservation {
  int id;
  int userId;
  int roomId;
  String date;
  int numNights;

  Reservation({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.date,
    required this.numNights,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      userId: json['userId'],
      roomId: json['roomId'],
      date: json['date'],
      numNights: json['numNights'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'roomId': roomId,
        'date': date,
        'numNights': numNights
      };
}

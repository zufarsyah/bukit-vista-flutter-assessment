// To parse this JSON data, do
//
//     final guestList = guestListFromJson(jsonString);

import 'dart:convert';

class GuestList {
  GuestList({
    required this.guests,
  });

  List<Guest>? guests;

  factory GuestList.fromRawJson(String str) =>
      GuestList.fromJson(json.decode(str));

  factory GuestList.fromJson(Map<String, dynamic> json) => GuestList(
        guests: json["guests"] == null
            ? null
            : List<Guest>.from(json["guests"].map((x) => Guest.fromJson(x))),
      );
}

class Guest {
  Guest({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.location,
    required this.email,
    required this.phoneNumber,
    required this.guestSince,
    required this.bookings,
  });

  String? id;
  String? name;
  String? avatarUrl;
  String? location;
  String? email;
  String? phoneNumber;
  DateTime? guestSince;
  List<Booking>? bookings;

  factory Guest.fromRawJson(String str) => Guest.fromJson(json.decode(str));

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        avatarUrl: json["avatar_url"],
        location: json["location"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        guestSince: json["guest_since"] == null
            ? null
            : DateTime.parse(json["guest_since"]),
        bookings: json["bookings"] == null
            ? null
            : List<Booking>.from(
                json["bookings"].map((x) => Booking.fromJson(x))),
      );
}

class Booking {
  Booking({
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.numOfNight,
    required this.numOfGuest,
    required this.phoneNumber,
    required this.value,
    required this.host,
    required this.profileName,
    required this.propertyUnit,
    required this.listingName,
  });

  String? id;
  DateTime? checkIn;
  DateTime? checkOut;
  String? status;
  int? numOfNight;
  int? numOfGuest;
  String? phoneNumber;
  double? value;
  String? host;
  String? profileName;
  String? propertyUnit;
  String? listingName;

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        checkIn:
            json["check_in"] == null ? null : DateTime.parse(json["check_in"]),
        checkOut: json["check_out"] == null
            ? null
            : DateTime.parse(json["check_out"]),
        status: json["status"],
        numOfNight: json["num_of_night"],
        numOfGuest: json["num_of_guest"],
        phoneNumber: json["phone_number"],
        value: json["value"] == null ? null : json["value"].toDouble(),
        host: json["host"],
        profileName: json["profile_name"],
        propertyUnit: json["property_unit"],
        listingName: json["listing_name"],
      );
}

class User {
  final bool success;
  final String msg;
  final Officer officer;
  final Client client;

  User({
    required this.success,
    required this.msg,
    required this.officer,
    required this.client,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        msg: json["msg"],
        officer: Officer.fromJson(json["officer"]),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "officer": officer.toJson(),
        "client": client.toJson(),
      };
}

class Client {
  final int id;
  final String clientAlias;
  final int clientIntroId;
  final int clientIdenId;
  final DateTime joinedDate;
  final dynamic cleintName;
  final String clientAddress;
  final String clientContact;
  final bool status;
  final dynamic remarks;
  final int insertUser;
  final DateTime insertDate;
  final int editUser;
  final DateTime editDate;

  Client({
    required this.id,
    required this.clientAlias,
    required this.clientIntroId,
    required this.clientIdenId,
    required this.joinedDate,
    required this.cleintName,
    required this.clientAddress,
    required this.clientContact,
    required this.status,
    required this.remarks,
    required this.insertUser,
    required this.insertDate,
    required this.editUser,
    required this.editDate,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        clientAlias: json["client_alias"],
        clientIntroId: json["client_intro_id"],
        clientIdenId: json["client_iden_id"],
        joinedDate: DateTime.parse(json["joined_date"]),
        cleintName: json["cleint_name"],
        clientAddress: json["client_address"],
        clientContact: json["client_contact"],
        status: json["status"],
        remarks: json["remarks"],
        insertUser: json["insert_user"],
        insertDate: DateTime.parse(json["insert_date"]),
        editUser: json["edit_user"],
        editDate: DateTime.parse(json["edit_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_alias": clientAlias,
        "client_intro_id": clientIntroId,
        "client_iden_id": clientIdenId,
        "joined_date": joinedDate.toIso8601String(),
        "cleint_name": cleintName,
        "client_address": clientAddress,
        "client_contact": clientContact,
        "status": status,
        "remarks": remarks,
        "insert_user": insertUser,
        "insert_date": insertDate.toIso8601String(),
        "edit_user": editUser,
        "edit_date": editDate.toIso8601String(),
      };
}

class Officer {
  final String id;
  final int clientId;
  final int fieldOfficerId;
  final int brId;
  final String brAlias;
  final String fullName;
  final String contactNumber;
  final String userName;
  final String passwordSalt;
  final String passwordHash;
  final bool status;
  final String remarks;
  final int insertUser;
  final DateTime insertDate;
  final int editUser;
  final DateTime editDate;

  Officer({
    required this.id,
    required this.clientId,
    required this.fieldOfficerId,
    required this.brId,
    required this.brAlias,
    required this.fullName,
    required this.contactNumber,
    required this.userName,
    required this.passwordSalt,
    required this.passwordHash,
    required this.status,
    required this.remarks,
    required this.insertUser,
    required this.insertDate,
    required this.editUser,
    required this.editDate,
  });

  factory Officer.fromJson(Map<String, dynamic> json) => Officer(
        id: json["id"],
        clientId: json["client_id"],
        fieldOfficerId: json["field_officer_id"],
        brId: json["br_id"],
        brAlias: json["br_alias"],
        fullName: json["full_name"],
        contactNumber: json["contact_number"],
        userName: json["user_name"],
        passwordSalt: json["password_salt"],
        passwordHash: json["password_hash"],
        status: json["status"],
        remarks: json["remarks"],
        insertUser: json["insert_user"],
        insertDate: DateTime.parse(json["insert_date"]),
        editUser: json["edit_user"],
        editDate: DateTime.parse(json["edit_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clientId,
        "field_officer_id": fieldOfficerId,
        "br_id": brId,
        "br_alias": brAlias,
        "full_name": fullName,
        "contact_number": contactNumber,
        "user_name": userName,
        "password_salt": passwordSalt,
        "password_hash": passwordHash,
        "status": status,
        "remarks": remarks,
        "insert_user": insertUser,
        "insert_date": insertDate.toIso8601String(),
        "edit_user": editUser,
        "edit_date": editDate.toIso8601String(),
      };
}

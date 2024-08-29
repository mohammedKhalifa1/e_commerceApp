class AccountModel {
  int? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  int? usersAproved;

  AccountModel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersAproved});

  AccountModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersAproved = json['users_aproved'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['users_id'] = this.usersId;
  //   data['users_name'] = this.usersName;
  //   data['users_password'] = this.usersPassword;
  //   data['users_email'] = this.usersEmail;
  //   data['users_aproved'] = this.usersAproved;
  //   return data;
  // }
}

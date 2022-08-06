class AuthResponseModel {
  bool? _success;
  String? _token;

  AuthResponseModel(this._success, this._token);
  bool get success=>this.success;
  String get token=>this.token;



  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['token'] = this._token;
    return data;
  }
}

class Note {

  int _id;
  String _title;
  String _description;
  String _date;
  var _priority;
  String _name;
  String _email;
  String _password;
  var _telephoneno;
  var _aadhar;



  Note(this._title, this._date, this._priority,this._name,this._password,this._email,this._aadhar,this._telephoneno, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,this._email,this._name,this._aadhar,this._password,this._telephoneno,[this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  String get name => _name;

  String get email => _email;

  String get password => _password;

  String get telephone_no => _telephoneno;

  String get Aadhar => _aadhar;




  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set name(String newName){
    if(newName.length<=255){
      this._name = newName;
    }
  }
  set email(String newEmail){
    // if(newEmail.contains('@gmail.com')){
    //
    // }
    this._email = newEmail;
  }

  set password(String newPassword){
    this._password = newPassword;
  }

  set telephoneno(String newTelephoneno){
    // if(newTelephoneno.toString().length == 10){
    // }
    this._telephoneno = newTelephoneno;
  }

  set Aadhar(String newAadhar){
    // if(newAadhar.length == 12){
    //
    // }
    this._aadhar = newAadhar;
  }


  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['Aadhar'] = _aadhar;
    map['telephone_no'] = _telephoneno;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
    this._name = map['name'];
    this._email = map['email'];
    this._password = map['password'];
    this._aadhar = map['Aadhar'];
    this._telephoneno = map['telephone_no'];
  }
}
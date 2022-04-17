class Mainclass{
  int page;
  int per_page;
  int total;
  int total_pages;
  List<Datam> data;
  Support support;
  Mainclass({this.data,this.page,this.per_page,this.support,this.total,this.total_pages});
  factory Mainclass.fromJson(Map<String,dynamic>parsedjson)
  {
    return Mainclass
      (
      page: parsedjson['page'],
      per_page: parsedjson['per_page'],
      total: parsedjson['total'],
      total_pages: parsedjson['total_pages'],
      support: Support.fromJson(parsedjson["support"]),
      data: List<Datam>.from(parsedjson["data"].map((x) => Datam.fromJson(x))),
    );
  }
}
class Datam{
  int id;
  String email;
  String first_name;
  String last_name;
  Datam({this.id,this.email,this.first_name,this.last_name});
  factory Datam.fromJson(Map<String,dynamic>parsedjson)
  {
    return Datam(
        id: parsedjson['id'],
        email: parsedjson['email'],
        first_name: parsedjson['first_name'],
        last_name: parsedjson['last_name']
    );
  }
}
class Support{
  String url;
  String text;
  Support({this.url,this.text});
  factory Support.fromJson(Map<String,dynamic>parsedjson)
  {
    return Support(
        url: parsedjson['url'],
        text: parsedjson['text']
    );
  }
}
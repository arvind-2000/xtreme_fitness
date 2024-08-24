class User{
 String uid;
 String name;
 String phone;
String username;
 Role roleid;
  User( {required this.uid, required this.name, required this.phone, required this.username,required this.roleid,});
}

class Role {
final String roleid;
final String rolename;

  Role({required this.roleid, required this.rolename});

}

class Xtremer extends User{
 bool isactive;
 String doctorname;
 String doctorsurgeryno;
String doctorsurgeryname;

 String emergencyname;
 String emergencycontact;
String emergencyrelation;


String? occupation;
String? homephone;
String? postalcode;
String? address;

  Xtremer({required this.doctorname,required this.doctorsurgeryno,required this.doctorsurgeryname,required this.emergencyname,required this.emergencycontact,required this.emergencyrelation,this.homephone,this.occupation,this.address,required super.uid, required super.name, required super.phone, required super.username, required super.roleid,required this.isactive, });

}



class Staff extends User{
  final bool isactive;
  Staff({required super.uid, required super.name, required super.phone, required super.username, required super.roleid,required this.isactive, });

}
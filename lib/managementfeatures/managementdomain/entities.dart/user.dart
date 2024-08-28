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





class Staff extends User{
  final bool isactive;
  Staff({required super.uid, required super.name, required super.phone, required super.username, required super.roleid,required this.isactive, });

}
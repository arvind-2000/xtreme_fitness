

String dateFormat(DateTime date){
return date.toIso8601String();
}
String responseCode(int val){
  if(val==1){
    return "Successful";
  }else if(val==2){
    return "No User registerd with this email";
  } else if(val==0){
    return "Error with the connection";
  }else{
    return "Error with the server";
  }
}

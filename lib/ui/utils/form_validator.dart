String? passwordValidator(String? input){
  if(input!.length<6){
    return "password must be 6 character long";
  }
}
import '../config/regex.dart';
import '../domain/domainusecases.dart';

class AuthenticateUseCases implements AuthUseCases {
  @override
  String? emailAuth(String data, String hint) {
    if (data.trim().isEmpty) {
      return "Email empty";
    }

    // log(' email authentication ${email.hasMatch(data)}');
    return email.hasMatch(data) ? null : "Email should XX@XXXXX.XXX";
  }

  @override
  String? passwordAuth(String data) {
    if (data.trim().length < 5 || data.trim().length > 10) {
      return "Password must be between 8  to 10 characters.";
    }
    return null;
    // log(' password auth ${passregex.hasMatch(data)}');
    //  return passregex.hasMatch(data)?null:"should contain alphanumeric, special characters";
  }

  @override
  String? nameAuth(String name, String hint) {
    if (name.trim().isEmpty) {
      return "$hint is  empty";
    } else {
      if (hint == "Address") {
        print('addresssss');
        return addressregex.hasMatch(name)
            ? null
            : "Name must be alphabet or must be less than 40 characters";
      } else {
        return nameregex.hasMatch(name)
            ? null
            : "Name must be alphabet or must be less than 20 characters";
      }
    }
  }

  @override
  String? phoneAuth(String phone, String hint) {
    if (phone.trim().isEmpty) {
      return "$hint is empty";
    }
    return phoneregex.hasMatch(phone) ? null : "Phone must have 10 digits";
  }

  @override
  String? forgotpassOTP(String otp, String mins) {
    return "MOBEDS: One-time-Password (OTP) to access the MOBEDS Recruitment Portal is $otp valid till $mins mins. CubeTen technologies";
  }

  @override
  String? registerOTP(String otp, String mins) {
    return "MOBEDS: One-time-Password (OTP) to access the MOBEDS Recruitment Portal is $otp valid till 5 mins. CubeTen technologies";
  }

  @override
  String? pincodeauth(String pincode, String hint) {
    if (pincode.trim().isEmpty) {
      return "$hint is empty";
    }
    return pinregex.hasMatch(pincode) ? null : "Pincode must be 6 digits";
  }
}

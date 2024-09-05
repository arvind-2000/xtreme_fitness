RegExp email = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}\$");
RegExp usernameregex = RegExp("^[a-zA-Z0-9.-]{2,10}\$");
// RegExp nameregex = RegExp("^([a-z])*[a-z\\s]+\$");
RegExp nameregex = RegExp("^[a-zA-Z ]{2,20}\$");
RegExp phoneregex = RegExp("^[0-9]{10}\$");
RegExp pinregex = RegExp("^[0-9]{6}\$");
RegExp passregex = RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&-+=()])(?=\\S+\$){5, 20}\$");
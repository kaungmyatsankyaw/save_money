import 'package:app/constant/valuse.dart';
import 'package:app/utility/custom_hash.dart';
import 'package:app/utility/prefer.dart';
import 'package:app/utility/secure_storage.dart';
import 'package:flutter/material.dart';

class PassCodeProvider extends ChangeNotifier {
  var passCode = '';
  var passCodeConfirm = '';
  var isFirst = true;
  var isSecond = false;
  var showPassCode = '';
  var error = '';
  var isSetPassCode = false;

  init() async {
    var isSet = await Perferences.getPrefBool(key: StringValues.setPassCode);

    if (isSet == null)
      setIsSetPassCode(false);
    else
      setIsSetPassCode(true);
  }

  /// Getter & Setter IsSetPassCode
  get getIsSetPassCode => isSetPassCode;
  setIsSetPassCode(isSet) {
    isSetPassCode = isSet;
    notifyListeners();
  }

  ///Getter & Setter Error
  get getError => error;
  setError(err) {
    error = err;
    notifyListeners();
  }

  /// Getter & Setter ShowPassCode
  get getShowPassCode => showPassCode.split('');
  setShowPassCode(code) {
    showPassCode = code;
    notifyListeners();
  }

  /// Getter & Setter For First Str ( Passcode )
  get getIsFirst => isFirst;
  setIsFirst(bool first) {
    isFirst = first;
  }

  /// Getter & Setter For Second Str ( Passcode Confirm )
  get getIsSecond => isSecond;
  setIsSecond(bool first) {
    isSecond = first;
  }

// Getter For Passcode
  get getPassCode => passCode;

  // Reset Passcode
  resetPassCode() {
    passCode = '';
  }

// Reset Passcode Confirm
  resetPassCodeConfirm() {
    passCodeConfirm = '';
  }

// Set Passcode and Passcode Confirm
  setPassCode(context, {required code}) {
    if (getIsFirst && passCode.length < 6) {
      passCode += code;
      setShowPassCode(passCode);
    } else if (getIsFirst && passCode.length == 6) {
      setShowPassCode('');
      setIsFirst(false);
      setIsSecond(true);

      passCodeConfirm += code;
      setShowPassCode(passCodeConfirm);
    } else if (getIsSecond && passCodeConfirm.length < 6) {
      setIsSecond(true);

      passCodeConfirm += code;
      setShowPassCode(passCodeConfirm);

      if (passCode.length == 6 && passCodeConfirm.length == 6) {
        if (passCode == passCodeConfirm) {
          var hashCode = CustomHash.hashPassword(str: passCode);
          SecureStorage.write(key: StringValues.passCode, value: hashCode);
          Perferences.setPrefBool(key: StringValues.setPassCode, value: true);
          setError('');
          setIsFirst(false);
          setIsSecond(false);
          setIsSetPassCode(true);

          // Get.back(result: 'Set Passcode Success');
          Navigator.of(context).pop('Set Passcode Success');
        } else {
          setIsFirst(true);
          setIsSecond(false);
          setError('Passcod and Confirm Passcode Not Equal !!');
          passCode = '';
          passCodeConfirm = '';
        }
        passCode = '';
        passCodeConfirm = '';
      }
    }
  }

  removeCode() {
    passCode = '';
    passCodeConfirm = '';
    setShowPassCode('');
    setIsFirst(true);
    setIsSecond(false);
    setError('');
  }

  clearPassCode() async {
    await Perferences.removeFromPref(key: StringValues.setPassCode);

    await SecureStorage.delete(key: StringValues.passCode);
    setIsSetPassCode(false);
  }
}

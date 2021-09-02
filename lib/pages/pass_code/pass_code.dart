import 'dart:async';
import 'package:app/constant/valuse.dart';
import 'package:app/utility/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sodium/flutter_sodium.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/passcode_screen.dart';

class PassCodeScreen extends StatefulWidget {
  @override
  _PassCodeScreenState createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  var passCode;
  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      passCode = await SecureStorage.read(key: StringValues.passCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasscodeScreen(
        title: Text(
          'Enter Passcode',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),

        passwordEnteredCallback: _passcodeEntered,
        cancelButton: Text(
          'Cancel',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          semanticsLabel: 'Cancel',
        ),
        deleteButton: Text(
          'Delete',
          style: const TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Delete',
        ),
        shouldTriggerVerification: _verificationNotifier.stream,
        backgroundColor: Colors.black.withOpacity(0.8),
        cancelCallback: _passcodeCancelled,
        // digits: digits,
        passwordDigits: 6,

        // bottomWidget: _passcodeRestoreButton(),
      ),
    );
  }

  _passcodeEntered(String enteredPasscode) {
    bool isValid = PasswordHash.verifyStorage(passCode, enteredPasscode);
    _verificationNotifier.add(isValid);
    if (isValid) {
      Future.delayed(Duration.zero, () {
        Get.offNamed('/home');
      });
    }
  }

  _passcodeCancelled() {
    Navigator.maybePop(context);
  }
}

import 'package:flutter/material.dart';

///* Neue Print-Methoden (Farbig)
void printHint(String text) => print("\x1B[32m HINT: \x1B[37m$text\x1B[0m");
void printWarning(String text) => print("\x1B[33m WARN: \x1B[37m$text\x1B[0m");
void printError(String text) => print("\x1B[31m ERROR: \x1B[37m$text\x1B[0m");

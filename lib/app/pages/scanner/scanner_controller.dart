import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

/// Scanner Controller
class ScannerController extends Controller {

  BuildContext? _context;

  void back() {
    Navigator.of(_context!).pop();
  }

  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
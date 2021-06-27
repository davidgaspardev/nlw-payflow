import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';
import 'package:payflow/app/pages/scanner/scanner_page.dart';

class HomeController extends Controller {

  BuildContext? _context;

  void myInvoices() {
    // TODO: Update page to show all
  }

  void toScan() {
    Navigator.pushNamed(_context!, ScannerPage.routeName);
  }

  void myExtracts() {
    // TODO: Update page to show only extracts
  }

  // ==================== OVERRIDE ==================== //
  
  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() {

  }
}
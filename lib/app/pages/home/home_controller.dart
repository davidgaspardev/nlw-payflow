import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

class HomeController extends Controller {

  BuildContext? _context;

  void myInvoices() {
    // TODO: Update page to show all
  }

  void toScan() {
    // TODO: Navigate to scanner page
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
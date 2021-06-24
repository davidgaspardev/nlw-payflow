import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

class HomeController extends Controller {

  BuildContext? _context;

  // ==================== OVERRIDE ==================== //
  
  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() {

  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/presentation/simple_news.dart';

void main() => runApp(const ProviderScope(child: SimpleNews()));

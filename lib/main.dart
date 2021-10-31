import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));

//todo Caminhos infelizes PostBloc
//todo tratar melhor os erros do Dio
//todo testar LocalDtasource
//todo testar caminhos felizes e infelizes do CacheBloc

//duvidas>
// preciso ajustar o contrato do datasource local?
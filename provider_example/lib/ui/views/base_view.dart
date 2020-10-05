import 'package:flutter/material.dart';
import 'package:provider_example/app/service_locator.dart';
import 'package:provider_example/core/viewmodels/base_model.dart';

import 'package:provider/provider.dart';

/// View comun a todas las View de la arquitectura seguida en:
/// https://www.filledstacks.com/post/flutter-architecture-my-provider-implementation-guide
class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({@required this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  // para que se haga dispose de la vista sin que salte error
  // TODO: revisar que esto funciona
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}

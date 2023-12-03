import 'package:flutter/material.dart';
import 'package:ready_structure/core/constant/images_path.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../app_localization/app_localization.dart';
import '../state/cubit_state.dart';
import '../widgets/images/png_image.dart';
import '../widgets/rounded_animated_button.dart';

class GeneralErrorWidget extends StatefulWidget {
  final VoidCallback? callback;
  final Widget? body;
  final bool centerContent;
  final String message;

  const GeneralErrorWidget({
    Key? key,
    required this.message,
    this.callback,
    this.body,
    this.centerContent = true,
  }) : super(key: key);

  factory GeneralErrorWidget.fromError({
    required ErrorResource error,
    bool withBody = true,
    VoidCallback? callback,
  }) {
    Widget body;

    body = const PngImageAsset(
      ImagesPath.generalError,
      fit: BoxFit.fill,
    );

    return GeneralErrorWidget(
      message: error.error ?? AppLocalize.gen.seem_it_has_connection_error,
      callback: callback,
      centerContent: true,
      body: withBody ? SizedBox(width: 210, height: 210, child: body) : null,
    );
  }

  @override
  _GeneralErrorWidgetState createState() => _GeneralErrorWidgetState();
}

class _GeneralErrorWidgetState extends State<GeneralErrorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisAlignment: widget.centerContent
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (widget.body != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: widget.body!,
              ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: Styles.font14PrimaryColorWeight500(),
            ),
            const SizedBox(height: 24),
            if (widget.callback != null)
              RoundedAnimatedButton(
                text: AppLocalize.gen.retry,
                isActive: widget.callback != null,
                onPressed: widget.callback,
              ),
          ],
        ),
      ),
    );
  }
}

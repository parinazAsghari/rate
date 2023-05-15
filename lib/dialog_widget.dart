
import 'package:flutter/material.dart';
class MessageDialogWidget extends StatelessWidget {
  const MessageDialogWidget(
  {Key? key,
  this.title,
  this.body,
  this.dismissible,
  this.widget,
  this.borderRadius = 16.0,
  this.height = 240,
  this.width = 320,
  this.isSingleActionButton = true,
  this.cancelText,
  this.positiveTxt,
  this.cancelFunc,
  this.positiveFunc,
  this.cancelDismissibleFunction})
      : super(key: key);

  final String? title;
  final String? body;
  final bool? dismissible;
  final Widget? widget;
  final double borderRadius;
  final double? height;
  final double? width;
  final bool? isSingleActionButton;
  final String? positiveTxt;
  final String? cancelText;
  final Function? positiveFunc;
  final Function? cancelFunc;
  final Function? cancelDismissibleFunction;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() {
          if (dismissible ?? false) {
            if (cancelDismissibleFunction != null) {
              cancelDismissibleFunction!();
            }
            return dismissible ?? false;
          } else {
            return dismissible ?? false;
          }
        });
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        actions: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop(null);
                  if (positiveFunc != null) {
                    positiveFunc!();
                  }
                },
                child: Container(
                  height: 40,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color:Colors.red),
                  margin: const EdgeInsets.only(
                      left: 20, top: 0, right: 20, bottom: 10),
                  child: Text(
                    positiveTxt ?? 'تایید',
                    style: TextStyle(color: Theme.of(context).cardColor),
                  ),
                ),
              ),
              if (isSingleActionButton == false) const Spacer(),
              if (isSingleActionButton == false)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop(null);
                    if (cancelFunc != null) {
                      cancelFunc!();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color:Colors.red),
                    margin: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 10),
                    child: Text(
                      cancelText ?? 'انصراف',
                      style: TextStyle(color: Theme.of(context).cardColor),
                    ),
                  ),
                ),
              const Spacer(),
            ],
          )
        ],
        content: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                dismissible ?? false
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 64,),
                      Expanded(
                        child: Center(
                          child: Text(
                            title ?? '',
                            style:
                            Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 64,
                        child: GestureDetector(
                          onTap: () {
                            if (cancelDismissibleFunction != null) {
                              cancelDismissibleFunction!();
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsetsDirectional.only(
                                top: 8, end: 8),
                            alignment: AlignmentDirectional.topEnd,
                            child: const CircleAvatar(
                              radius: 11,
                              backgroundColor:
                              Colors.red,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : SizedBox(height: 128,),
                if (widget == null)
                  Center(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsetsDirectional.only(
                        top: 10,
                      ),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(body ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                if (widget != null) widget!,
                Container(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



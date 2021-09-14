import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/feature/places/widgets/places_shimmer.dart';
import 'package:unnoficial_kitsu_client/resources/resources.dart';
import 'package:unnoficial_kitsu_client/utills/widget/primary_button.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StateHandleWidget extends StatefulWidget {
  final bool typeList;
  final bool visibleOnEmpty;
  final bool visibleOnError;
  final bool emptyEnabled;
  final bool loadingEnabled;
  final bool errorEnabled;
  final bool loadingCoverBody;
  final Widget body;
  final Widget? shimmerView;
  final String? errorText;
  final String? emptyTitle;
  final String? emptySubtitle;
  final bool showShimmer;
  final ImageProvider? emptyImage;
  final void Function()? onRetryPressed;

  const StateHandleWidget({
    Key? key,
    required this.body,
    this.emptyImage,
    this.emptyTitle,
    this.emptySubtitle,
    this.errorText,
    this.onRetryPressed,
    this.shimmerView,
    this.showShimmer = false,
    this.emptyEnabled = false,
    this.loadingEnabled = false,
    this.errorEnabled = false,
    this.loadingCoverBody = true,
    this.visibleOnEmpty = true,
    this.visibleOnError = true,
    this.typeList = true,
  }) : super(key: key);

  @override
  _StateHandleWidgetState createState() => _StateHandleWidgetState();
}

class _StateHandleWidgetState extends State<StateHandleWidget> {
  @override
  Widget build(BuildContext context) {
    var loadingWidget =
        widget.shimmerView ?? IgnorePointer(child: PlacesShimmer());

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: widget.loadingEnabled ||
                  ((widget.emptyEnabled ||
                          (widget.errorEnabled && widget.emptyEnabled)) &&
                      !widget.typeList)
              ? 0.0
              : 1.0,
          duration: Duration(
              milliseconds: widget.loadingEnabled
                  ? 200
                  : widget.errorEnabled || widget.emptyEnabled
                      ? 200
                      : 1000),
          child: getBodyWidget(),
        ),
        getErrorView(),
        getEmptyView(),
        getLoadingView(loadingWidget),
      ],
    );
  }

  Widget getBodyWidget() => ((widget.emptyEnabled && !widget.visibleOnEmpty) ||
          (widget.errorEnabled && !widget.visibleOnError))
      ? Container()
      : widget.body;

  Widget getLoadingView(Widget loadingWidget) => widget.loadingEnabled
      ? Center(
          child: AnimatedOpacity(
              opacity: widget.loadingEnabled ? 1.0 : 0.0,
              duration:
                  Duration(milliseconds: widget.loadingEnabled ? 500 : 500),
              child: loadingWidget),
        )
      : Container();

  bool get isList => widget.typeList ? widget.emptyEnabled : true;

  Widget getErrorView() =>
      widget.visibleOnError && widget.errorEnabled && isList
          ? buildError(widget.errorText, context)
          : Container();

  Widget getEmptyView() => widget.visibleOnEmpty &&
          widget.emptyEnabled &&
          !widget.errorEnabled &&
          !widget.loadingEnabled
      ? buildEmpty(context)
      : Container();

  Widget buildEmpty(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120.sp,
              width: 120.sp,
              alignment: Alignment.center,
              child: Image(
                image: widget.emptyImage ?? Resources.images.imageEmpty,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              widget.emptyTitle ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 6.sp,
            ),
            Text(
              widget.emptySubtitle ?? '',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget buildError(String? error, BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.sp),
            Container(
              height: 80.sp,
              width: 89.sp,
              alignment: Alignment.center,
              child: Image(
                image: Resources.images.imageError,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 24.sp,
            ),
            Container(
              alignment: Alignment.center,
              child: error != null
                  ? Text(
                      error.isEmpty ? 'txt_error_general'.tr : error,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Resources.color.black,
                          ),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
            ),
            if (widget.onRetryPressed != null)
              SizedBox(
                height: 24.sp,
              ),
            if (widget.onRetryPressed != null)
              PrimaryButton(
                child: Text(
                  'txt_button_retry'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(fontSize: 12.sp),
                ),
                marginHorizontal: (MediaQuery.of(context).size.width / 5).sp,
                height: 28.sp,
                onPressed: widget.onRetryPressed,
              ),
          ],
        ),
      );
}

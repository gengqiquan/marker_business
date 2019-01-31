import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///auther:gengqiquan
///date:2019/1/30
///description:LoadingView

class LoadingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoadingViewState();
  final bool state;

  LoadingView({@required this.state});
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return new Visibility(
        visible: widget.state,
        child: new Center(
          child: SpinKitCircle(
            color: Colors.blueAccent,
          ),
        ));
  }
}

abstract class LoadingViewController {
  var loading = false;

  showLoading() {
    (this as State).setState(() {
      loading = true;
    });
  }

  hideLoading() {
    (this as State).setState(() {
      loading = false;
    });
  }
}
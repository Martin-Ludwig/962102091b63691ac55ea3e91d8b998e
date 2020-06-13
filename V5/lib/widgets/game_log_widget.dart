import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_console/models/game_log.dart';


class GameLogWidget extends StatefulWidget {
  final GameLog log;

  GameLogWidget(this.log);

  @override
  LogState createState() => LogState();
}


class LogState extends State<GameLogWidget> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    //add Post Frame Callback to scroll to bottom after new ListView was build
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());

    Widget _buildRow(int index) {
      return  Text(
        "${widget.log.entryAt(index)}",
        style: TextStyle(
            fontSize: 18
        ),
      );
    }

    return Container(
      height: 300.0,
      //width: 300.0,
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1, thickness: 2,),
        itemCount: widget.log.size,
        itemBuilder: (BuildContext context, int index) => _buildRow(index)

      )
    );
  }

  _scrollToEnd() async {
    if (_scrollController.hasClients) {
      //_scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 400), curve: Curves.easeOut);

    }
  }

}

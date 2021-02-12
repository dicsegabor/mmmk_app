import 'package:flutter/material.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';

typedef ListItemBuilder<T> = Widget Function(T data);

class SearchableListScreen<T> extends StatefulWidget {
  final String title;
  final List<T> list;
  // TODO: kitalálni, hogy miért nem tehetem elé a <T>-t
  final ListItemBuilder builder;

  // TODO: valahogy ellenőrizni, hogy Searchable-e
  SearchableListScreen({
    @required this.title,
    @required this.list,
    @required this.builder,
  });

  @override
  _SearchableListScreenState createState() => _SearchableListScreenState<T>();
}

class _SearchableListScreenState<T> extends State<SearchableListScreen> {
  String _searchedText = "";
  List<T> _filteredList;
  bool _isLoading = false;
  bool _isSearching = false;

  @override
  void initState() {
    _filteredList = widget.list;
    super.initState();
  }

  void _setFilteredList() {
    _searchedText.isEmpty
        ? setState(() => _filteredList = [...widget.list])
        : setState(() => _filteredList = widget.list
            .where((element) => element.contains(_searchedText))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: widget.title,
      appBar: _isSearching
          ? AppBar(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Keresés"),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => setState(() {
                    _searchedText = value;
                    _setFilteredList();
                  }),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _searchedText = "";
                      _setFilteredList();
                      _isSearching = false;
                    });
                  },
                ),
              ],
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => setState(() => _isSearching = true),
        ),
      ],
      body: _isLoading
          ? LoadingWidget()
          : Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: _filteredList.length,
                itemBuilder: (context, index) => widget.builder(_filteredList[index]),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'file:///C:/Users/Dell/Google%20Drive/Programming/Flutter/mmmk_app/lib/model/interfaces/searchable.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/loadingWidget.dart';

typedef ListItemBuilder = Widget Function(Searchable data);

class SearchableListScreen extends StatefulWidget {
  final String title;
  final List<Searchable> list;
  final ListItemBuilder listItemBuilder;

  SearchableListScreen({
    @required this.title,
    @required this.list,
    @required this.listItemBuilder,
  });

  @override
  _SearchableListScreenState createState() => _SearchableListScreenState();
}

class _SearchableListScreenState extends State<SearchableListScreen> {
  String _searchedText = "";
  List<Searchable> _filteredList;
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
                itemBuilder: (context, index) => widget.listItemBuilder(_filteredList[index]),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final bool hasSearchQuery;
  final VoidCallback? onClearSearch;

  const EmptyState({
    Key? key,
    this.hasSearchQuery = false,
    this.onClearSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            SizedBox(height: 24),
            _buildTitle(),
            SizedBox(height: 12),
            _buildSubtitle(),
            if (hasSearchQuery && onClearSearch != null) ...[
              SizedBox(height: 24),
              _buildClearSearchButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(
        hasSearchQuery ? Icons.search_off : Icons.checklist,
        size: 60,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      hasSearchQuery ? 'No Results Found' : 'No Todos Yet',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      hasSearchQuery
          ? 'Try adjusting your search or check the spelling'
          : 'Add your first todo to get started!\nTap the + button below to create one.',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildClearSearchButton() {
    return OutlinedButton.icon(
      onPressed: onClearSearch,
      icon: Icon(Icons.clear),
      label: Text('Clear Search'),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
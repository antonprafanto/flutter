# 💅 Chapter 7: Styling & Theming

[![Progress](https://img.shields.io/badge/Progress-Chapter%207%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Intermediate-yellow?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-3--4%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan menguasai sistem styling Flutter, theming, Material Design, dan membuat aplikasi yang beautiful dan konsisten.

## 📋 Daftar Isi
- [Flutter Styling System](#-flutter-styling-system)
- [Colors & Color Schemes](#-colors--color-schemes)
- [Typography & Text Styling](#-typography--text-styling)
- [Material Design & Cupertino](#-material-design--cupertino)
- [Custom Themes](#-custom-themes)
- [Dark Mode Support](#-dark-mode-support)
- [Custom Fonts & Icons](#-custom-fonts--icons)
- [Animations & Transitions](#-animations--transitions)
- [Responsive Styling](#-responsive-styling)
- [Styling Best Practices](#-styling-best-practices)

---

## 🎨 Flutter Styling System

### 🔍 **Styling Hierarchy Overview**

```dart
// Flutter styling inheritance flow
MaterialApp(                        // 1. App-level theme
  theme: ThemeData(...),
  child: Scaffold(                 // 2. Screen structure
    appBar: AppBar(...),           // 3. Component themes
    body: Container(               // 4. Container styling
      decoration: BoxDecoration(   // 5. Custom decorations
        color: Colors.blue,
        borderRadius: ...,
      ),
      child: Text(                 // 6. Widget-specific styles
        'Hello',
        style: TextStyle(          // 7. Explicit styles
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  ),
)
```

### 🏗️ **Styling Methods Comparison**

```dart
class StylingMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Method 1: Inline styling (quick but not reusable)
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Inline Styled',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),

        SizedBox(height: 16),

        // Method 2: Theme-based styling (consistent & reusable)
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Theme Styled',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),

        SizedBox(height: 16),

        // Method 3: Custom widget (encapsulated styling)
        CustomStyledButton(
          text: 'Custom Widget',
          onPressed: () {},
        ),
      ],
    );
  }
}

// Custom styled widget
class CustomStyledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomStyledButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 🌈 Colors & Color Schemes

### 🎨 **Color System in Flutter**

```dart
class ColorExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Material Colors
          Text('Material Colors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildColorSwatch('Red', Colors.red),
              _buildColorSwatch('Pink', Colors.pink),
              _buildColorSwatch('Purple', Colors.purple),
              _buildColorSwatch('Blue', Colors.blue),
              _buildColorSwatch('Cyan', Colors.cyan),
              _buildColorSwatch('Teal', Colors.teal),
              _buildColorSwatch('Green', Colors.green),
              _buildColorSwatch('Orange', Colors.orange),
            ],
          ),

          SizedBox(height: 32),

          // Color Shades
          Text('Color Shades', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildShadeColumn('Blue 50', Colors.blue[50]!)),
              Expanded(child: _buildShadeColumn('Blue 100', Colors.blue[100]!)),
              Expanded(child: _buildShadeColumn('Blue 200', Colors.blue[200]!)),
              Expanded(child: _buildShadeColumn('Blue 400', Colors.blue[400]!)),
              Expanded(child: _buildShadeColumn('Blue 600', Colors.blue[600]!)),
              Expanded(child: _buildShadeColumn('Blue 800', Colors.blue[800]!)),
              Expanded(child: _buildShadeColumn('Blue 900', Colors.blue[900]!)),
            ],
          ),

          SizedBox(height: 32),

          // Custom Colors
          Text('Custom Colors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildColorSwatch('Custom 1', Color(0xFF6C5CE7)),
              _buildColorSwatch('Custom 2', Color(0xFFA29BFE)),
              _buildColorSwatch('Custom 3', Color(0xFFFD79A8)),
              _buildColorSwatch('Custom 4', Color(0xFFE17055)),
            ],
          ),

          SizedBox(height: 32),

          // Theme Colors
          Text('Theme Colors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildThemeColorsDemo(context),

          SizedBox(height: 32),

          // Color Utilities
          Text('Color Utilities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildColorUtilities(),
        ],
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: _getContrastColor(color),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildShadeColumn(String label, Color color) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: _getContrastColor(color),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildThemeColorsDemo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildThemeColor('Primary', colorScheme.primary)),
            Expanded(child: _buildThemeColor('Secondary', colorScheme.secondary)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildThemeColor('Surface', colorScheme.surface)),
            Expanded(child: _buildThemeColor('Background', colorScheme.background)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildThemeColor('Error', colorScheme.error)),
            Expanded(child: _buildThemeColor('On Primary', colorScheme.onPrimary)),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeColor(String name, Color color) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: _getContrastColor(color),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildColorUtilities() {
    Color baseColor = Colors.blue;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildColorSwatch('Original', baseColor)),
            Expanded(child: _buildColorSwatch('Opacity 50%', baseColor.withOpacity(0.5))),
            Expanded(child: _buildColorSwatch('Lighter', baseColor.withAlpha(100))),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildColorSwatch('Darker', Color.lerp(baseColor, Colors.black, 0.3)!)),
            Expanded(child: _buildColorSwatch('Complementary', _getComplementaryColor(baseColor))),
            Expanded(child: _buildColorSwatch('Grayscale', _getGrayscale(baseColor))),
          ],
        ),
      ],
    );
  }

  Color _getContrastColor(Color color) {
    // Calculate luminance and return appropriate contrast color
    double luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Color _getComplementaryColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }

  Color _getGrayscale(Color color) {
    int gray = ((color.red + color.green + color.blue) / 3).round();
    return Color.fromARGB(color.alpha, gray, gray, gray);
  }
}
```

### 🎨 **Color Schemes & Palettes**

```dart
class CustomColorSchemes {
  // Professional color schemes
  static const ColorScheme blueScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1976D2),
    onPrimary: Colors.white,
    secondary: Color(0xFF03DAC6),
    onSecondary: Colors.black,
    error: Color(0xFFB00020),
    onError: Colors.white,
    background: Color(0xFFFAFAFA),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static const ColorScheme greenScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF4CAF50),
    onPrimary: Colors.white,
    secondary: Color(0xFFFF9800),
    onSecondary: Colors.black,
    error: Color(0xFFB00020),
    onError: Colors.white,
    background: Color(0xFFF1F8E9),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static const ColorScheme purpleScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF9C27B0),
    onPrimary: Colors.white,
    secondary: Color(0xFFE91E63),
    onSecondary: Colors.white,
    error: Color(0xFFB00020),
    onError: Colors.white,
    background: Color(0xFFFCE4EC),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  // Dark color schemes
  static const ColorScheme darkBlueScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF90CAF9),
    onPrimary: Colors.black,
    secondary: Color(0xFF03DAC6),
    onSecondary: Colors.black,
    error: Color(0xFFCF6679),
    onError: Colors.black,
    background: Color(0xFF121212),
    onBackground: Colors.white,
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
  );
}
```

---

## 📝 Typography & Text Styling

### 🔤 **Text Theme Hierarchy**

```dart
class TypographyExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Material 3 Typography Scale
          Text('Material 3 Typography Scale',
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),

          _buildTextExample('Display Large', textTheme.displayLarge),
          _buildTextExample('Display Medium', textTheme.displayMedium),
          _buildTextExample('Display Small', textTheme.displaySmall),

          Divider(height: 32),

          _buildTextExample('Headline Large', textTheme.headlineLarge),
          _buildTextExample('Headline Medium', textTheme.headlineMedium),
          _buildTextExample('Headline Small', textTheme.headlineSmall),

          Divider(height: 32),

          _buildTextExample('Title Large', textTheme.titleLarge),
          _buildTextExample('Title Medium', textTheme.titleMedium),
          _buildTextExample('Title Small', textTheme.titleSmall),

          Divider(height: 32),

          _buildTextExample('Body Large', textTheme.bodyLarge),
          _buildTextExample('Body Medium', textTheme.bodyMedium),
          _buildTextExample('Body Small', textTheme.bodySmall),

          Divider(height: 32),

          _buildTextExample('Label Large', textTheme.labelLarge),
          _buildTextExample('Label Medium', textTheme.labelMedium),
          _buildTextExample('Label Small', textTheme.labelSmall),

          SizedBox(height: 32),

          // Custom Text Styles
          Text('Custom Text Styles',
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),

          _buildCustomTextExamples(),

          SizedBox(height: 32),

          // Text Decorations
          Text('Text Decorations & Effects',
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),

          _buildTextDecorations(),
        ],
      ),
    );
  }

  Widget _buildTextExample(String label, TextStyle? style) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label (${style?.fontSize?.toInt()}sp)',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: style,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient text effect
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.cyan],
          ).createShader(bounds),
          child: Text(
            'Gradient Text Effect',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        SizedBox(height: 16),

        // Text with shadow
        Text(
          'Text with Shadow',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),

        SizedBox(height: 16),

        // Letter spacing
        Text(
          'LETTER SPACING',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            color: Colors.grey[700],
          ),
        ),

        SizedBox(height: 16),

        // Word spacing (using RichText)
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: 'Word'),
              TextSpan(text: '    '), // Custom spacing
              TextSpan(text: 'Spacing'),
              TextSpan(text: '    '),
              TextSpan(text: 'Example'),
            ],
          ),
        ),

        SizedBox(height: 16),

        // Rich text with multiple styles
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(text: 'This is '),
              TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' and this is '),
              TextSpan(
                text: 'italic',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(text: ' and this is '),
              TextSpan(
                text: 'colored',
                style: TextStyle(color: Colors.red),
              ),
              TextSpan(text: ' text.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextDecorations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Underlined Text',
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            decorationThickness: 2,
          ),
        ),

        SizedBox(height: 12),

        Text(
          'Strike Through Text',
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
          ),
        ),

        SizedBox(height: 12),

        Text(
          'Overlined Text',
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.overline,
            decorationColor: Colors.green,
          ),
        ),

        SizedBox(height: 12),

        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Text on Dark Background',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(height: 12),

        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Text on Gradient Background',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
```

### 📝 **Custom Text Themes**

```dart
class CustomTextThemes {
  static TextTheme modernTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );
}
```

---

## 🎨 Material Design & Cupertino

### 📱 **Material Design 3 Components**

```dart
class MaterialDesignShowcase extends StatefulWidget {
  @override
  _MaterialDesignShowcaseState createState() => _MaterialDesignShowcaseState();
}

class _MaterialDesignShowcaseState extends State<MaterialDesignShowcase> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Material Design 3'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Components'),
              Tab(text: 'Cards'),
              Tab(text: 'Navigation'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildComponentsTab(),
            _buildCardsTab(),
            _buildNavigationTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Buttons section
          Text('Buttons', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Elevated'),
              ),
              FilledButton(
                onPressed: () {},
                child: Text('Filled'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Text'),
              ),
            ],
          ),

          SizedBox(height: 32),

          // Input controls
          Text('Input Controls', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          SwitchListTile(
            title: Text('Enable notifications'),
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),

          CheckboxListTile(
            title: Text('I agree to terms'),
            value: _checkboxValue,
            onChanged: (value) {
              setState(() {
                _checkboxValue = value!;
              });
            },
          ),

          Text('Volume: ${_sliderValue.round()}'),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: _sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),

          SizedBox(height: 32),

          // Chips
          Text('Chips', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          Wrap(
            spacing: 8,
            children: [
              Chip(
                label: Text('Basic Chip'),
                onDeleted: () {},
              ),
              ActionChip(
                label: Text('Action'),
                onPressed: () {},
              ),
              FilterChip(
                label: Text('Filter'),
                selected: false,
                onSelected: (selected) {},
              ),
              ChoiceChip(
                label: Text('Choice'),
                selected: true,
                onSelected: (selected) {},
              ),
            ],
          ),

          SizedBox(height: 32),

          // Progress indicators
          Text('Progress', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          LinearProgressIndicator(value: 0.6),
          SizedBox(height: 16),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Widget _buildCardsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Basic card
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Basic Card', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  Text('This is a basic Material Design card with default styling.'),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Elevated card
          Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elevated Card', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  Text('This card has higher elevation for more prominence.'),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Content card
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.image, size: 60, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Content Card', style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 8),
                      Text('Cards can contain images, text, and actions.'),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: () {}, child: Text('CANCEL')),
                          SizedBox(width: 8),
                          ElevatedButton(onPressed: () {}, child: Text('OK')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Navigation Rail', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          Container(
            height: 300,
            child: Row(
              children: [
                NavigationRail(
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.search),
                      label: Text('Search'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text('Profile'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(
                      child: Text('Content Area'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 32),

          Text('List Tiles', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('John Doe'),
                  subtitle: Text('Software Developer'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('jane@example.com'),
                  subtitle: Text('Email Address'),
                  trailing: Icon(Icons.edit),
                  onTap: () {},
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+1 234 567 8900'),
                  subtitle: Text('Phone Number'),
                  trailing: Icon(Icons.call),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### 🍎 **Cupertino (iOS Style) Components**

```dart
import 'package:flutter/cupertino.dart';

class CupertinoShowcase extends StatefulWidget {
  @override
  _CupertinoShowcaseState createState() => _CupertinoShowcaseState();
}

class _CupertinoShowcaseState extends State<CupertinoShowcase> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Style'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Buttons
              Text('Buttons', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {},
                child: Text('Filled Button'),
              ),

              SizedBox(height: 8),

              CupertinoButton(
                onPressed: () {},
                child: Text('Text Button'),
              ),

              SizedBox(height: 32),

              // Form controls
              Text('Form Controls', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CupertinoListTile(
                      title: Text('Enable Notifications'),
                      trailing: CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ),
                    Container(height: 0.5, color: CupertinoColors.separator),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Volume'),
                          CupertinoSlider(
                            value: _sliderValue,
                            onChanged: (value) {
                              setState(() {
                                _sliderValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              // Segmented control
              Text('Segmented Control', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              CupertinoSegmentedControl<int>(
                children: {
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('First'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Second'),
                  ),
                  2: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Third'),
                  ),
                },
                groupValue: _selectedSegment,
                onValueChanged: (value) {
                  setState(() {
                    _selectedSegment = value!;
                  });
                },
              ),

              SizedBox(height: 32),

              // Activity indicator
              Text('Activity Indicator', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              Center(
                child: CupertinoActivityIndicator(radius: 15),
              ),

              SizedBox(height: 32),

              // Action sheet
              Text('Action Sheet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: Text('Action Sheet'),
                      message: Text('Choose an action'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Action 1'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Action 2'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                    ),
                  );
                },
                child: Text('Show Action Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🎨 Custom Themes

### 🏗️ **Creating Custom Themes**

```dart
class CustomThemeExample extends StatefulWidget {
  @override
  _CustomThemeExampleState createState() => _CustomThemeExampleState();
}

class _CustomThemeExampleState extends State<CustomThemeExample> {
  int _currentTheme = 0;

  final List<ThemeData> _themes = [
    _buildDefaultTheme(),
    _buildCustomBlueTheme(),
    _buildCustomGreenTheme(),
    _buildCustomPurpleTheme(),
  ];

  final List<String> _themeNames = [
    'Default',
    'Ocean Blue',
    'Nature Green',
    'Royal Purple',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themes[_currentTheme],
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Custom Themes'),
            actions: [
              PopupMenuButton<int>(
                icon: Icon(Icons.palette),
                onSelected: (value) {
                  setState(() {
                    _currentTheme = value;
                  });
                },
                itemBuilder: (context) => List.generate(
                  _themeNames.length,
                  (index) => PopupMenuItem(
                    value: index,
                    child: Text(_themeNames[index]),
                  ),
                ),
              ),
            ],
          ),
          body: _buildThemeDemo(context),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeDemo(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Theme: ${_themeNames[_currentTheme]}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 24),

          // Color showcase
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme Colors',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Theme.of(context).colorScheme.primary,
                          child: Center(
                            child: Text(
                              'Primary',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Theme.of(context).colorScheme.secondary,
                          child: Center(
                            child: Text(
                              'Secondary',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Component showcase
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Themed Components',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Elevated'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Outlined'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Text'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  LinearProgressIndicator(value: 0.7),
                  SizedBox(height: 16),
                  Chip(
                    label: Text('Themed Chip'),
                    onDeleted: () {},
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Typography showcase
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Typography',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Headline Large',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Headline Medium',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Body Large - Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Body Medium - Sed do eiusmod tempor incididunt ut labore.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static ThemeData _buildDefaultTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    );
  }

  static ThemeData _buildCustomBlueTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF0077BE),
        brightness: Brightness.light,
      ).copyWith(
        primary: Color(0xFF0077BE),
        secondary: Color(0xFF00A8CC),
        surface: Color(0xFFF0F8FF),
        background: Color(0xFFF8FCFF),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0077BE),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }

  static ThemeData _buildCustomGreenTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF2E7D32),
        brightness: Brightness.light,
      ).copyWith(
        primary: Color(0xFF2E7D32),
        secondary: Color(0xFF66BB6A),
        surface: Color(0xFFF1F8E9),
        background: Color(0xFFF8FFF8),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: Color(0xFF1B5E20),
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF2E7D32),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static ThemeData _buildCustomPurpleTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF7B1FA2),
        brightness: Brightness.light,
      ).copyWith(
        primary: Color(0xFF7B1FA2),
        secondary: Color(0xFFAB47BC),
        surface: Color(0xFFFCE4EC),
        background: Color(0xFFFFF8FF),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF7B1FA2),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    );
  }
}
```

---

## 🌙 Dark Mode Support

### 🔄 **Light & Dark Theme Implementation**

```dart
class DarkModeExample extends StatefulWidget {
  @override
  _DarkModeExampleState createState() => _DarkModeExampleState();
}

class _DarkModeExampleState extends State<DarkModeExample> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Mode Demo',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Dark Mode Support'),
            actions: [
              IconButton(
                icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  setState(() {
                    _isDarkMode = !_isDarkMode;
                  });
                },
              ),
            ],
          ),
          body: _buildDarkModeDemo(context),
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      cardTheme: CardTheme(
        color: Color(0xFF2A2A2A),
        elevation: 4,
      ),
    );
  }

  Widget _buildDarkModeDemo(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Theme info card
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        size: 32,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Theme',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              isDark ? 'Dark Mode' : 'Light Mode',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Color demonstration
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adaptive Colors',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  _buildColorRow(
                    context,
                    'Primary',
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                  SizedBox(height: 8),
                  _buildColorRow(
                    context,
                    'Secondary',
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBox(height: 8),
                  _buildColorRow(
                    context,
                    'Surface',
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(height: 8),
                  _buildColorRow(
                    context,
                    'Background',
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.onBackground,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Component showcase
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adaptive Components',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),

                  // Buttons
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Elevated'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Outlined'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Text'),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Progress indicators
                  LinearProgressIndicator(value: 0.6),
                  SizedBox(height: 16),

                  // List items
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('John Doe'),
                    subtitle: Text('Adaptive list item'),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    subtitle: Text('App preferences'),
                    trailing: Switch(value: true, onChanged: (v) {}),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Image with adaptive overlay
          Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [Colors.grey[800]!, Colors.grey[900]!]
                          : [Colors.blue[100]!, Colors.blue[300]!],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 80,
                      color: isDark ? Colors.grey[600] : Colors.blue[400],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          (isDark ? Colors.black : Colors.white).withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Text(
                      'Adaptive Image Overlay',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorRow(BuildContext context, String label, Color color, Color onColor) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: onColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

---

## 🔤 Custom Fonts & Icons

### 📝 **Adding Custom Fonts**

First, add fonts to `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
        - asset: assets/fonts/Roboto-Bold.ttf
          weight: 700
        - asset: assets/fonts/Roboto-Italic.ttf
          style: italic

    - family: OpenSans
      fonts:
        - asset: assets/fonts/OpenSans-Regular.ttf
        - asset: assets/fonts/OpenSans-Bold.ttf
          weight: 700

    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
```

### 🎨 **Custom Font Implementation**

```dart
class CustomFontsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Fonts')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Default font
            Text(
              'Default System Font',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This text uses the default system font.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 32),

            // Roboto font
            Text(
              'Roboto Font Family',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Regular weight text using Roboto.',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            ),
            Text(
              'Bold weight text using Roboto.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Italic style text using Roboto.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 32),

            // OpenSans font
            Text(
              'Open Sans Font Family',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Open Sans is known for its friendly and open curves.',
              style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
            ),
            Text(
              'Bold Open Sans for headings and emphasis.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 32),

            // Poppins font
            Text(
              'Poppins Font Family',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Poppins is a modern geometric font.',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            Text(
              'Semi-bold Poppins for better readability.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 32),

            // Font showcase card
            _buildFontShowcase(),
          ],
        ),
      ),
    );
  }

  Widget _buildFontShowcase() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Font Showcase',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),

            // Font samples
            _buildFontSample('System Default', null),
            _buildFontSample('Roboto', 'Roboto'),
            _buildFontSample('Open Sans', 'OpenSans'),
            _buildFontSample('Poppins', 'Poppins'),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSample(String name, String? fontFamily) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: TextStyle(
              fontSize: 16,
              fontFamily: fontFamily,
            ),
          ),
          Text(
            'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            style: TextStyle(
              fontSize: 14,
              fontFamily: fontFamily,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            '1234567890 !@#\$%^&*()',
            style: TextStyle(
              fontSize: 14,
              fontFamily: fontFamily,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
```

### 🎯 **Custom Icons**

```dart
class CustomIconsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Icons')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Material Icons
            Text(
              'Material Icons',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildIconDemo(Icons.home, 'Home'),
                _buildIconDemo(Icons.favorite, 'Favorite'),
                _buildIconDemo(Icons.settings, 'Settings'),
                _buildIconDemo(Icons.person, 'Person'),
                _buildIconDemo(Icons.search, 'Search'),
                _buildIconDemo(Icons.notifications, 'Notifications'),
                _buildIconDemo(Icons.shopping_cart, 'Cart'),
                _buildIconDemo(Icons.star, 'Star'),
              ],
            ),

            SizedBox(height: 32),

            // Icon variations
            Text(
              'Icon Variations',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.favorite, size: 24),
                    SizedBox(height: 8),
                    Text('24px', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite, size: 32, color: Colors.red),
                    SizedBox(height: 8),
                    Text('32px Red', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite, size: 48, color: Colors.pink),
                    SizedBox(height: 8),
                    Text('48px Pink', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite, size: 64, color: Colors.purple),
                    SizedBox(height: 8),
                    Text('64px Purple', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 32),

            // Icon buttons
            Text(
              'Icon Buttons',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                  tooltip: 'Like',
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  tooltip: 'Share',
                ),
                IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {},
                  tooltip: 'Bookmark',
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                  tooltip: 'More',
                ),
              ],
            ),

            SizedBox(height: 32),

            // Custom icon containers
            Text(
              'Custom Icon Containers',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCustomIconContainer(
                  Icons.download,
                  'Download',
                  Colors.blue,
                ),
                _buildCustomIconContainer(
                  Icons.upload,
                  'Upload',
                  Colors.green,
                ),
                _buildCustomIconContainer(
                  Icons.delete,
                  'Delete',
                  Colors.red,
                ),
                _buildCustomIconContainer(
                  Icons.edit,
                  'Edit',
                  Colors.orange,
                ),
              ],
            ),

            SizedBox(height: 32),

            // Icon with badges
            Text(
              'Icons with Badges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconWithBadge(Icons.notifications, 3),
                _buildIconWithBadge(Icons.message, 12),
                _buildIconWithBadge(Icons.shopping_cart, 5),
                _buildIconWithBadge(Icons.email, 99),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconDemo(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCustomIconContainer(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildIconWithBadge(IconData icon, int count) {
    return Stack(
      children: [
        Icon(icon, size: 32),
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                count > 99 ? '99+' : '$count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
```

---

## 🎭 Animations & Transitions

### ⚡ **Basic Animations**

```dart
class BasicAnimationExample extends StatefulWidget {
  @override
  _BasicAnimationExampleState createState() => _BasicAnimationExampleState();
}

class _BasicAnimationExampleState extends State<BasicAnimationExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Scale animation
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Color animation
    _colorController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_colorController);

    // Start animations
    _controller.repeat(reverse: true);
    _colorController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Animations')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Animated scale
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Scale Animation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.star, color: Colors.white, size: 50),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Color animation
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Color Animation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: _colorAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: _colorAnimation.value,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Animated Color',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Implicit animations
            _buildImplicitAnimations(),

            SizedBox(height: 16),

            // Hero animation demo
            _buildHeroAnimation(),
          ],
        ),
      ),
    );
  }

  Widget _buildImplicitAnimations() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool _isExpanded = false;
        Color _containerColor = Colors.green;
        double _borderRadius = 10;

        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Implicit Animations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),

                // AnimatedContainer
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _isExpanded ? 200 : 100,
                  height: _isExpanded ? 200 : 100,
                  decoration: BoxDecoration(
                    color: _containerColor,
                    borderRadius: BorderRadius.circular(_borderRadius),
                  ),
                  child: Center(
                    child: Text(
                      'Tap me!',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text('Size'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.green
                              ? Colors.purple
                              : Colors.green;
                        });
                      },
                      child: Text('Color'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _borderRadius = _borderRadius == 10 ? 50 : 10;
                        });
                      },
                      child: Text('Shape'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeroAnimation() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Hero Animation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Tap the image to see hero animation'),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroDetailPage()),
                );
              },
              child: Hero(
                tag: 'hero-image',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                  ),
                  child: Icon(Icons.image, color: Colors.white, size: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
              ),
            ),
            child: Icon(Icons.image, color: Colors.white, size: 150),
          ),
        ),
      ),
    );
  }
}
```

---

## 📱 Responsive Styling

### 📏 **Responsive Design Patterns**

```dart
class ResponsiveStylingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Styling')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildResponsiveContainer(context),
            _buildResponsiveGrid(context),
            _buildResponsiveTypography(context),
            _buildResponsiveNavigation(context),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContainer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(isTablet ? 24 : 16),
      decoration: BoxDecoration(
        color: isTablet ? Colors.blue[50] : Colors.green[50],
        borderRadius: BorderRadius.circular(isTablet ? 20 : 10),
        border: Border.all(
          color: isTablet ? Colors.blue : Colors.green,
          width: isTablet ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Responsive Container',
            style: TextStyle(
              fontSize: isTablet ? 24 : 18,
              fontWeight: FontWeight.bold,
              color: isTablet ? Colors.blue[800] : Colors.green[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This container adapts its styling based on screen size. '
            'Current width: ${screenWidth.toInt()}px',
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
            ),
          ),
          SizedBox(height: 16),
          Text(
            isTablet ? 'Tablet Layout' : 'Mobile Layout',
            style: TextStyle(
              fontSize: isTablet ? 20 : 16,
              fontWeight: FontWeight.w600,
              color: isTablet ? Colors.blue : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;
          double childAspectRatio;
          double spacing;

          if (constraints.maxWidth > 1200) {
            crossAxisCount = 4;
            childAspectRatio = 1.2;
            spacing = 16;
          } else if (constraints.maxWidth > 800) {
            crossAxisCount = 3;
            childAspectRatio = 1.1;
            spacing = 12;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 2;
            childAspectRatio = 1.0;
            spacing = 10;
          } else {
            crossAxisCount = 1;
            childAspectRatio = 3.0;
            spacing = 8;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Responsive Grid ($crossAxisCount columns)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.primaries[index % Colors.primaries.length],
                          Colors.primaries[(index + 1) % Colors.primaries.length],
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: constraints.maxWidth > 600 ? 32 : 24,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Item ${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth > 600 ? 16 : 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildResponsiveTypography(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive font sizes
    double headlineSize = screenWidth > 600 ? 32 : 24;
    double bodySize = screenWidth > 600 ? 18 : 16;
    double captionSize = screenWidth > 600 ? 16 : 14;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Responsive Typography',
            style: TextStyle(
              fontSize: headlineSize,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'This text adapts its size based on screen width. '
            'Headlines are larger on tablets and desktops.',
            style: TextStyle(
              fontSize: bodySize,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Current headline size: ${headlineSize}px, Body size: ${bodySize}px',
            style: TextStyle(
              fontSize: captionSize,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveNavigation(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;

    return Container(
      margin: EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: isWide ? _buildWideNavigation() : _buildNarrowNavigation(),
    );
  }

  Widget _buildWideNavigation() {
    return Row(
      children: [
        // Side navigation
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Side Navigation',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home, color: Colors.blue),
                      title: Text('Home'),
                      dense: true,
                    ),
                    ListTile(
                      leading: Icon(Icons.search, color: Colors.blue),
                      title: Text('Search'),
                      dense: true,
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text('Profile'),
                      dense: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Content area
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Wide Screen Layout\nSide navigation is visible',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowNavigation() {
    return Column(
      children: [
        // Top navigation
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.blue),
                onPressed: () {},
              ),
              Text(
                'Mobile Navigation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Content area
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Narrow Screen Layout\nNavigation is collapsed',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        // Bottom navigation
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

---

## ✨ Styling Best Practices

### 📝 **Do's and Don'ts**

```dart
// ✅ DO: Use theme-based styling
class GoodStylingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Theme-based styling',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

// ❌ DON'T: Use hardcoded values
class BadStylingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF), // Hardcoded color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Hardcoded styling',
        style: TextStyle(
          fontSize: 16, // Hardcoded size
          color: Color(0xFF000000), // Hardcoded color
        ),
      ),
    );
  }
}

// ✅ DO: Create reusable styled components
class StyledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;

  const StyledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }
}

// ✅ DO: Use consistent spacing
class ConsistentSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

// ✅ DO: Define color constants
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
}
```

### 🎯 **Performance Tips**

```dart
// ✅ DO: Use const constructors when possible
class PerformantStyling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Static text'), // const
        const Icon(Icons.star),    // const
        const SizedBox(height: 16), // const
      ],
    );
  }
}

// ✅ DO: Extract theme data once
class EfficientTheming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      children: [
        Text('Title', style: textTheme.headlineMedium),
        Container(color: colorScheme.primary),
        Text('Body', style: textTheme.bodyLarge),
      ],
    );
  }
}

// ✅ DO: Use MediaQuery efficiently
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isTablet = screenWidth > 600;

    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 16),
      child: Text(
        'Responsive content',
        style: TextStyle(
          fontSize: isTablet ? 18 : 16,
        ),
      ),
    );
  }
}
```

---

## 🎓 Chapter Summary

Congratulations! Anda telah menguasai sistem styling dan theming Flutter:

### ✅ **What You've Mastered**
- **Color Systems**: Material colors, custom palettes, adaptive colors
- **Typography**: Text themes, custom fonts, responsive text
- **Design Systems**: Material Design 3, Cupertino, custom themes
- **Dark Mode**: Light/dark theme implementation dan adaptive UI
- **Custom Assets**: Fonts, icons, dan asset management
- **Animations**: Basic animations, implicit animations, hero transitions
- **Responsive Design**: Adaptive styling untuk different screen sizes
- **Best Practices**: Performance optimization, consistent styling

### 🎯 **Key Skills Acquired**
- **Theme Creation**: Building custom themes dan color schemes
- **Responsive Styling**: Adapting UI untuk different devices
- **Performance Awareness**: Efficient styling techniques
- **Design Consistency**: Using design systems dan style guides
- **Animation Integration**: Adding smooth transitions dan feedback

### 🚀 **Ready for State Management**
Dengan styling mastery yang solid, Anda siap untuk:
- Advanced state management patterns
- Complex user interactions
- Professional app development
- Beautiful, consistent UIs

---

<div align="center">

### 🎯 **Achievement Unlocked!**
![Styling Master Badge](../assets/badges/styling-master.png)

**💅 Styling Master** - Mastered Flutter Styling & Theming

---

**Ready to dive into state management?**

[⬅️ Previous: Widgets & Layouts](06-widget-dasar-layout.md) | [➡️ Next: State Management](08-state-management-sederhana.md)

---

**💬 Styling Questions?** Check our [cheat sheets](cheat-sheets.md) atau open an [issue](../../issues)

</div>
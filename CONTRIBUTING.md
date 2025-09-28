# 🤝 Contributing to Flutter Tutorial untuk Pemula

Terima kasih telah tertarik untuk berkontribusi pada tutorial Flutter ini! Kontribusi dari komunitas sangat membantu membuat tutorial ini lebih baik dan bermanfaat bagi semua orang yang belajar Flutter.

## 📋 Table of Contents
- [Code of Conduct](#-code-of-conduct)
- [How Can I Contribute?](#-how-can-i-contribute)
- [Getting Started](#-getting-started)
- [Development Workflow](#-development-workflow)
- [Style Guidelines](#-style-guidelines)
- [Commit Guidelines](#-commit-guidelines)
- [Pull Request Process](#-pull-request-process)
- [Community](#-community)

## 📜 Code of Conduct

Proyek ini mengikuti [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). Dengan berpartisipasi, Anda diharapkan mematuhi kode etik ini. Laporkan perilaku yang tidak dapat diterima ke [email@example.com].

### Prinsip Utama:
- **Respect**: Hormati semua kontributor dan pengguna
- **Inclusivity**: Ciptakan lingkungan yang ramah untuk semua
- **Constructive**: Berikan feedback yang membangun
- **Learning-focused**: Prioritaskan pengalaman belajar yang baik

## 🎯 How Can I Contribute?

### 📝 Content Contributions
- **Tutorial improvements**: Perbaiki penjelasan yang kurang jelas
- **New examples**: Tambahkan contoh code yang berguna
- **Exercise additions**: Buat latihan dan challenges baru
- **Translation**: Bantu perbaiki bahasa Indonesia yang lebih baik

### 🐛 Bug Reports
- Temukan dan laporkan errors dalam code examples
- Identifikasi link yang rusak atau informasi yang outdated
- Laporkan masalah dalam setup instructions

### ✨ Feature Requests
- Suggest new tutorial sections
- Propose additional project examples
- Request improved explanations for complex topics

### 🧪 Quality Assurance
- Test code examples di berbagai platform
- Verify setup instructions pada different OS
- Check for accessibility dan inclusivity

### 📚 Documentation
- Improve README dan setup instructions
- Enhance code comments dan explanations
- Update outdated information

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Git
- Code editor (VS Code atau Android Studio recommended)
- Basic understanding of Markdown

### Fork & Clone
1. **Fork the repository** di GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/flutter-tutorial-pemula.git
   cd flutter-tutorial-pemula
   ```

3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/ORIGINAL_USERNAME/flutter-tutorial-pemula.git
   ```

4. **Create a new branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Environment Setup
1. **Verify Flutter installation**:
   ```bash
   flutter doctor
   ```

2. **Test project examples**:
   ```bash
   cd projects/hello_world
   flutter pub get
   flutter run
   ```

## 🔄 Development Workflow

### 1. Planning Phase
- **Check existing issues** untuk avoid duplicate work
- **Create an issue** untuk discuss major changes
- **Get feedback** dari maintainers sebelum starting

### 2. Development Phase
- **Keep changes focused** pada single issue atau feature
- **Test thoroughly** di multiple platforms jika applicable
- **Follow style guidelines** (see below)
- **Write clear commit messages**

### 3. Review Phase
- **Self-review** your changes
- **Test all code examples**
- **Check for typos** dan grammatical errors
- **Ensure consistent formatting**

### 4. Submission Phase
- **Create pull request** dengan clear description
- **Link related issues**
- **Respond to review feedback**
- **Make requested changes**

## 📐 Style Guidelines

### Markdown Style
```markdown
# Main headings with emoji
## Subheadings without emoji
- Use consistent bullet points
- **Bold** for emphasis
- `code` for inline code
- ```dart for code blocks with syntax highlighting
```

### Code Style
```dart
// Use clear, descriptive variable names
int userAge = 25;
String userName = 'Flutter Developer';

// Add comments for complex logic
class TodoItem {
  final String title;
  final bool isCompleted;

  // Constructor dengan named parameters
  TodoItem({
    required this.title,
    this.isCompleted = false,
  });
}

// Consistent formatting
Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('Example'),
  );
}
```

### Documentation Style
- **Bahasa Indonesia yang baku** untuk main content
- **English terms** untuk technical keywords (widget, state, etc.)
- **Clear explanations** untuk beginners
- **Step-by-step instructions** dengan numbered lists
- **Code examples** yang complete dan tested

### Project Structure
```
tutorial-section/
├── README.md              # Main tutorial content
├── examples/              # Working code examples
│   ├── basic_example.dart
│   └── advanced_example.dart
└── exercises/             # Practice exercises
    ├── exercise_1.md
    └── solution_1.dart
```

## 💬 Commit Guidelines

### Commit Message Format
```
type(scope): short description

Longer explanation if needed

Fixes #123
```

### Types
- **feat**: New feature atau tutorial section
- **fix**: Bug fix dalam code atau documentation
- **docs**: Documentation changes only
- **style**: Formatting, typos, no code change
- **refactor**: Code refactoring tanpa functionality change
- **test**: Adding atau fixing tests
- **chore**: Maintenance tasks

### Examples
```bash
git commit -m "feat(section-5): add widget layout examples"
git commit -m "fix(counter-app): correct state management implementation"
git commit -m "docs(readme): update installation instructions"
git commit -m "style(markdown): fix formatting in section 3"
```

## 🔄 Pull Request Process

### Before Creating PR
- [ ] Code telah di-test di local environment
- [ ] All existing tests pass
- [ ] Documentation updated (jika applicable)
- [ ] Commit messages follow guidelines
- [ ] Branch is up-to-date dengan main

### PR Template
Gunakan template yang provided atau include:
- **Description** dari changes
- **Type of change** (bug fix, feature, docs, etc.)
- **Testing performed**
- **Screenshots** (jika applicable)
- **Breaking changes** (jika ada)

### Review Process
1. **Automated checks** akan run (CI/CD)
2. **Maintainer review** untuk content quality
3. **Community feedback** mungkin requested
4. **Changes requested** implemented
5. **Final approval** dan merge

### After Merge
- **Update local repository**:
  ```bash
  git checkout main
  git pull upstream main
  ```
- **Delete feature branch**:
  ```bash
  git branch -d feature/your-feature-name
  ```

## 🏷️ Issue Labels

### Type Labels
- `bug`: Something isn't working
- `enhancement`: New feature request
- `documentation`: Documentation improvements
- `question`: Further information requested

### Priority Labels
- `priority-high`: Critical issues
- `priority-medium`: Important improvements
- `priority-low`: Nice-to-have features

### Status Labels
- `needs-review`: Ready for review
- `needs-work`: Changes requested
- `blocked`: Waiting for dependencies

### Area Labels
- `area-tutorial`: Tutorial content
- `area-examples`: Code examples
- `area-docs`: Documentation
- `area-setup`: Installation/setup

## 🧪 Testing Guidelines

### Code Examples
- **All code must be tested** dan working
- **Include pubspec.yaml** untuk dependencies
- **Test di multiple platforms** (Android, iOS, Web jika applicable)
- **Provide expected output** atau screenshots

### Documentation
- **Check for broken links**
- **Verify instructions** di clean environment
- **Test setup process** dari scratch
- **Proofread** untuk typos dan grammar

### Review Checklist
- [ ] Code compiles without errors
- [ ] Examples work as described
- [ ] Documentation is clear dan accurate
- [ ] No sensitive information exposed
- [ ] Consistent dengan existing style

## 🌍 Internationalization

### Language Guidelines
- **Primary language**: Bahasa Indonesia
- **Technical terms**: Keep English terms untuk consistency
- **Code comments**: Bahasa Indonesia untuk explanations
- **Variable names**: English (following Dart conventions)

### Examples
```dart
// ✅ Good
class UserProfile {
  final String name; // Nama pengguna
  final int age;     // Umur pengguna

  // Metode untuk memperbarui profil
  void updateProfile() {
    // implementasi di sini
  }
}

// ❌ Avoid
class ProfilPengguna {
  final String nama;
  final int umur;
}
```

## 🤝 Community

### Communication Channels
- **GitHub Issues**: Bug reports dan feature requests
- **GitHub Discussions**: General questions dan discussions
- **Discord**: Real-time chat (link in README)
- **Email**: [contact@example.com] untuk private matters

### Community Guidelines
- **Be respectful** dalam all interactions
- **Help newcomers** dengan patient explanations
- **Share knowledge** dan best practices
- **Collaborate constructively** pada improvements

### Recognition
Contributors akan recognized dalam:
- **Contributors section** di README
- **Release notes** untuk significant contributions
- **Special thanks** dalam documentation
- **Contributor badges** pada GitHub profile

## 📊 Metrics & Goals

### Quality Metrics
- Code examples success rate: 100%
- Documentation clarity score: >90%
- Community satisfaction: >85%
- Issue resolution time: <7 days average

### Growth Goals
- Increase tutorial completeness
- Improve beginner success rate
- Expand community participation
- Enhance accessibility

## 🎉 Recognition

### Hall of Fame
Contributors dengan significant impact:
- Tutorial content creators
- Code example developers
- Community moderators
- Quality assurance testers

### Contribution Types
- **🏆 Gold**: Major tutorial sections atau features
- **🥈 Silver**: Significant improvements atau fixes
- **🥉 Bronze**: Documentation, examples, atau minor fixes
- **⭐ Special**: Community building atau unique contributions

## 📞 Getting Help

### For Contributors
- **Read this guide** thoroughly
- **Check existing issues** dan documentation
- **Ask in GitHub Discussions** untuk general questions
- **Create an issue** untuk specific problems

### For Maintainers
- **Review PRs promptly** (target: 48 hours)
- **Provide constructive feedback**
- **Maintain quality standards**
- **Foster welcoming community**

---

## 🙏 Thank You!

Terima kasih telah mempertimbangkan untuk berkontribusi! Setiap kontribusi, sekecil apapun, sangat dihargai dan membantu komunitas Flutter Indonesia tumbuh dan belajar bersama.

**Happy Contributing!** 🚀

---

*Last updated: December 2024*
*For questions about this guide: [create an issue](../../issues/new?template=question.md)*
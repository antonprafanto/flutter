# 👥 Code Review Template - Flutter Development

[![Type](https://img.shields.io/badge/Type-Code%20Review-green?style=for-the-badge)](../README.md)
[![Level](https://img.shields.io/badge/Level-All%20Levels-blue?style=for-the-badge)](../README.md)

> 🎯 **Template untuk self-code review dan peer review dalam Flutter development**

## 📋 Daftar Isi
- [Self-Review Checklist](#-self-review-checklist)
- [Peer Review Guidelines](#-peer-review-guidelines)
- [Code Quality Criteria](#-code-quality-criteria)
- [Performance Review](#-performance-review)
- [Security Review](#-security-review)

---

## 🔍 Self-Review Checklist

### **Sebelum Submit Code**

Gunakan checklist ini untuk review code kamu sendiri sebelum commit atau pull request:

#### ✅ **Basic Code Quality**
- [ ] **Naming Conventions**
  - [ ] Class names menggunakan PascalCase (`MyWidget`)
  - [ ] Variable & function names menggunakan camelCase (`userName`)
  - [ ] Constants menggunakan SCREAMING_SNAKE_CASE (`MAX_RETRY_COUNT`)
  - [ ] File names menggunakan snake_case (`user_profile_widget.dart`)

- [ ] **Code Organization**
  - [ ] Import statements terorganisir (flutter > dart > package > relative)
  - [ ] Unused imports sudah dihapus
  - [ ] Code tidak duplicate (DRY principle)
  - [ ] Functions tidak terlalu panjang (<50 lines ideal)

- [ ] **Documentation**
  - [ ] Complex functions punya comments yang jelas
  - [ ] TODO comments sudah di-resolve atau dijadwalkan
  - [ ] Public APIs punya dartdoc comments

#### ✅ **Flutter-Specific Quality**

- [ ] **Widget Structure**
  - [ ] Widget hierarchy tidak terlalu dalam (<10 levels)
  - [ ] Menggunakan `const` constructor where possible
  - [ ] StatelessWidget untuk UI yang tidak berubah
  - [ ] StatefulWidget hanya untuk state yang benar-benar perlu

- [ ] **State Management**
  - [ ] setState() hanya dipanggil ketika perlu
  - [ ] State tidak leak (dispose resources properly)
  - [ ] Tidak ada setState() after dispose()

- [ ] **Performance**
  - [ ] ListView.builder() untuk long lists
  - [ ] Image optimization (size, format)
  - [ ] Tidak ada heavy operations di build() methods

#### ✅ **Error Handling**
- [ ] Async operations punya proper error handling
- [ ] User-facing errors punya messages yang jelas
- [ ] Network calls punya timeout dan retry logic
- [ ] Form validation implemented

---

## 👥 Peer Review Guidelines

### **For Reviewers**

#### 🎯 **Review Focus Areas**

**1. Functionality (30%)**
- [ ] Code melakukan apa yang seharusnya dilakukan
- [ ] Edge cases sudah ditangani
- [ ] Business logic benar
- [ ] Integration dengan existing code smooth

**2. Code Quality (25%)**
- [ ] Readable dan maintainable
- [ ] Follows Flutter/Dart conventions
- [ ] Proper abstraction levels
- [ ] No code smells

**3. Performance (20%)**
- [ ] No unnecessary rebuilds
- [ ] Efficient algorithms
- [ ] Memory usage optimal
- [ ] UI responsiveness

**4. Testing (15%)**
- [ ] Unit tests untuk business logic
- [ ] Widget tests untuk UI components
- [ ] Integration tests untuk critical flows
- [ ] Test coverage adequate

**5. Security (10%)**
- [ ] No sensitive data exposed
- [ ] Input validation implemented
- [ ] Safe data handling
- [ ] Permissions handled properly

#### 💬 **Review Comments Style**

**✅ Good Comment Examples:**
```
"Consider using ListView.builder() here for better performance with large datasets"

"This function is doing too much. Consider splitting into smaller functions for better readability"

"Great use of const constructors! This will help with performance"

"Missing null check here - this could cause runtime errors"
```

**❌ Bad Comment Examples:**
```
"This is wrong"
"Bad code"
"Fix this"
"I don't like this"
```

#### 🎨 **Comment Templates**

**Suggestion:**
```markdown
💡 **Suggestion:** Consider using `SingleChildScrollView` to prevent overflow issues on smaller screens.

**Why:** This will make the UI more responsive across different device sizes.
```

**Issue:**
```markdown
⚠️ **Issue:** Potential memory leak - StreamSubscription not cancelled in dispose()

**Fix:** Add `subscription?.cancel()` in the dispose() method.
```

**Praise:**
```markdown
🎉 **Great work:** Excellent use of Provider pattern for state management!

**Impact:** This makes the code much more maintainable and testable.
```

---

## ⭐ Code Quality Criteria

### **Rating Scale (1-5)**

#### **5 - Excellent**
- [ ] Follows all best practices
- [ ] High test coverage (>80%)
- [ ] Self-documenting code
- [ ] Performance optimized
- [ ] Zero technical debt

#### **4 - Good**
- [ ] Follows most best practices
- [ ] Good test coverage (>60%)
- [ ] Well documented
- [ ] Good performance
- [ ] Minimal technical debt

#### **3 - Acceptable**
- [ ] Follows basic conventions
- [ ] Some test coverage (>40%)
- [ ] Basic documentation
- [ ] Acceptable performance
- [ ] Some technical debt

#### **2 - Needs Improvement**
- [ ] Inconsistent conventions
- [ ] Low test coverage (<40%)
- [ ] Poor documentation
- [ ] Performance issues
- [ ] Significant technical debt

#### **1 - Poor**
- [ ] Ignores conventions
- [ ] No tests
- [ ] No documentation
- [ ] Major performance issues
- [ ] High technical debt

---

## ⚡ Performance Review

### **Performance Checklist**

#### 📱 **UI Performance**
- [ ] **Frame Rate:** Maintains 60 FPS during normal usage
- [ ] **Build Methods:** No heavy computations in build()
- [ ] **Widget Rebuilds:** Minimal unnecessary rebuilds
- [ ] **Image Loading:** Efficient image caching and sizing
- [ ] **Animations:** Smooth and performant animations

#### 🚀 **App Performance**
- [ ] **Startup Time:** App starts in <3 seconds
- [ ] **Memory Usage:** No memory leaks detected
- [ ] **CPU Usage:** Efficient algorithm usage
- [ ] **Network:** Proper caching and error handling
- [ ] **Storage:** Efficient data persistence

#### 🔧 **Performance Testing**
```bash
# Run performance tests
flutter run --profile
flutter run --trace-startup

# Profile memory usage
flutter run --profile --trace-skia

# Check app size
flutter build apk --analyze-size
```

---

## 🔒 Security Review

### **Security Checklist**

#### 🛡️ **Data Security**
- [ ] **Sensitive Data:** No hardcoded passwords/API keys
- [ ] **Local Storage:** Sensitive data encrypted
- [ ] **Network:** HTTPS only for production
- [ ] **Validation:** All user inputs validated
- [ ] **Authentication:** Secure auth implementation

#### 🔐 **Code Security**
- [ ] **Dependencies:** No known vulnerabilities
- [ ] **Permissions:** Minimal required permissions
- [ ] **Debugging:** Debug info disabled in release
- [ ] **Logging:** No sensitive data in logs
- [ ] **Obfuscation:** Code obfuscated for release

---

## 📝 Review Templates

### **Self-Review Template**
```markdown
## Self-Review Checklist

### Changes Made
- [ ] Feature A implemented
- [ ] Bug B fixed
- [ ] Performance improvement C

### Testing Done
- [ ] Unit tests: X files
- [ ] Widget tests: Y widgets
- [ ] Manual testing: Z scenarios

### Code Quality
- [ ] Naming conventions followed
- [ ] No duplicate code
- [ ] Proper error handling
- [ ] Performance considerations

### Questions/Concerns
- [ ] Question about implementation X
- [ ] Need feedback on approach Y
```

### **Peer Review Template**
```markdown
## Peer Review

### Summary
Brief description of changes and overall assessment.

### Strengths
- Good use of design patterns
- Excellent test coverage
- Clear documentation

### Suggestions for Improvement
- Consider refactoring function X
- Add error handling for case Y
- Performance optimization for Z

### Questions
- Why did you choose approach A over B?
- Have you considered edge case C?

### Overall Rating: 4/5
**Recommendation:** Approve with minor changes
```

---

## 🎯 Review Best Practices

### **For Authors**
1. **Small PRs:** Keep changes focused and small
2. **Self-Review First:** Review your own code before requesting review
3. **Context:** Provide clear description and context
4. **Tests:** Include relevant tests
5. **Responsive:** Address feedback promptly

### **For Reviewers**
1. **Timely:** Review within 24-48 hours
2. **Constructive:** Provide helpful, actionable feedback
3. **Thorough:** Check functionality, code quality, and performance
4. **Respectful:** Be kind and professional
5. **Learning:** Use reviews as learning opportunities

### **For Teams**
1. **Standards:** Establish clear coding standards
2. **Templates:** Use consistent review templates
3. **Process:** Define clear review process
4. **Tools:** Use appropriate review tools
5. **Culture:** Foster positive review culture

---

<div align="center">

### 🤝 **Quality Code Through Great Reviews**

Remember: Code reviews are for learning, not judging. Be kind, be helpful, be thorough.

[⬅️ Back to Main Tutorial](../README.md) | [🛠️ Troubleshooting Matrix](troubleshooting-matrix.md)

</div>
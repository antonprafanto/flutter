# 📚 Materi Pembelajaran Minggu 3
## 🎭 Pemrograman Berorientasi Objek (OOP) di Dart

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![OOP](https://img.shields.io/badge/OOP-Concepts-purple?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-orange?style=for-the-badge)

---

## 🎯 Tujuan Pembelajaran

Setelah mempelajari materi ini, Anda akan mampu:

1. **🏗️ Memodelkan** entitas dunia nyata menggunakan kelas dan objek
2. **🔒 Menerapkan** prinsip-prinsip inti enkapsulasi, pewarisan, dan polimorfisme di Dart
3. **⚡ Memanfaatkan** fitur OOP Dart tingkat lanjut seperti kelas abstrak, interface, dan mixin
4. **🎨 Mengimplementasikan** pola desain yang baik dalam pengembangan aplikasi

---

## 📋 Daftar Isi

1. [🎭 Pengenalan OOP: Konsep Inti](#-pengenalan-oop-konsep-inti)
2. [🏗️ Kelas di Dart: Membangun Blueprint](#️-kelas-di-dart-membangun-blueprint)
3. [🔒 Enkapsulasi: Melindungi Data](#-enkapsulasi-melindungi-data)
4. [🧬 Pewarisan: Membangun Hierarki](#-pewarisan-membangun-hierarki)
5. [🎨 Polimorfisme: Satu Interface, Banyak Bentuk](#-polimorfisme-satu-interface-banyak-bentuk)
6. [📝 Kelas dan Metode Abstrak](#-kelas-dan-metode-abstrak)
7. [🔌 Interface: Kontrak untuk Implementasi](#-interface-kontrak-untuk-implementasi)
8. [🧩 Mixin: Penggunaan Kembali Kode](#-mixin-penggunaan-kembali-kode)
9. [🧪 Praktikum 3: Memodelkan Sistem Sederhana](#-praktikum-3-memodelkan-sistem-sederhana)

---

## 🎭 Pengenalan OOP: Konsep Inti

### 💡 Apa itu OOP?

Pemrograman Berorientasi Objek (OOP) adalah paradigma pemrograman yang mengorganisir kode di sekitar objek, bukan fungsi. Bayangkan OOP seperti cara kita memahami dunia nyata - kita melihat benda-benda yang memiliki karakteristik (properties) dan dapat melakukan sesuatu (methods).

### 🔑 Konsep Dasar OOP

💻 **Contoh Sederhana:**
```dart
// Mari kita mulai dengan contoh sederhana - sebuah Mobil
void main() {
  // Dalam dunia nyata, mobil memiliki:
  // - Karakteristik: warna, merk, kecepatan
  // - Kemampuan: menyala, berjalan, berhenti
  
  print('=== Konsep OOP Sederhana ===');
  print('Kita akan membuat class Mobil');
}
```

📋 **Penjelasan Konsep:**
```
🎯 Konsep OOP dalam Kehidupan Nyata
  ↓
1️⃣ Object = Benda nyata (mobil, orang, buku)
  ↓
2️⃣ Class = Blueprint/cetakan untuk membuat object
  ↓
3️⃣ Properties = Karakteristik object (warna, nama, ukuran)
  ↓
4️⃣ Methods = Kemampuan/aksi object (berjalan, berbicara, membuka)
  ↓
✅ OOP = Meniru cara kita memahami dunia nyata dalam kode!
```

🚀 **Coba Sekarang!** 
Jalankan kode di atas di: https://zapp.run/

---

## 🏗️ Kelas di Dart: Membangun Blueprint

### 📐 Mendefinisikan Kelas

Kelas adalah cetak biru untuk membuat objek. Seperti blueprint rumah yang digunakan untuk membangun rumah yang sebenarnya.

💻 **Kelas Sederhana:**
```dart
class Mobil {
  // Properties (karakteristik mobil)
  String merk = '';
  String warna = '';
  int kecepatan = 0;
  
  // Methods (kemampuan mobil)
  void nyalakan() {
    print('Mobil $merk dinyalakan!');
  }
  
  void bergerak(int kecepatanBaru) {
    kecepatan = kecepatanBaru;
    print('Mobil bergerak dengan kecepatan $kecepatan km/jam');
  }
  
  void berhenti() {
    kecepatan = 0;
    print('Mobil berhenti');
  }
}

void main() {
  // Membuat object dari class Mobil
  Mobil mobilSaya = Mobil();
  
  // Mengatur properties
  mobilSaya.merk = 'Toyota';
  mobilSaya.warna = 'Merah';
  
  // Menggunakan methods
  mobilSaya.nyalakan();
  mobilSaya.bergerak(60);
  mobilSaya.berhenti();
}
```

📋 **Eksekusi Code Line-by-Line:**
```
🎯 MULAI: Program eksekusi dimulai dari main()
  ↓
1️⃣ Line: Mobil mobilSaya = Mobil();
   → Dart memanggil constructor default Mobil()
   → Memory dialokasikan untuk object baru
   → Properties diinisialisasi: merk = '', warna = '', kecepatan = 0
   → Reference object disimpan di variable mobilSaya
   → State: mobilSaya = {merk: '', warna: '', kecepatan: 0}
  ↓
2️⃣ Line: mobilSaya.merk = 'Toyota';
   → Dart mengakses property merk dari object mobilSaya
   → Assignment: property merk diubah dari '' menjadi 'Toyota'
   → State: mobilSaya = {merk: 'Toyota', warna: '', kecepatan: 0}
  ↓
3️⃣ Line: mobilSaya.warna = 'Merah';
   → Assignment: property warna diubah dari '' menjadi 'Merah'
   → State: mobilSaya = {merk: 'Toyota', warna: 'Merah', kecepatan: 0}
  ↓
4️⃣ Line: mobilSaya.nyalakan();
   → Method nyalakan() dipanggil pada object mobilSaya
   → Dart membaca mobilSaya.merk = 'Toyota'
   → String interpolation: 'Mobil Toyota dinyalakan!'
   → print() menampilkan ke console
   → Output: "Mobil Toyota dinyalakan!"
  ↓
✅ SELESAI: Object mobilSaya siap dengan state lengkap
```

🚀 **Coba Sekarang!** 
Copy kode di atas dan eksperimen di: https://zapp.run/

### 🔧 Constructor: Menginisialisasi Object

Constructor adalah method khusus yang dipanggil saat object dibuat. Seperti saat kita merakit mobil di pabrik - langsung diberi spesifikasi awal.

💻 **Constructor Sederhana:**
```dart
class Siswa {
  String nama;
  int umur;
  String kelas;
  
  // Constructor - dipanggil saat object dibuat
  Siswa(this.nama, this.umur, this.kelas);
  
  void perkenalan() {
    print('Halo! Nama saya $nama, umur $umur tahun, kelas $kelas');
  }
  
  void belajar(String mataPelajaran) {
    print('$nama sedang belajar $mataPelajaran');
  }
}

void main() {
  // Membuat object dengan constructor
  Siswa siswa1 = Siswa('Alice', 16, '10A');
  Siswa siswa2 = Siswa('Bob', 17, '11B');
  
  siswa1.perkenalan();
  siswa1.belajar('Matematika');
  
  siswa2.perkenalan();
  siswa2.belajar('Fisika');
}
```

📋 **Alur Constructor:**
```
🎯 START: Siswa('Alice', 16, '10A')
  ↓
1️⃣ Constructor dipanggil dengan parameter
  ↓
2️⃣ this.nama = 'Alice' (assign parameter ke property)
  ↓
3️⃣ this.umur = 16 (assign parameter ke property)
  ↓
4️⃣ this.kelas = '10A' (assign parameter ke property)
  ↓
5️⃣ Object siswa1 selesai dibuat dengan data lengkap
  ↓
✅ Object siap digunakan dengan data awal!
```

🚀 **Coba Sekarang!** 
Test constructor di: https://zapp.run/

### 🎨 Named Constructor

Named constructor memberikan cara alternatif untuk membuat object dengan pola inisialisasi yang berbeda.

💻 **Named Constructor:**
```dart
class Persegi {
  double panjang;
  double lebar;
  
  // Constructor utama
  Persegi(this.panjang, this.lebar);
  
  // Named constructor untuk persegi sama sisi
  Persegi.kotak(double sisi) : panjang = sisi, lebar = sisi;
  
  // Named constructor untuk persegi dengan nilai default
  Persegi.standard() : panjang = 10, lebar = 10;
  
  double hitungLuas() {
    return panjang * lebar;
  }
  
  void tampilkanInfo() {
    print('Persegi: ${panjang}x${lebar}, Luas: ${hitungLuas()}');
  }
}

void main() {
  // Berbagai cara membuat object Persegi
  Persegi persegi1 = Persegi(15, 10);     // Constructor biasa
  Persegi persegi2 = Persegi.kotak(8);    // Named constructor
  Persegi persegi3 = Persegi.standard();  // Named constructor
  
  persegi1.tampilkanInfo();
  persegi2.tampilkanInfo();
  persegi3.tampilkanInfo();
}
```

📋 **Eksekusi Named Constructor Persegi.kotak(8):**
```
🎯 MULAI: Pemanggilan Persegi.kotak(8)
   → Parameter sisi = 8 (double)
   → Named constructor 'kotak' dipanggil
  ↓
1️⃣ Initializer list dieksekusi sebelum constructor body
   → panjang = sisi → panjang = 8
   → lebar = sisi → lebar = 8
   → State sementara: {panjang: 8, lebar: 8}
  ↓
2️⃣ Memory allocation untuk object Persegi
   → Dart mengalokasikan ruang untuk object baru
   → Properties panjang dan lebar dibuat dalam memory
  ↓
3️⃣ Properties assignment dari initializer list
   → object.panjang = 8 (dari initializer)
   → object.lebar = 8 (dari initializer)
   → Final object state: {panjang: 8, lebar: 8}
  ↓
4️⃣ Constructor body dieksekusi (kosong dalam case ini)
   → Tidak ada code tambahan untuk dieksekusi
  ↓
5️⃣ Return object reference ke variable persegi2
   → Object Persegi dengan panjang=8, lebar=8 dibuat
   → Reference disimpan: persegi2 = object reference
  ↓
✅ RESULT: Persegi kotak 8x8 siap digunakan dengan luas 64
```

🚀 **Coba Sekarang!** 
Eksperimen dengan named constructor di: https://zapp.run/

---

## 🔒 Enkapsulasi: Melindungi Data

### 🛡️ Private Properties dengan Underscore

Enkapsulasi melindungi data internal object dari akses langsung. Di Dart, kita menggunakan underscore (_) untuk membuat property private.

💻 **Enkapsulasi Sederhana:**
```dart
class RekeningBank {
  String _nomorRekening; // Private - tidak bisa diakses langsung
  String pemilik;        // Public - bisa diakses langsung
  double _saldo;         // Private - dilindungi
  
  RekeningBank(this._nomorRekening, this.pemilik, this._saldo);
  
  // Getter untuk mengakses saldo (read-only)
  double get saldo => _saldo;
  
  // Getter untuk nomor rekening
  String get nomorRekening => _nomorRekening;
  
  // Method untuk menambah saldo (controlled access)
  void setor(double jumlah) {
    if (jumlah > 0) {
      _saldo += jumlah;
      print('Setor Rp${jumlah}. Saldo sekarang: Rp${_saldo}');
    } else {
      print('Jumlah setor harus positif!');
    }
  }
  
  // Method untuk mengurangi saldo dengan validasi
  bool tarik(double jumlah) {
    if (jumlah > 0 && jumlah <= _saldo) {
      _saldo -= jumlah;
      print('Tarik Rp${jumlah}. Saldo sekarang: Rp${_saldo}');
      return true;
    } else {
      print('Penarikan gagal! Saldo tidak cukup atau jumlah invalid.');
      return false;
    }
  }
}

void main() {
  RekeningBank rekening = RekeningBank('123456', 'Alice', 1000);
  
  // Akses data melalui getter dan method
  print('Pemilik: ${rekening.pemilik}');
  print('Nomor: ${rekening.nomorRekening}');
  print('Saldo: Rp${rekening.saldo}');
  
  // Operasi dengan validasi
  rekening.setor(500);
  rekening.tarik(200);
  rekening.tarik(2000); // Akan gagal
  
  // rekening._saldo = 10000; // Error! Tidak bisa akses private
}
```

📋 **Eksekusi Method tarik(200) dengan Enkapsulasi:**
```
🎯 MULAI: rekening.tarik(200) dipanggil
   → Object state awal: _saldo = 1000.0, _nomorRekening = '123456'
   → Parameter jumlah = 200.0 (double)
  ↓
1️⃣ Method tarik() mulai eksekusi dalam scope object
   → Dart mengakses private variable _saldo = 1000.0
   → Parameter jumlah = 200.0 tersedia dalam method scope
  ↓
2️⃣ Evaluasi kondisi validasi: if (jumlah > 0 && jumlah <= _saldo)
   → jumlah > 0: 200.0 > 0 → true
   → jumlah <= _saldo: 200.0 <= 1000.0 → true
   → Logical AND: true && true → true
   → Kondisi terpenuhi, masuk ke if block
  ↓
3️⃣ Eksekusi: _saldo -= jumlah;
   → Current _saldo: 1000.0
   → Operasi aritmetika: 1000.0 - 200.0 = 800.0
   → Assignment: _saldo = 800.0 (private variable updated)
   → Object state: _saldo = 800.0 (terlindungi dari akses langsung)
  ↓
4️⃣ String interpolation dan print():
   → Dart membaca _saldo = 800.0 untuk interpolation
   → String: 'Tarik Rp200.0. Saldo sekarang: Rp800.0'
   → print() menampilkan pesan ke console
  ↓
5️⃣ Method return: return true;
   → Boolean value true dikembalikan ke caller
   → Method execution selesai
  ↓
✅ RESULT: _saldo = 800.0 (aman), return value = true
   → Data internal terlindungi, hanya bisa diubah melalui method
```

🚀 **Coba Sekarang!** 
Test enkapsulasi di: https://zapp.run/

### 🎛️ Getter dan Setter

Getter dan setter memberikan kontrol yang lebih baik terhadap akses property.

💻 **Getter dan Setter:**
```dart
class Suhu {
  double _celsius = 0;
  
  // Getter untuk Celsius
  double get celsius => _celsius;
  
  // Setter untuk Celsius dengan validasi
  set celsius(double nilai) {
    if (nilai >= -273.15) { // Suhu absolute zero
      _celsius = nilai;
    } else {
      print('Suhu tidak boleh di bawah -273.15°C!');
    }
  }
  
  // Getter untuk Fahrenheit (computed property)
  double get fahrenheit => (_celsius * 9/5) + 32;
  
  // Setter untuk Fahrenheit
  set fahrenheit(double nilai) {
    celsius = (nilai - 32) * 5/9; // Konversi ke Celsius
  }
  
  // Getter untuk Kelvin (computed property)
  double get kelvin => _celsius + 273.15;
  
  void tampilkanSemua() {
    print('Celsius: ${celsius.toStringAsFixed(1)}°C');
    print('Fahrenheit: ${fahrenheit.toStringAsFixed(1)}°F');
    print('Kelvin: ${kelvin.toStringAsFixed(1)}K');
  }
}

void main() {
  Suhu suhu = Suhu();
  
  // Menggunakan setter (seperti assignment biasa)
  suhu.celsius = 25;
  suhu.tampilkanSemua();
  
  print('\n--- Ubah lewat Fahrenheit ---');
  suhu.fahrenheit = 100; // 100°F
  suhu.tampilkanSemua();
  
  print('\n--- Test validasi ---');
  suhu.celsius = -300; // Akan ditolak
  suhu.tampilkanSemua();
}
```

📋 **Eksekusi Setter dan Getter: suhu.celsius = 25**
```
🎯 MULAI: suhu.celsius = 25 (setter assignment)
   → Object state awal: _celsius = 0.0
   → Assignment value: 25.0 (double)
  ↓
1️⃣ Setter celsius(double nilai) dipanggil
   → Parameter nilai = 25.0 diterima oleh setter
   → Method scope: celsius setter active
  ↓
2️⃣ Validasi dalam setter: if (nilai >= -273.15)
   → nilai >= -273.15: 25.0 >= -273.15 → true
   → Validasi lolos, lanjutkan assignment
   → (Jika gagal, akan print error dan tidak ada assignment)
  ↓
3️⃣ Assignment: _celsius = nilai;
   → Private variable _celsius diubah dari 0.0 ke 25.0
   → Object state update: _celsius = 25.0
  ↓
4️⃣ Getter fahrenheit dipanggil: suhu.fahrenheit
   → Computed property: get fahrenheit => (_celsius * 9/5) + 32
   → Dart membaca _celsius = 25.0
   → Perhitungan: (25.0 * 9/5) + 32 = 45.0 + 32 = 77.0
   → Return value: 77.0 (tidak disimpan, selalu dihitung ulang)
  ↓
5️⃣ Getter kelvin dipanggil: suhu.kelvin  
   → Computed property: get kelvin => _celsius + 273.15
   → Dart membaca _celsius = 25.0
   → Perhitungan: 25.0 + 273.15 = 298.15
   → Return value: 298.15
  ↓
✅ RESULT: _celsius = 25.0, fahrenheit = 77.0, kelvin = 298.15
   → Satu perubahan data, tiga representasi berbeda tersedia
```

🚀 **Coba Sekarang!** 
Mainkan dengan getter/setter di: https://zapp.run/

---

## 🧬 Pewarisan: Membangun Hierarki

### 👨‍👩‍👧‍👦 Konsep Inheritance dengan extends

Pewarisan memungkinkan class baru mewarisi properties dan methods dari class yang sudah ada. Seperti anak yang mewarisi sifat dari orang tua.

💻 **Inheritance Sederhana:**
```dart
// Parent class (superclass)
class Hewan {
  String nama;
  int umur;
  
  Hewan(this.nama, this.umur);
  
  void makan() {
    print('$nama sedang makan');
  }
  
  void tidur() {
    print('$nama sedang tidur');
  }
  
  void info() {
    print('Nama: $nama, Umur: $umur tahun');
  }
}

// Child class yang mewarisi dari Hewan
class Kucing extends Hewan {
  String warnaBulu;
  
  // Constructor child harus memanggil super
  Kucing(String nama, int umur, this.warnaBulu) : super(nama, umur);
  
  // Method khusus kucing
  void meong() {
    print('$nama berkata: Meong!');
  }
  
  void bermain() {
    print('$nama bermain dengan bola benang');
  }
  
  // Override method dari parent
  @override
  void info() {
    super.info(); // Panggil method parent
    print('Warna bulu: $warnaBulu');
  }
}

class Anjing extends Hewan {
  String ras;
  
  Anjing(String nama, int umur, this.ras) : super(nama, umur);
  
  void gonggong() {
    print('$nama berkata: Guk guk!');
  }
  
  void jaga() {
    print('$nama sedang menjaga rumah');
  }
  
  @override
  void info() {
    super.info();
    print('Ras: $ras');
  }
}

void main() {
  Kucing kucingku = Kucing('Mimi', 2, 'Orange');
  Anjing anjingku = Anjing('Bobby', 3, 'Golden Retriever');
  
  print('=== Info Kucing ===');
  kucingku.info();      // Method yang di-override
  kucingku.makan();     // Method yang diwarisi
  kucingku.meong();     // Method khusus kucing
  
  print('\n=== Info Anjing ===');
  anjingku.info();      // Method yang di-override
  anjingku.tidur();     // Method yang diwarisi
  anjingku.gonggong();  // Method khusus anjing
}
```

📋 **Eksekusi Inheritance: Kucing('Mimi', 2, 'Orange')**
```
🎯 MULAI: Kucing('Mimi', 2, 'Orange') constructor dipanggil
   → Parameter nama = 'Mimi', umur = 2, warnaBulu = 'Orange'
  ↓
1️⃣ Child constructor Kucing() mulai eksekusi
   → Parameter warnaBulu = 'Orange' disimpan untuk child class
   → Preparation untuk memanggil super constructor
  ↓
2️⃣ Super constructor call: super('Mimi', 2)
   → Control flow pindah ke parent class Hewan constructor
   → Parent constructor Hewan('Mimi', 2) dieksekusi
   → this.nama = 'Mimi' (property inheritance dari parent)
   → this.umur = 2 (property inheritance dari parent)
   → Parent initialization selesai
  ↓
3️⃣ Kembali ke child constructor Kucing
   → Child-specific property: this.warnaBulu = 'Orange'
   → Object state: {nama: 'Mimi', umur: 2, warnaBulu: 'Orange'}
  ↓
4️⃣ Method inheritance otomatis terjadi
   → Kucing mewarisi method makan() dari Hewan
   → Kucing mewarisi method tidur() dari Hewan
   → Kucing mewarisi method info() dari Hewan (akan di-override)
   → Kucing memiliki method sendiri: meong(), bermain()
  ↓
5️⃣ Object Kucing siap dengan inheritance lengkap
   → Object memiliki properties: nama, umur (inherited) + warnaBulu (own)
   → Object memiliki methods: makan, tidur (inherited) + meong, bermain (own)
  ↓
✅ RESULT: kucingku = Kucing dengan semua properties dan methods
   → Inheritance berhasil: Parent features + Child features
```

🚀 **Coba Sekarang!** 
Eksperimen dengan inheritance di: https://zapp.run/

### 🔄 Method Overriding

Method overriding memungkinkan child class memberikan implementasi baru untuk method yang diwarisi dari parent.

💻 **Method Overriding:**
```dart
class Kendaraan {
  String merk;
  int tahun;
  
  Kendaraan(this.merk, this.tahun);
  
  void start() {
    print('Kendaraan $merk dinyalakan');
  }
  
  void info() {
    print('Kendaraan: $merk ($tahun)');
  }
  
  // Virtual method yang bisa di-override
  String suara() {
    return 'Suara kendaraan';
  }
}

class Motor extends Kendaraan {
  Motor(String merk, int tahun) : super(merk, tahun);
  
  @override
  void start() {
    print('Motor $merk di-kick starter');
  }
  
  @override
  String suara() {
    return 'Brem brem brem!';
  }
}

class Mobil extends Kendaraan {
  Mobil(String merk, int tahun) : super(merk, tahun);
  
  @override
  void start() {
    print('Mobil $merk dinyalakan dengan kunci');
  }
  
  @override
  String suara() {
    return 'Vroooom!';
  }
}

void main() {
  Motor motor = Motor('Honda', 2020);
  Mobil mobil = Mobil('Toyota', 2021);
  
  print('=== Test Override ===');
  motor.info();     // Method yang diwarisi
  motor.start();    // Method yang di-override
  print('Suara: ${motor.suara()}');
  
  print('');
  mobil.info();     // Method yang diwarisi
  mobil.start();    // Method yang di-override
  print('Suara: ${mobil.suara()}');
}
```

📋 **Eksekusi Method Override: motor.start()**
```
🎯 MULAI: motor.start() dipanggil pada object Motor
   → Object type: Motor (extends Kendaraan)
   → Object state: {merk: 'Honda', tahun: 2020}
  ↓
1️⃣ Dart melakukan method lookup untuk start()
   → Dart mengecek class Motor untuk method start()
   → Method start() ditemukan di Motor class dengan @override
   → Motor.start() dipilih (bukan Kendaraan.start())
  ↓
2️⃣ Motor.start() implementation dieksekusi
   → Method body: print('Motor $merk di-kick starter');
   → Dart mengakses property merk = 'Honda' dari object
   → String interpolation: 'Motor Honda di-kick starter'
  ↓
3️⃣ print() function dipanggil
   → Output ke console: "Motor Honda di-kick starter"
   → Method execution selesai
  ↓
4️⃣ Parent method Kendaraan.start() TIDAK dipanggil
   → Override berarti ganti completely, bukan extend
   → Kendaraan.start() yang berisi 'Kendaraan Honda dinyalakan' diabaikan
   → Child implementation menggantikan parent implementation
  ↓
✅ RESULT: Output "Motor Honda di-kick starter"
   → Method overriding berhasil: Child behavior mengganti Parent behavior
```

🚀 **Coba Sekarang!** 
Test method overriding di: https://zapp.run/

---

## 🎨 Polimorfisme: Satu Interface, Banyak Bentuk

### 🎭 Dynamic Dispatch

Polimorfisme memungkinkan object yang berbeda merespons method call yang sama dengan cara yang berbeda.

💻 **Polimorfisme Sederhana:**
```dart
class Bentuk {
  String nama;
  
  Bentuk(this.nama);
  
  // Method yang akan di-override oleh subclass
  double hitungLuas() {
    return 0;
  }
  
  void tampilkan() {
    print('$nama dengan luas: ${hitungLuas()}');
  }
}

class Persegi extends Bentuk {
  double sisi;
  
  Persegi(this.sisi) : super('Persegi');
  
  @override
  double hitungLuas() {
    return sisi * sisi;
  }
}

class Lingkaran extends Bentuk {
  double jariJari;
  
  Lingkaran(this.jariJari) : super('Lingkaran');
  
  @override
  double hitungLuas() {
    return 3.14159 * jariJari * jariJari;
  }
}

class Segitiga extends Bentuk {
  double alas;
  double tinggi;
  
  Segitiga(this.alas, this.tinggi) : super('Segitiga');
  
  @override
  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
}

void main() {
  // List dengan parent reference, child objects
  List<Bentuk> bentukBentuk = [
    Persegi(5),
    Lingkaran(3),
    Segitiga(4, 6),
    Persegi(7),
  ];
  
  print('=== Polimorfisme dalam Action ===');
  
  // Satu loop, banyak implementasi method yang berbeda
  for (Bentuk bentuk in bentukBentuk) {
    bentuk.tampilkan(); // Method yang tepat dipanggil otomatis
  }
  
  // Runtime type checking
  print('\n=== Type Checking ===');
  for (Bentuk bentuk in bentukBentuk) {
    if (bentuk is Persegi) {
      print('${bentuk.nama} adalah persegi dengan sisi ${bentuk.sisi}');
    } else if (bentuk is Lingkaran) {
      print('${bentuk.nama} adalah lingkaran dengan jari-jari ${bentuk.jariJari}');
    }
  }
}
```

📋 **Eksekusi Polymorphism dalam Loop: bentuk.tampilkan()**
```
🎯 MULAI: Loop iterasi 1 - bentuk = Persegi(5)
   → Current object: Persegi dengan sisi = 5
   → Reference type: Bentuk (parent), Actual type: Persegi (child)
  ↓
1️⃣ bentuk.tampilkan() dipanggil
   → Method tampilkan() inherited dari class Bentuk
   → Eksekusi: print('$nama dengan luas: ${hitungLuas()}');
  ↓
2️⃣ Dart evaluasi ${hitungLuas()} - Dynamic Method Dispatch
   → Dart cek runtime type of object = Persegi
   → Dart cari method hitungLuas() di class Persegi
   → Persegi.hitungLuas() ditemukan (override dari Bentuk)
   → Call Persegi.hitungLuas() instead of Bentuk.hitungLuas()
  ↓
3️⃣ Persegi.hitungLuas() dieksekusi
   → Implementation: return sisi * sisi;
   → Calculation: 5 * 5 = 25
   → Return value: 25.0
  ↓
4️⃣ String interpolation dan output
   → nama = 'Persegi', hitungLuas() = 25.0
   → Final string: 'Persegi dengan luas: 25.0'
   → print() output: "Persegi dengan luas: 25.0"
  ↓
5️⃣ Loop iterasi 2 - bentuk = Lingkaran(3)
   → Same tampilkan() method call
   → Runtime dispatch ke Lingkaran.hitungLuas()
   → Calculation: 3.14159 * 3 * 3 = 28.274...
   → Output: "Lingkaran dengan luas: 28.274..."
  ↓
✅ RESULT: Satu interface (tampilkan), banyak implementasi berbeda
   → Runtime type determines which hitungLuas() to call
```

🚀 **Coba Sekarang!** 
Lihat polimorfisme bekerja di: https://zapp.run/

---

## 📝 Kelas dan Metode Abstrak

### 🎯 Abstract Class

Abstract class adalah class yang tidak bisa di-instantiate langsung. Digunakan sebagai template untuk class lain.

💻 **Abstract Class:**
```dart
// Abstract class - tidak bisa dibuat objectnya langsung
abstract class Pegawai {
  String nama;
  String id;
  
  Pegawai(this.nama, this.id);
  
  // Concrete method - ada implementasinya
  void clockIn() {
    print('$nama (ID: $id) mulai bekerja');
  }
  
  void clockOut() {
    print('$nama selesai bekerja');
  }
  
  // Abstract method - harus diimplementasi oleh subclass
  double hitungGaji();
  void kerja();
  
  // Template method - menggunakan abstract methods
  void hariKerja() {
    clockIn();
    kerja();
    print('Gaji hari ini: Rp${hitungGaji()}');
    clockOut();
  }
}

class PegawaiTetap extends Pegawai {
  double gajiPokok;
  
  PegawaiTetap(String nama, String id, this.gajiPokok) : super(nama, id);
  
  @override
  double hitungGaji() {
    return gajiPokok / 30; // Gaji harian
  }
  
  @override
  void kerja() {
    print('$nama bekerja full time (8 jam)');
  }
}

class PegawaiKontrak extends Pegawai {
  double upahPerJam;
  int jamKerja;
  
  PegawaiKontrak(String nama, String id, this.upahPerJam, this.jamKerja) 
      : super(nama, id);
  
  @override
  double hitungGaji() {
    return upahPerJam * jamKerja;
  }
  
  @override
  void kerja() {
    print('$nama bekerja kontrak ($jamKerja jam)');
  }
}

void main() {
  // Pegawai pegawai = Pegawai('Test', '001'); // Error! Abstract class
  
  PegawaiTetap tetap = PegawaiTetap('Alice', 'P001', 6000000);
  PegawaiKontrak kontrak = PegawaiKontrak('Bob', 'P002', 50000, 6);
  
  print('=== Pegawai Tetap ===');
  tetap.hariKerja();
  
  print('\n=== Pegawai Kontrak ===');
  kontrak.hariKerja();
}
```

📋 **Eksekusi Abstract Class: tetap.hariKerja()**
```
🎯 MULAI: tetap.hariKerja() dipanggil pada PegawaiTetap object
   → Object state: {nama: 'Alice', id: 'P001', gajiPokok: 6000000}
   → Object type: PegawaiTetap (extends abstract Pegawai)
  ↓
1️⃣ Method hariKerja() dari abstract class Pegawai dieksekusi
   → Template method yang menggunakan abstract methods
   → Sequence dimulai dengan clockIn()
  ↓
2️⃣ this.clockIn() dipanggil
   → Concrete method dari abstract class Pegawai
   → Dart reads nama = 'Alice', id = 'P001'
   → print('Alice (ID: P001) mulai bekerja')
   → Output: "Alice (ID: P001) mulai bekerja"
  ↓
3️⃣ this.kerja() dipanggil - Abstract Method Resolution
   → kerja() adalah abstract method di Pegawai
   → Dart mencari implementation di runtime type: PegawaiTetap
   → PegawaiTetap.kerja() ditemukan dan dipanggil
   → Implementation: print('Alice bekerja full time (8 jam)')
   → Output: "Alice bekerja full time (8 jam)"
  ↓
4️⃣ this.hitungGaji() dipanggil - Abstract Method Resolution
   → hitungGaji() adalah abstract method di Pegawai
   → Dart call PegawaiTetap.hitungGaji()
   → Implementation: return gajiPokok / 30
   → Calculation: 6000000 / 30 = 200000.0
   → Return value: 200000.0
  ↓
5️⃣ String interpolation dan print dengan hasil gaji
   → print('Gaji hari ini: Rp${hitungGaji()}')
   → String: 'Gaji hari ini: Rp200000.0'
   → Output: "Gaji hari ini: Rp200000.0"
  ↓
6️⃣ this.clockOut() dipanggil
   → Concrete method dari abstract class
   → print('Alice selesai bekerja')
   → Output: "Alice selesai bekerja"
  ↓
✅ RESULT: Template method sukses dengan concrete implementations
   → Abstract class enforces structure, concrete class provides behavior
```

🚀 **Coba Sekarang!** 
Test abstract class di: https://zapp.run/

---

## 🔌 Interface: Kontrak untuk Implementasi

### 📋 Implicit Interface dengan implements

Di Dart, setiap class secara otomatis defines interface. Class lain bisa implement interface ini.

💻 **Interface Implementation:**
```dart
// Class ini akan digunakan sebagai interface
class Terbang {
  void takeOff() {
    print('Lepas landas');
  }
  
  void fly() {
    print('Terbang di udara');
  }
  
  void land() {
    print('Mendarat');
  }
}

class Berenang {
  void dive() {
    print('Menyelam');
  }
  
  void swim() {
    print('Berenang');
  }
  
  void surface() {
    print('Naik ke permukaan');
  }
}

// Class yang implement multiple interfaces
class Bebek implements Terbang, Berenang {
  String nama;
  
  Bebek(this.nama);
  
  // Harus implement SEMUA method dari Terbang
  @override
  void takeOff() {
    print('$nama mengepakkan sayap dan lepas landas');
  }
  
  @override
  void fly() {
    print('$nama terbang rendah di atas air');
  }
  
  @override
  void land() {
    print('$nama mendarat di air dengan mulus');
  }
  
  // Harus implement SEMUA method dari Berenang
  @override
  void dive() {
    print('$nama menyelam mencari ikan');
  }
  
  @override
  void swim() {
    print('$nama berenang dengan kaki berselaput');
  }
  
  @override
  void surface() {
    print('$nama muncul ke permukaan dengan ikan di paruh');
  }
  
  // Method khusus bebek
  void quack() {
    print('$nama berkata: Kwek kwek!');
  }
}

void main() {
  Bebek bebek = Bebek('Donald');
  
  print('=== Kemampuan Terbang ===');
  bebek.takeOff();
  bebek.fly();
  bebek.land();
  
  print('\n=== Kemampuan Berenang ===');
  bebek.dive();
  bebek.swim();
  bebek.surface();
  
  print('\n=== Kemampuan Khusus ===');
  bebek.quack();
  
  // Interface polymorphism
  print('\n=== Interface Polymorphism ===');
  Terbang penerbanganBebek = bebek;
  penerbanganBebek.fly(); // Bebek implementation
  
  Berenang renangBebek = bebek;
  renangBebek.swim(); // Bebek implementation
}
```

📋 **Eksekusi Interface Implementation: bebek.takeOff()**
```
🎯 MULAI: bebek.takeOff() dipanggil pada Bebek object
   → Object state: {nama: 'Donald'}
   → Class Bebek implements Terbang, Berenang interfaces
  ↓
1️⃣ Dart method lookup untuk takeOff()
   → takeOff() adalah method dari interface Terbang
   → Bebek class HARUS provide implementation (implements contract)
   → Bebek.takeOff() ditemukan dan dipanggil
  ↓
2️⃣ Bebek.takeOff() implementation dieksekusi
   → Override dari interface Terbang.takeOff()
   → Method body: print('$nama mengepakkan sayap dan lepas landas');
   → Dart reads nama = 'Donald' dari object state
  ↓
3️⃣ String interpolation dan output
   → String formation: 'Donald mengepakkan sayap dan lepas landas'
   → print() execution
   → Console output: "Donald mengepakkan sayap dan lepas landas"
  ↓
4️⃣ Interface polymorphism demonstration
   → Terbang penerbanganBebek = bebek; (interface reference)
   → penerbanganBebek.fly() calls Bebek.fly() implementation
   → Interface contract fulfilled dengan concrete implementation
  ↓
5️⃣ Multiple interface compliance check
   → Bebek implements Terbang: ✅ takeOff(), fly(), land() ada
   → Bebek implements Berenang: ✅ dive(), swim(), surface() ada
   → All interface contracts satisfied
  ↓
✅ RESULT: Interface implementation successful
   → Bebek menyediakan concrete behavior untuk semua interface methods
   → Object dapat digunakan sebagai Terbang atau Berenang type
```

🚀 **Coba Sekarang!** 
Eksperimen dengan interface di: https://zapp.run/

---

## 🧩 Mixin: Penggunaan Kembali Kode

### 🔄 Mixin dengan with keyword

Mixin memungkinkan sharing code antar class tanpa inheritance tradisional.

💻 **Mixin Sederhana:**
```dart
// Mixin untuk kemampuan debugging
mixin Debuggable {
  void debug(String message) {
    print('[DEBUG] ${DateTime.now()}: $message');
  }
  
  void info(String message) {
    print('[INFO] $message');
  }
  
  void error(String message) {
    print('[ERROR] $message');
  }
}

// Mixin untuk kemampuan validasi
mixin Validatable {
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
  
  bool isValidPhone(String phone) {
    return phone.length >= 10 && phone.length <= 15;
  }
  
  void validate(String field, String value) {
    print('Validating $field: $value');
  }
}

// Class menggunakan multiple mixins
class User with Debuggable, Validatable {
  String name;
  String email;
  String phone;
  
  User(this.name, this.email, this.phone);
  
  void register() {
    debug('Starting user registration');
    
    validate('email', email);
    if (!isValidEmail(email)) {
      error('Invalid email format');
      return;
    }
    
    validate('phone', phone);
    if (!isValidPhone(phone)) {
      error('Invalid phone format');
      return;
    }
    
    info('User $name registered successfully');
  }
  
  void displayInfo() {
    debug('Displaying user info');
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phone');
  }
}

class Product with Debuggable {
  String name;
  double price;
  
  Product(this.name, this.price);
  
  void updatePrice(double newPrice) {
    debug('Updating price for $name');
    double oldPrice = price;
    price = newPrice;
    info('Price updated from \$${oldPrice} to \$${price}');
  }
}

void main() {
  User user = User('Alice', 'alice@email.com', '08123456789');
  Product product = Product('Laptop', 15000000);
  
  print('=== User Registration ===');
  user.register();
  user.displayInfo();
  
  print('\n=== Product Update ===');
  product.updatePrice(14000000);
  
  // Test invalid data
  print('\n=== Invalid User ===');
  User invalidUser = User('Bob', 'invalid-email', '123');
  invalidUser.register();
}
```

📋 **Eksekusi Mixin Usage: user.register()**
```
🎯 MULAI: user.register() dipanggil pada User object
   → Object state: {name: 'Alice', email: 'alice@email.com', phone: '08123456789'}
   → Class User with Debuggable, Validatable mixins
  ↓
1️⃣ user.register() method execution dimulai
   → Method body dieksekusi line by line
   → First line: debug('Starting user registration')
  ↓
2️⃣ debug() method call - Mixin Debuggable
   → debug() method berasal dari mixin Debuggable
   → Dart finds debug() in Debuggable mixin yang di-mixed ke User
   → Parameter message = 'Starting user registration'
   → DateTime.now() = current timestamp
   → print('[DEBUG] 2024-01-15 10:30:45: Starting user registration')
  ↓
3️⃣ validate() method call - Mixin Validatable  
   → validate('email', email) dipanggil
   → email = 'alice@email.com' dari object state
   → validate() method dari mixin Validatable dieksekusi
   → print('Validating email: alice@email.com')
  ↓
4️⃣ isValidEmail() method call - Mixin Validatable
   → isValidEmail(email) dengan email = 'alice@email.com'
   → Logic: email.contains('@') && email.contains('.')
   → 'alice@email.com'.contains('@') → true
   → 'alice@email.com'.contains('.') → true
   → Return value: true && true = true
  ↓
5️⃣ Conditional logic: if (!isValidEmail(email))
   → !true = false
   → Condition false, skip error() call dan return
   → Continue ke phone validation
  ↓
6️⃣ Phone validation dengan mixin methods
   → isValidPhone('08123456789') dipanggil
   → Length check: '08123456789'.length = 11
   → Validation: 11 >= 10 && 11 <= 15 → true
   → Phone valid, continue execution
  ↓
7️⃣ info() method call - Mixin Debuggable
   → info('User Alice registered successfully')
   → print('[INFO] User Alice registered successfully')
  ↓
✅ RESULT: Mixin methods successfully used across the workflow
   → User class mendapat functionality dari 2 mixins tanpa inheritance
   → Code reuse achieved melalui mixin composition
```

🚀 **Coba Sekarang!** 
Test mixin di: https://zapp.run/

### 🎯 Mixin dengan Constraints

Mixin bisa dibatasi hanya untuk class tertentu menggunakan `on` keyword.

💻 **Mixin Constraints:**
```dart
// Base class
class Animal {
  String name;
  
  Animal(this.name);
  
  void breathe() {
    print('$name is breathing');
  }
}

// Mixin dengan constraint - hanya bisa digunakan oleh Animal
mixin Walker on Animal {
  void walk() {
    print('$name is walking');
    breathe(); // Bisa akses method dari Animal
  }
  
  void run() {
    print('$name is running fast');
  }
}

mixin Swimmer on Animal {
  void swim() {
    print('$name is swimming');
    breathe(); // Bisa akses method dari Animal
  }
  
  void dive() {
    print('$name dives underwater');
  }
}

// Class yang menggunakan constraint mixins
class Dog extends Animal with Walker {
  Dog(String name) : super(name);
  
  void bark() {
    print('$name barks: Woof!');
  }
}

class Dolphin extends Animal with Swimmer {
  Dolphin(String name) : super(name);
  
  void echolocation() {
    print('$name uses echolocation');
  }
}

class Duck extends Animal with Walker, Swimmer {
  Duck(String name) : super(name);
  
  void quack() {
    print('$name quacks: Kwek kwek!');
  }
}

void main() {
  Dog dog = Dog('Buddy');
  Dolphin dolphin = Dolphin('Flipper');
  Duck duck = Duck('Donald');
  
  print('=== Dog Capabilities ===');
  dog.breathe(); // From Animal
  dog.walk();    // From Walker mixin
  dog.run();     // From Walker mixin
  dog.bark();    // Own method
  
  print('\n=== Dolphin Capabilities ===');
  dolphin.breathe(); // From Animal
  dolphin.swim();    // From Swimmer mixin
  dolphin.dive();    // From Swimmer mixin
  dolphin.echolocation(); // Own method
  
  print('\n=== Duck Capabilities ===');
  duck.breathe(); // From Animal
  duck.walk();    // From Walker mixin
  duck.swim();    // From Swimmer mixin
  duck.quack();   // Own method
}
```

📋 **Eksekusi Mixin Constraint: duck.walk()**
```
🎯 MULAI: duck.walk() dipanggil pada Duck object
   → Object state: {name: 'Donald'} (inherited dari Animal)
   → Class Duck extends Animal with Walker, Swimmer
   → Mixin Walker on Animal constraint satisfied
  ↓
1️⃣ Dart verifikasi mixin constraint saat compilation
   → Mixin Walker memiliki constraint: on Animal
   → Duck extends Animal ✅ constraint satisfied
   → Walker methods tersedia untuk Duck class
  ↓
2️⃣ duck.walk() method call - dari mixin Walker
   → Method walk() berasal dari mixin Walker
   → Dart finds walk() in Walker mixin yang valid untuk Duck
   → Method dapat akses Animal properties karena constraint
  ↓
3️⃣ Walker.walk() implementation dieksekusi
   → Method body: print('$name is walking');
   → Dart reads name = 'Donald' dari inherited Animal property
   → String interpolation: 'Donald is walking'
   → print() output: "Donald is walking"
  ↓
4️⃣ Walker.walk() calls breathe() - Constraint Access
   → breathe() method dari Animal base class
   → Mixin Walker bisa akses Animal methods karena 'on Animal' constraint
   → this.breathe() dipanggil pada Duck object
   → Animal.breathe() dieksekusi: print('Donald is breathing')
  ↓
5️⃣ Type safety verification
   → Jika Duck tidak extends Animal → Compile Error!
   → Constraint 'on Animal' memastikan Walker hanya digunakan dengan Animal
   → Mixin bisa safely akses Animal properties dan methods
  ↓
6️⃣ Multiple mixin with same constraint
   → Duck juga menggunakan Swimmer mixin (juga 'on Animal')
   → Kedua mixin bisa akses Animal functionality
   → duck.swim() dan duck.breathe() juga valid
  ↓
✅ RESULT: Mixin constraint enforcement successful
   → Type safety maintained: Walker hanya untuk Animal subclasses
   → Mixin dapat safely akses base class members
```

🚀 **Coba Sekarang!** 
Eksperimen dengan mixin constraints di: https://zapp.run/

---

## 🧪 Praktikum 3: Memodelkan Sistem Sederhana

### 🎯 Objektif Praktikum

Pada praktikum ini, Anda akan menerapkan semua konsep OOP yang telah dipelajari dengan membuat sistem yang saling terkait. Setiap tantangan membangun dari yang sebelumnya dengan kompleksitas yang meningkat.

### 💳 Tantangan 1: Sistem Kartu Bank

Buat hierarki class untuk sistem kartu bank dengan menggunakan inheritance dan polymorphism.

💻 **Template Dasar:**
```dart
// TODO: Lengkapi sistem kartu bank ini

abstract class BankCard {
  String cardNumber;
  String holderName;
  DateTime expiryDate;
  double limit;
  double _balance;
  
  BankCard(this.cardNumber, this.holderName, this.expiryDate, this.limit) 
      : _balance = 0;
  
  double get balance => _balance;
  
  // Abstract method - harus diimplementasi subclass
  bool processPayment(double amount);
  double calculateFee(double amount);
  
  // Concrete method
  bool isExpired() {
    return DateTime.now().isAfter(expiryDate);
  }
  
  void displayInfo() {
    print('Card: $cardNumber');
    print('Holder: $holderName');
    print('Balance: \$${balance.toStringAsFixed(2)}');
    print('Limit: \$${limit.toStringAsFixed(2)}');
  }
}

class CreditCard extends BankCard {
  double interestRate;
  
  // TODO: Implement constructor
  // TODO: Implement processPayment with credit logic
  // TODO: Implement calculateFee with interest calculation
}

class DebitCard extends BankCard {
  // TODO: Implement constructor
  // TODO: Implement processPayment with debit logic
  // TODO: Implement calculateFee (usually no fee)
  
  void addFunds(double amount) {
    // TODO: Implement adding funds to debit card
  }
}

void main() {
  // TODO: Test your implementation
  // Create different types of cards
  // Test payment processing
  // Test fee calculations
  // Demonstrate polymorphism
}
```

📋 **Petunjuk Implementasi:**
```
🎯 Implementasi Sistem Kartu Bank
  ↓
1️⃣ CreditCard: processPayment() bisa lebih dari balance (kredit)
  ↓
2️⃣ DebitCard: processPayment() tidak boleh lebih dari balance
  ↓
3️⃣ CreditCard: calculateFee() berdasarkan interestRate
  ↓
4️⃣ DebitCard: calculateFee() return 0 (no fee)
  ↓
5️⃣ Test polymorphism dengan List<BankCard>
  ↓
✅ Demonstrate inheritance, abstraction, dan polymorphism!
```

🚀 **Coba Sekarang!** 
Implementasikan solusi Anda di: https://zapp.run/

### 🏥 Tantangan 2: Sistem Rumah Sakit dengan Mixin

Buat sistem rumah sakit yang menggunakan inheritance, interface, dan mixin.

💻 **Template Challenge:**
```dart
// Mixin untuk tracking appointments
mixin AppointmentTracker {
  List<String> _appointments = [];
  
  void scheduleAppointment(String appointment) {
    _appointments.add(appointment);
    print('Appointment scheduled: $appointment');
  }
  
  void viewAppointments() {
    print('Appointments:');
    for (int i = 0; i < _appointments.length; i++) {
      print('${i + 1}. ${_appointments[i]}');
    }
  }
  
  int get appointmentCount => _appointments.length;
}

// Interface untuk emergency response
abstract class EmergencyResponder {
  void respondToEmergency(String emergencyType);
  bool isAvailable();
}

// Base class
abstract class Person {
  String id;
  String name;
  int age;
  
  Person(this.id, this.name, this.age);
  
  void displayBasicInfo() {
    print('ID: $id, Name: $name, Age: $age');
  }
}

// TODO: Implement Doctor class
class Doctor extends Person with AppointmentTracker implements EmergencyResponder {
  String specialization;
  bool _isOnDuty;
  
  // TODO: Implement constructor
  // TODO: Implement respondToEmergency
  // TODO: Implement isAvailable
  // TODO: Add methods: startShift(), endShift(), consultPatient()
}

// TODO: Implement Nurse class
class Nurse extends Person with AppointmentTracker implements EmergencyResponder {
  String department;
  
  // TODO: Implement similar to Doctor but with nurse-specific behavior
}

// TODO: Implement Patient class
class Patient extends Person {
  String condition;
  String assignedDoctor;
  
  // TODO: Implement constructor and patient-specific methods
}

// TODO: Implement Hospital class to manage everything
class Hospital {
  String name;
  List<Doctor> doctors = [];
  List<Nurse> nurses = [];
  List<Patient> patients = [];
  
  // TODO: Add methods:
  // - addStaff()
  // - admitPatient()
  // - assignDoctorToPatient()
  // - handleEmergency()
  // - displayHospitalStatus()
}

void main() {
  // TODO: Create hospital system
  // TODO: Add doctors and nurses
  // TODO: Admit patients
  // TODO: Schedule appointments
  // TODO: Test emergency response
  // TODO: Demonstrate all OOP concepts
}
```

🚀 **Coba Sekarang!** 
Bangun sistem rumah sakit lengkap di: https://zapp.run/

### 🏫 Tantangan 3: Sistem Manajemen Sekolah Komprehensif

Tantangan terakhir menggabungkan semua konsep OOP dalam satu sistem yang kompleks.

💻 **Challenge Framework:**
```dart
// TODO: Implementasikan sistem sekolah lengkap dengan:

// 1. Abstract base classes untuk Person
// 2. Inheritance hierarchy untuk Student, Teacher, Staff
// 3. Interface untuk Teachable, Gradable
// 4. Mixin untuk Attendance, Contactable
// 5. Composition untuk School class yang mengelola semua

// Fitur yang harus ada:
// - Student enrollment dan graduation
// - Teacher assignment ke subjects
// - Grade management dengan polimorfisme
// - Attendance tracking dengan mixin
// - Contact information management
// - School statistics dan reporting

// Struktur yang disarankan:
abstract class Person {
  // Base properties dan methods
}

mixin Attendance {
  // Attendance tracking functionality
}

mixin Contactable {
  // Contact information management
}

abstract class Teachable {
  // Interface untuk yang bisa mengajar
}

abstract class Gradable {
  // Interface untuk yang bisa dinilai
}

class Student extends Person with Attendance implements Gradable {
  // Student implementation
}

class Teacher extends Person with Attendance, Contactable implements Teachable {
  // Teacher implementation
}

class School {
  // Main school management class
}

void main() {
  // TODO: Comprehensive testing
}
```

📋 **Requirements Checklist:**
```
✅ Inheritance (minimal 3 level)
✅ Abstract classes (minimal 2)
✅ Interfaces (minimal 2)
✅ Mixins (minimal 2)
✅ Polymorphism demonstration
✅ Encapsulation dengan getter/setter
✅ Method overriding
✅ Composition dalam School class
✅ Error handling untuk edge cases
✅ Comprehensive testing dalam main()
```

🚀 **Coba Sekarang!** 
Implementasikan sistem sekolah terlengkap di: https://zapp.run/

### 🏆 Tantangan Bonus: Design Pattern Implementation

Jika Anda sudah menyelesaikan ketiga tantangan di atas, coba implementasikan design pattern berikut:

💻 **Singleton + Factory + Observer Pattern:**
```dart
// TODO: Implementasikan tiga design pattern sekaligus:

// 1. Singleton untuk DatabaseConnection
class DatabaseConnection {
  // Singleton implementation
}

// 2. Factory untuk UserFactory
abstract class User {
  // Factory pattern implementation
}

// 3. Observer untuk NotificationSystem
abstract class Observer {
  // Observer pattern implementation
}

class Subject {
  // Subject for observer pattern
}

void main() {
  // TODO: Demonstrate all three patterns working together
}
```

🚀 **Coba Sekarang!** 
Challenge pattern advanced di: https://zapp.run/

---

## 📚 Glosarium

| **Istilah** | **Definisi** | **Contoh** |
|-------------|--------------|------------|
| **Abstract Class** | Class yang tidak bisa di-instantiate langsung, berisi method abstract | `abstract class Animal` |
| **Class** | Blueprint atau template untuk membuat object | `class Mobil { }` |
| **Constructor** | Method khusus yang dipanggil saat object dibuat | `Mobil(this.merk, this.warna)` |
| **Encapsulation** | Menyembunyikan detail implementasi dengan access control | `String _privateField` |
| **Factory Constructor** | Constructor yang tidak selalu membuat instance baru | `factory Logger(String name)` |
| **Getter** | Method untuk mengakses property dengan kontrol | `double get celsius => _celsius` |
| **Inheritance** | Pewarisan properties dan methods dari parent class | `class Dog extends Animal` |
| **Interface** | Kontrak yang mendefinisikan method yang harus diimplementasi | `class Duck implements Flyable` |
| **Method Overriding** | Mengganti implementasi method dari parent class | `@override void makeSound()` |
| **Mixin** | Cara sharing code antar class tanpa inheritance | `class Duck with Flyable` |
| **Named Constructor** | Constructor dengan nama khusus untuk pola initialization berbeda | `Point.origin() : x = 0, y = 0` |
| **Object** | Instance dari class, entitas nyata yang dibuat dari blueprint | `Mobil myMobil = Mobil()` |
| **Polymorphism** | Kemampuan object berbeda merespons interface yang sama | List<Animal> dengan Dog dan Cat |
| **Private** | Member yang hanya bisa diakses dalam library yang sama | `_namaVariable` |
| **Setter** | Method untuk mengubah property dengan validasi | `set celsius(double value)` |
| **Super** | Keyword untuk merujuk parent class | `super.methodName()` |
| **this** | Keyword untuk merujuk instance saat ini | `this.propertyName` |

---

## 📖 Referensi

### 📚 Dokumentasi Resmi
1. **Dart Language Tour - Classes**. (2024). *Dart.dev*. https://dart.dev/language/classes
2. **Dart Language Tour - Constructors**. (2024). *Dart.dev*. https://dart.dev/language/constructors
3. **Dart Language Tour - Methods**. (2024). *Dart.dev*. https://dart.dev/language/methods
4. **Dart Language Tour - Mixins**. (2024). *Dart.dev*. https://dart.dev/language/mixins

### 📊 Sumber Akademik
5. Gamma, E., Helm, R., Johnson, R., & Vlissides, J. (1994). *Design Patterns: Elements of Reusable Object-Oriented Software*. Addison-Wesley Professional.
6. Martin, R. C. (2017). *Clean Code: A Handbook of Agile Software Craftsmanship*. Pearson Education.
7. Fowler, M. (2018). *Refactoring: Improving the Design of Existing Code* (2nd ed.). Addison-Wesley Professional.

### 📖 Buku Pemrograman
8. Bracha, G. (2015). *The Dart Programming Language*. Addison-Wesley Professional.
9. Windmill, E., & Biggs, S. (2019). *Flutter in Action*. Manning Publications.
10. Freeman, E., Robson, E., Bates, B., & Sierra, K. (2020). *Head First Design Patterns: Building Extensible and Maintainable Object-Oriented Software* (2nd ed.). O'Reilly Media.

### 🌐 Sumber Online
11. **Effective Dart**. (2024). https://dart.dev/effective-dart
12. **DartPad Online IDE**. (2024). https://dartpad.dev
13. **Zapp.run Flutter Playground**. (2024). https://zapp.run

---

## 📝 Catatan Pengajar

### 🎯 Penilaian Pembelajaran

**Indikator Keberhasilan:**
- ✅ Mahasiswa dapat mendefinisikan class dengan constructor yang tepat
- ✅ Mahasiswa dapat menerapkan enkapsulasi dengan getter/setter
- ✅ Mahasiswa dapat menggunakan inheritance dan method overriding
- ✅ Mahasiswa dapat mendemonstrasikan polimorfisme dalam kode
- ✅ Mahasiswa dapat mengimplementasikan abstract class dan interface
- ✅ Mahasiswa dapat menggunakan mixin untuk code reuse

### 🎪 Tips Pengajaran

1. **🎨 Analogi Dunia Nyata**: Selalu gunakan contoh yang familiar seperti mobil, hewan, atau sekolah
2. **🔄 Praktik Bertahap**: Mulai dari class sederhana, lalu tambah complexity secara bertahap
3. **🎭 Demonstrasi Live Coding**: Tunjukkan bagaimana polymorphism bekerja dengan contoh langsung
4. **🤝 Peer Programming**: Dorong mahasiswa untuk bekerja berpasangan dalam challenges

### ⚠️ Kesalahan Umum

- **Constructor**: Lupa memanggil super() dalam inheritance
- **Encapsulation**: Tidak memahami library-level privacy di Dart
- **Interface**: Mengira interface di Dart sama seperti di Java/C#
- **Mixin**: Bingung kapan menggunakan mixin vs inheritance
- **Override**: Lupa menambahkan @override annotation

---

## 🎯 Persiapan Minggu Depan!

**Preview Minggu 4: Pengaturan Lingkungan Flutter dan Aplikasi Pertama**

🔮 **Yang Akan Datang:**
- ⚙️ **Setup Environment**: Install Flutter SDK lengkap
- 📱 **Device Setup**: Android emulator dan iOS simulator
- 🎨 **First Flutter App**: Hello World dengan Hot Reload
- 🏗️ **Project Structure**: Memahami file dan folder Flutter

**📚 Persiapan:**
- Review semua konsep OOP yang telah dipelajari
- Pastikan Dart environment masih working dengan baik
- Siapkan device Android/iOS untuk testing (optional)
- Download Android Studio jika belum punya

---

*🎓 Selamat! Anda telah menguasai dasar-dasar OOP di Dart. Minggu depan kita akan mulai petualangan Flutter yang sesungguhnya!*

🚀 **Remember**: OOP adalah fondasi untuk membangun aplikasi Flutter yang baik. Semakin kuat pemahaman OOP Anda, semakin mudah memahami arsitektur Flutter nantinya!

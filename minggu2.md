# 📱 Minggu 2: Alur Kontrol, Fungsi, dan Koleksi Data di Dart

![Dart Badge](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter Badge](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Programming Logic](https://img.shields.io/badge/Programming-Logic-green?style=for-the-badge)

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan materi minggu ini, mahasiswa diharapkan dapat:

- 🧮 **Mengimplementasikan** logika kondisional menggunakan operator, pernyataan if/else, dan switch
- 🔄 **Mengontrol** alur program dengan perulangan for dan while
- ⚡ **Mendefinisikan** dan memanggil fungsi dengan parameter posisional, bernama, dan opsional
- 📦 **Menyimpan** dan memanipulasi koleksi data menggunakan List, Set, dan Map

---

## 📋 Outline Materi

1. [🧮 Operator: Dasar Perhitungan dan Logika](#-operator-dasar-perhitungan-dan-logika)
2. [🔄 Pernyataan Alur Kontrol](#-pernyataan-alur-kontrol)
3. [⚡ Fungsi: Mengorganisir dan Menggunakan Kembali Kode](#-fungsi-mengorganisir-dan-menggunakan-kembali-kode)
4. [📦 Koleksi Data: Mengelola Kelompok Data](#-koleksi-data-mengelola-kelompok-data)
5. [💻 Praktikum 2: Tantangan Algoritmik](#-praktikum-2-tantangan-algoritmik)

---

## 🧮 Operator: Dasar Perhitungan dan Logika

Operator adalah simbol-simbol yang memungkinkan program melakukan perhitungan dan membuat keputusan. Bayangkan operator seperti alat matematika dan logika yang membantu program memproses data dan mengambil keputusan berdasarkan kondisi tertentu.

### 🔢 Operator Aritmetika

Operator aritmetika digunakan untuk melakukan perhitungan matematika dasar seperti penjumlahan, pengurangan, perkalian, dan pembagian.

```dart
void main() {
  int nilai1 = 10;
  int nilai2 = 3;
  
  print('Penjumlahan: ${nilai1 + nilai2}');        // 13
  print('Pengurangan: ${nilai1 - nilai2}');       // 7  
  print('Perkalian: ${nilai1 * nilai2}');         // 30
  print('Pembagian: ${nilai1 / nilai2}');         // 3.3333...
  print('Pembagian Bulat: ${nilai1 ~/ nilai2}');  // 3
  print('Sisa Bagi: ${nilai1 % nilai2}');         // 1
}
```

**📋 Penjelasan Langkah demi Langkah:**
```
🎯 MULAI: nilai1 = 10, nilai2 = 3
  ↓
1️⃣ Penjumlahan (nilai1 + nilai2): 10 + 3 = 13
  ↓
2️⃣ Pengurangan (nilai1 - nilai2): 10 - 3 = 7
  ↓
3️⃣ Perkalian (nilai1 * nilai2): 10 × 3 = 30
  ↓
4️⃣ Pembagian (nilai1 / nilai2): 10 ÷ 3 = 3.333... (hasilnya double)
  ↓
5️⃣ Pembagian Bulat (nilai1 ~/ nilai2): 10 ÷ 3 = 3 (hasilnya int, tanpa sisa)
  ↓
6️⃣ Sisa Bagi (nilai1 % nilai2): 10 % 3 = 1 (sisa dari pembagian)
  ↓
✅ SELESAI: Semua operasi aritmetika selesai
```

🚀 **Coba Sekarang!** 
Silakan copy kode di atas dan coba jalankan di: https://zapp.run/

### 📈 Operator Increment dan Decrement

Operator ini memberikan cara singkat untuk menambah atau mengurangi nilai sebesar satu. Sangat berguna dalam perulangan dan penghitungan.

```dart
void main() {
  int penghitung = 5;
  
  print('Nilai awal: $penghitung');              // 5
  print('Post-increment: ${penghitung++}');      // 5 (tampilkan dulu, baru tambah)
  print('Setelah increment: $penghitung');       // 6
  
  print('Pre-increment: ${++penghitung}');       // 7 (tambah dulu, baru tampilkan)
  print('Pre-decrement: ${--penghitung}');       // 6 (kurangi dulu, baru tampilkan)
  print('Post-decrement: ${penghitung--}');      // 6 (tampilkan dulu, baru kurangi)
  print('Nilai akhir: $penghitung');             // 5
}
```

**📋 Alur Eksekusi:**
```
🎯 MULAI: penghitung = 5
  ↓
1️⃣ penghitung++ (post-increment):
    • Tampilkan nilai saat ini: 5
    • Kemudian tambahkan: penghitung menjadi 6
  ↓
2️⃣ ++penghitung (pre-increment):
    • Tambahkan terlebih dahulu: penghitung menjadi 7
    • Kemudian tampilkan: 7
  ↓
3️⃣ --penghitung (pre-decrement):
    • Kurangi terlebih dahulu: penghitung menjadi 6
    • Kemudian tampilkan: 6
  ↓
4️⃣ penghitung-- (post-decrement):
    • Tampilkan nilai saat ini: 6
    • Kemudian kurangi: penghitung menjadi 5
  ↓
✅ SELESAI: penghitung = 5
```

🚀 **Coba Sekarang!** 
Eksperimen dengan operator increment di: https://zapp.run/

### ⚖️ Operator Perbandingan

Operator perbandingan membandingkan dua nilai dan menghasilkan nilai boolean (true atau false). Operator ini sangat penting untuk membuat keputusan dalam program.

```dart
void main() {
  int umur = 20;
  int batasMinum = 21;
  int batasVoting = 17;
  
  // Operator kesetaraan
  print('umur == batasMinum: ${umur == batasMinum}');  // false (tidak sama)
  print('umur != batasVoting: ${umur != batasVoting}'); // true (tidak sama)
  
  // Operator relasional
  print('umur < batasMinum: ${umur < batasMinum}');    // true (kurang dari)
  print('umur > batasVoting: ${umur > batasVoting}');  // true (lebih dari)
  print('umur <= batasMinum: ${umur <= batasMinum}');  // true (kurang dari atau sama dengan)
  print('umur >= batasVoting: ${umur >= batasVoting}'); // true (lebih dari atau sama dengan)
}
```

**📋 Logika Perbandingan:**
```
🎯 Nilai: umur=20, batasMinum=21, batasVoting=17
  ↓
1️⃣ umur == batasMinum: 20 == 21 → false ❌
2️⃣ umur != batasVoting: 20 != 17 → true ✅
3️⃣ umur < batasMinum: 20 < 21 → true ✅
4️⃣ umur > batasVoting: 20 > 17 → true ✅
5️⃣ umur <= batasMinum: 20 <= 21 → true ✅ (sama dengan juga dihitung)
6️⃣ umur >= batasVoting: 20 >= 17 → true ✅ (lebih besar memenuhi syarat)
  ↓
✅ Semua perbandingan menghasilkan nilai boolean
```

🚀 **Coba Sekarang!** 
Test berbagai perbandingan di: https://zapp.run/

### 🧠 Operator Logika

Operator logika menggabungkan beberapa kondisi boolean untuk membuat pernyataan kondisional yang lebih kompleks. Seperti kata sambung dalam bahasa Indonesia: "dan", "atau", "bukan".

```dart
void main() {
  bool mahasiswa = true;
  bool punyaKTP = false;
  int umur = 19;
  
  // Operator AND (&&) - kedua kondisi harus benar
  bool bisaMasukPerpustakaan = mahasiswa && punyaKTP;
  print('Bisa masuk perpustakaan: $bisaMasukPerpustakaan'); // false
  
  // Operator OR (||) - salah satu kondisi harus benar
  bool dapatDiskon = mahasiswa || (umur < 18);
  print('Dapat diskon: $dapatDiskon'); // true
  
  // Operator NOT (!) - membalik nilai boolean
  bool bukanMahasiswa = !mahasiswa;
  print('Bukan mahasiswa: $bukanMahasiswa'); // false
  
  // Ekspresi logika kompleks
  bool layakProgram = mahasiswa && (umur >= 18) && (punyaKTP || umur > 21);
  print('Layak untuk program: $layakProgram'); // false
}
```

**📋 Proses Evaluasi Logika:**
```
🎯 Diketahui: mahasiswa=true, punyaKTP=false, umur=19
  ↓
1️⃣ bisaMasukPerpustakaan = mahasiswa && punyaKTP
    true && false = false ❌ (keduanya harus true)
  ↓
2️⃣ dapatDiskon = mahasiswa || (umur < 18)
    true || (19 < 18) = true || false = true ✅ (salah satu true)
  ↓  
3️⃣ bukanMahasiswa = !mahasiswa
    !true = false ❌ (NOT membalik nilai)
  ↓
4️⃣ layakProgram = mahasiswa && (umur >= 18) && (punyaKTP || umur > 21)
    true && (19 >= 18) && (false || 19 > 21)
    = true && true && (false || false)
    = true && true && false = false ❌
  ↓
✅ SELESAI: Logika kompleks dievaluasi langkah demi langkah
```

🚀 **Coba Sekarang!** 
Praktikkan kombinasi operator logika di: https://zapp.run/

---

## 🔄 Pernyataan Alur Kontrol

Pernyataan alur kontrol memungkinkan program membuat keputusan dan mengulang operasi berdasarkan kondisi tertentu. Mereka seperti rambu lalu lintas yang mengatur alur eksekusi program.

### 🤔 Pernyataan If-Else

Pernyataan if-else memungkinkan eksekusi kondisional berdasarkan ekspresi boolean. Seperti membuat keputusan dalam kehidupan sehari-hari: "Jika hujan, bawa payung. Jika tidak, bawa topi."

```dart
void main() {
  int suhu = 28;
  String cuaca = 'cerah';
  
  // Pernyataan if sederhana
  if (suhu > 30) {
    print('Cuaca sangat panas! Minum air yang banyak.');
  }
  
  // Pernyataan if-else
  if (suhu < 15) {
    print('Pakai jaket tebal');
  } else {
    print('Pakaian ringan sudah cukup');
  }
  
  // Rantai if-else if-else
  if (suhu >= 35) {
    print('Sangat panas - tetap terhidrasi');
  } else if (suhu >= 25) {
    print('Hangat dan menyenangkan');
  } else if (suhu >= 15) {
    print('Sejuk tapi nyaman');
  } else {
    print('Dingin - pakai pakaian hangat');
  }
  
  // Pernyataan if bersarang
  if (suhu > 20) {
    if (cuaca == 'cerah') {
      print('Hari yang sempurna untuk aktivitas outdoor!');
    } else {
      print('Hangat tapi periksa cuaca dulu');
    }
  }
}
```

**📋 Alur Pohon Keputusan:**
```
🎯 suhu = 28, cuaca = 'cerah'
  ↓
1️⃣ if (suhu > 30): 28 > 30? → false ❌
   Lewati: "Cuaca sangat panas!" tidak dicetak
  ↓
2️⃣ if (suhu < 15): 28 < 15? → false ❌
   else: Cetak "Pakaian ringan sudah cukup" ✅
  ↓
3️⃣ Pengecekan multi-cabang:
   • suhu >= 35? 28 >= 35? → false ❌
   • suhu >= 25? 28 >= 25? → true ✅
   Cetak: "Hangat dan menyenangkan"
   (Lewati kondisi sisanya)
  ↓
4️⃣ Kondisi bersarang:
   • suhu > 20? 28 > 20? → true ✅
   • cuaca == 'cerah'? 'cerah' == 'cerah'? → true ✅
   Cetak: "Hari yang sempurna untuk aktivitas outdoor!"
  ↓
✅ SELESAI: Beberapa kondisi dievaluasi secara independen
```

🚀 **Coba Sekarang!** 
Eksperimen dengan berbagai kondisi di: https://zapp.run/

### 🔁 Perulangan For

Perulangan for menyediakan pengulangan terkontrol dengan inisialisasi, pengecekan kondisi, dan operasi increment. Sangat berguna ketika kita tahu berapa kali ingin mengulang sesuatu.

```dart
void main() {
  // Perulangan for standar
  print('Hitung mundur:');
  for (int i = 5; i >= 1; i--) {
    print('$i...');
  }
  print('Selamat! 🎉');
  
  // Perulangan for dengan list
  List<String> buah = ['apel', 'pisang', 'jeruk'];
  print('\nBuah dalam keranjang:');
  for (int i = 0; i < buah.length; i++) {
    print('${i + 1}. ${buah[i]}');
  }
  
  // Perulangan for-in (perulangan yang disempurnakan)
  print('\nWarna favorit:');
  List<String> warna = ['merah', 'hijau', 'biru'];
  for (String warna_item in warna) {
    print('Saya suka warna $warna_item');
  }
  
  // Perulangan for bersarang - tabel perkalian
  print('\nTabel Perkalian (3x3):');
  for (int baris = 1; baris <= 3; baris++) {
    for (int kolom = 1; kolom <= 3; kolom++) {
      print('$baris x $kolom = ${baris * kolom}');
    }
  }
}
```

**📋 Pola Eksekusi Perulangan For:**
```
Perulangan For Standar: for (int i = 5; i >= 1; i--)
🎯 INISIALISASI: i = 5
  ↓
1️⃣ CEK KONDISI: i >= 1? (5 >= 1) → true ✅
   JALANKAN BLOK: print('5...')
   UPDATE: i-- (i menjadi 4)
  ↓
2️⃣ CEK KONDISI: i >= 1? (4 >= 1) → true ✅
   JALANKAN BLOK: print('4...')  
   UPDATE: i-- (i menjadi 3)
  ↓
3️⃣ CEK KONDISI: i >= 1? (3 >= 1) → true ✅
   JALANKAN BLOK: print('3...')
   UPDATE: i-- (i menjadi 2)
  ↓
4️⃣ CEK KONDISI: i >= 1? (2 >= 1) → true ✅
   JALANKAN BLOK: print('2...')
   UPDATE: i-- (i menjadi 1)
  ↓
5️⃣ CEK KONDISI: i >= 1? (1 >= 1) → true ✅
   JALANKAN BLOK: print('1...')
   UPDATE: i-- (i menjadi 0)
  ↓
6️⃣ CEK KONDISI: i >= 1? (0 >= 1) → false ❌
   KELUAR DARI PERULANGAN
  ↓
✅ Lanjutkan dengan: print('Selamat! 🎉')
```

🚀 **Coba Sekarang!** 
Test berbagai pola perulangan di: https://zapp.run/

### 🔄 Perulangan While

Perulangan while terus mengeksekusi selama kondisi yang ditentukan tetap true. Berguna ketika kita tidak tahu pasti berapa kali perulangan akan berjalan.

```dart
void main() {
  // Perulangan while dasar
  int hitungan = 1;
  print('Menghitung naik:');
  while (hitungan <= 3) {
    print('Hitungan: $hitungan');
    hitungan++; // Penting: update variabel kondisi
  }
  
  // Perulangan do-while (eksekusi minimal sekali)
  int angka = 10;
  print('\nContoh do-while:');
  do {
    print('Angka: $angka');
    angka += 5;
  } while (angka < 15);
  
  // Perulangan while dengan simulasi input pengguna
  List<String> respon = ['ya', 'ya', 'tidak'];
  int indeksRespon = 0;
  
  print('\nSimulasi interaksi pengguna:');
  while (indeksRespon < respon.length && respon[indeksRespon] == 'ya') {
    print('Lanjutkan? ${respon[indeksRespon]}');
    indeksRespon++;
  }
  print('Berhenti karena pengguna menjawab: ${respon[indeksRespon - 1]}');
}
```

**📋 Eksekusi Perulangan While:**
```
Perulangan While: while (hitungan <= 3)
🎯 INISIALISASI: hitungan = 1
  ↓
1️⃣ CEK: hitungan <= 3? (1 <= 3) → true ✅
   EKSEKUSI: print('Hitungan: 1')
   UPDATE: hitungan++ (hitungan = 2)
  ↓
2️⃣ CEK: hitungan <= 3? (2 <= 3) → true ✅
   EKSEKUSI: print('Hitungan: 2')
   UPDATE: hitungan++ (hitungan = 3)
  ↓
3️⃣ CEK: hitungan <= 3? (3 <= 3) → true ✅
   EKSEKUSI: print('Hitungan: 3')
   UPDATE: hitungan++ (hitungan = 4)
  ↓
4️⃣ CEK: hitungan <= 3? (4 <= 3) → false ❌
   KELUAR DARI PERULANGAN
  ↓
✅ Perulangan berakhir, lanjutkan kode berikutnya

Perulangan Do-While: do { ... } while (angka < 15)
🎯 INISIALISASI: angka = 10
  ↓
1️⃣ EKSEKUSI DULU: print('Angka: 10') (selalu jalan sekali)
   UPDATE: angka += 5 (angka = 15)
  ↓
2️⃣ CEK: angka < 15? (15 < 15) → false ❌
   KELUAR DARI PERULANGAN
  ↓
✅ Dieksekusi sekali, kemudian berakhir
```

🚀 **Coba Sekarang!** 
Praktikkan perulangan while di: https://zapp.run/

### ⏭️ Pernyataan Break dan Continue

Pernyataan break dan continue memberikan kontrol yang lebih halus terhadap eksekusi perulangan. Break menghentikan perulangan sepenuhnya, sedangkan continue melompat ke iterasi berikutnya.

```dart
void main() {
  // Pernyataan break - keluar dari perulangan sepenuhnya
  print('Mencari bilangan genap pertama:');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      print('Bilangan genap ditemukan: $i');
      break; // Keluar dari perulangan seketika
    }
    print('$i adalah ganjil, lanjutkan...');
  }
  
  print('\nMelewati bilangan ganjil dengan continue:');
  for (int i = 1; i <= 6; i++) {
    if (i % 2 == 1) {
      continue; // Lewati ke iterasi berikutnya
    }
    print('Bilangan genap: $i');
  }
  
  // Perulangan bersarang dengan labeled break
  print('\nMencari dalam grid 2D:');
  perulangan_luar: for (int baris = 1; baris <= 3; baris++) {
    for (int kolom = 1; kolom <= 3; kolom++) {
      print('Memeriksa posisi ($baris, $kolom)');
      if (baris == 2 && kolom == 2) {
        print('Target ditemukan di (2, 2)!');
        break perulangan_luar; // Keluar dari kedua perulangan
      }
    }
  }
  print('Pencarian selesai');
}
```

**📋 Alur Break dan Continue:**
```
Contoh Break: Mencari bilangan genap pertama
🎯 Perulangan: i dari 1 sampai 10
  ↓
1️⃣ i=1: 1%2==0? → false ❌, print "1 adalah ganjil, lanjutkan..."
2️⃣ i=2: 2%2==0? → true ✅, print "Bilangan genap ditemukan: 2"
   BREAK → Keluar dari perulangan seketika
  ↓
✅ Perulangan berakhir di i=2, iterasi sisanya dilewati

Contoh Continue: Melewati bilangan ganjil  
🎯 Perulangan: i dari 1 sampai 6
  ↓
1️⃣ i=1: 1%2==1? → true ✅, CONTINUE → lewati ke i=2
2️⃣ i=2: 2%2==1? → false ❌, print "Bilangan genap: 2"
3️⃣ i=3: 3%2==1? → true ✅, CONTINUE → lewati ke i=4
4️⃣ i=4: 4%2==1? → false ❌, print "Bilangan genap: 4"
5️⃣ i=5: 5%2==1? → true ✅, CONTINUE → lewati ke i=6
6️⃣ i=6: 6%2==1? → false ❌, print "Bilangan genap: 6"
  ↓
✅ Hanya bilangan genap yang dicetak: 2, 4, 6
```

🚀 **Coba Sekarang!** 
Eksperimen dengan break dan continue di: https://zapp.run/

---

## ⚡ Fungsi: Mengorganisir dan Menggunakan Kembali Kode

Fungsi adalah blok kode yang dapat digunakan kembali dan melakukan tugas tertentu. Bayangkan fungsi seperti alat khusus—masing-masing dirancang untuk menyelesaikan pekerjaan tertentu dan dapat digunakan kapan saja ketika pekerjaan itu perlu dilakukan.

### 📝 Mendefinisikan Fungsi Dasar

Fungsi membantu kita mengorganisir kode menjadi bagian-bagian yang lebih kecil dan mudah dikelola. Seperti membagi pekerjaan besar menjadi tugas-tugas kecil yang spesifik.

```dart
// Fungsi tanpa parameter dan tanpa nilai kembali
void sapaUser() {
  print('Selamat datang di aplikasi Flutter kami!');
}

// Fungsi dengan parameter dan nilai kembali
int tambahAngka(int a, int b) {
  return a + b;
}

// Fungsi dengan inferensi tipe return
hitungLuas(double jariJari) => 3.14159 * jariJari * jariJari;

void main() {
  // Memanggil fungsi
  sapaUser();
  
  int jumlah = tambahAngka(5, 3);
  print('Jumlah: $jumlah');
  
  double luas = hitungLuas(5.0);
  print('Luas: ${luas.toStringAsFixed(2)}');
}
```

**📋 Alur Eksekusi Fungsi:**
```
🎯 Program dimulai di main()
  ↓
1️⃣ Panggil sapaUser():
   • Lompat ke fungsi sapaUser()
   • Eksekusi: print('Selamat datang di aplikasi Flutter kami!')
   • Kembali ke main() (fungsi void tidak mengembalikan apa-apa)
  ↓
2️⃣ Panggil tambahAngka(5, 3):
   • Lompat ke tambahAngka() dengan a=5, b=3
   • Hitung: return 5 + 3
   • Kembalikan nilai 8 ke main()
   • Simpan dalam variabel jumlah
  ↓
3️⃣ Panggil hitungLuas(5.0):
   • Lompat ke hitungLuas() dengan jariJari=5.0
   • Hitung: 3.14159 * 5.0 * 5.0 = 78.539...
   • Kembalikan nilai ke main()
   • Simpan dalam variabel luas
  ↓
✅ Semua pemanggilan fungsi selesai, lanjutkan main()
```

🚀 **Coba Sekarang!** 
Buat fungsi pertama Anda di: https://zapp.run/

### 🎛️ Jenis-jenis Parameter

Dart mendukung berbagai jenis parameter untuk membuat fungsi lebih fleksibel dan mudah digunakan. Seperti memberikan pilihan cara untuk menyampaikan informasi ke fungsi.

```dart
// Parameter posisi wajib
String buatPesan(String nama, int umur) {
  return 'Halo $nama, kamu berumur $umur tahun';
}

// Parameter posisi opsional (dalam tanda kurung siku)
String formatNama(String namaDepan, [String? namaBelakang]) {
  if (namaBelakang != null) {
    return '$namaDepan $namaBelakang';
  }
  return namaDepan;
}

// Parameter bernama (dalam tanda kurung kurawal)
void tampilkanInfoUser({required String nama, int umur = 18, String? email}) {
  print('Nama: $nama');
  print('Umur: $umur');
  if (email != null) {
    print('Email: $email');
  }
}

// Parameter campuran (posisi, kemudian bernama)
void daftarUser(String username, {required String password, bool isAdmin = false}) {
  print('Mendaftarkan user: $username');
  print('Hak admin: $isAdmin');
  // Logika penanganan password akan ada di sini
}

void main() {
  // Parameter posisi wajib
  print(buatPesan('Alice', 25));
  
  // Parameter posisi opsional
  print(formatNama('John'));           // John
  print(formatNama('Jane', 'Smith'));  // Jane Smith
  
  // Parameter bernama
  tampilkanInfoUser(nama: 'Bob');
  tampilkanInfoUser(nama: 'Carol', umur: 30, email: 'carol@example.com');
  
  // Parameter campuran
  daftarUser('admin_user', password: 'secret123', isAdmin: true);
}
```

**📋 Penanganan Parameter:**
```
Fungsi: formatNama(String namaDepan, [String? namaBelakang])
🎯 Panggilan: formatNama('John')
  ↓
1️⃣ namaDepan = 'John' (wajib, disediakan)
2️⃣ namaBelakang = null (opsional, tidak disediakan)  
3️⃣ Cek: namaBelakang != null? → false ❌
4️⃣ Return: namaDepan ('John')
  ↓
✅ Hasil: 'John'

🎯 Panggilan: formatNama('Jane', 'Smith')  
  ↓
1️⃣ namaDepan = 'Jane' (wajib, disediakan)
2️⃣ namaBelakang = 'Smith' (opsional, disediakan)
3️⃣ Cek: namaBelakang != null? → true ✅  
4️⃣ Return: '$namaDepan $namaBelakang' ('Jane Smith')
  ↓
✅ Hasil: 'Jane Smith'

Parameter Bernama: tampilkanInfoUser({required String nama, int umur = 18, String? email})
🎯 Panggilan: tampilkanInfoUser(nama: 'Bob')
  ↓
1️⃣ nama = 'Bob' (wajib, disediakan)
2️⃣ umur = 18 (nilai default digunakan)
3️⃣ email = null (opsional, tidak disediakan)
  ↓
✅ Fungsi dieksekusi dengan nilai-nilai ini
```

🚀 **Coba Sekarang!** 
Eksperimen dengan berbagai jenis parameter di: https://zapp.run/

### 🏹 Sintaks Arrow untuk Fungsi

Sintaks arrow menyediakan cara ringkas untuk menulis fungsi dengan satu ekspresi. Seperti cara singkat menuliskan kalimat yang pendek.

```dart
// Sintaks fungsi tradisional
int kalikanTradisional(int a, int b) {
  return a * b;
}

// Sintaks arrow - lebih ringkas
int kalikan(int a, int b) => a * b;

// Fungsi arrow dengan berbagai tipe return
String sapa(String nama) => 'Halo, $nama!';
bool cekGenap(int angka) => angka % 2 == 0;
double hitungKeliling(double jariJari) => 2 * 3.14159 * jariJari;

// Fungsi arrow bekerja bagus dengan koleksi
List<int> ambilBilanganGenap(List<int> angka) => 
    angka.where((n) => n % 2 == 0).toList();

void main() {
  // Menggunakan fungsi arrow
  print(kalikan(4, 5));
  print(sapa('Developer Flutter'));
  print(cekGenap(7));
  print('Keliling: ${hitungKeliling(3.0).toStringAsFixed(2)}');
  
  List<int> angka = [1, 2, 3, 4, 5, 6, 7, 8];
  List<int> bilanganGenap = ambilBilanganGenap(angka);
  print('Bilangan genap: $bilanganGenap');
}
```

**📋 Kesetaraan Sintaks Arrow:**
```
Sintaks Tradisional:
int kalikan(int a, int b) {
  return a * b;
}

Sintaks Arrow:  
int kalikan(int a, int b) => a * b;

🎯 Kedua fungsi adalah sama:
  ↓
1️⃣ Terima parameter: a, b
2️⃣ Hitung: a * b  
3️⃣ Kembalikan hasil langsung
  ↓
✅ Sintaks arrow = cara singkat untuk ekspresi return tunggal

Contoh Kompleks: ambilBilanganGenap()
🎯 Input: [1, 2, 3, 4, 5, 6, 7, 8]
  ↓
1️⃣ angka.where((n) => n % 2 == 0):
   • Test setiap angka: 1%2==0? false, 2%2==0? true, 3%2==0? false...
   • Simpan: [2, 4, 6, 8]
  ↓
2️⃣ .toList(): Konversi iterable yang difilter ke List
  ↓
✅ Return: [2, 4, 6, 8]
```

🚀 **Coba Sekarang!** 
Praktikkan membuat fungsi dengan sintaks arrow di: https://zapp.run/

---

## 📦 Koleksi Data: Mengelola Kelompok Data

Koleksi data memungkinkan kita menyimpan dan mengorganisir beberapa bagian informasi yang berkaitan. Mereka seperti wadah yang menampung kelompok data dan menyediakan metode untuk memanipulasi data tersebut secara efisien.

### 📋 List: Koleksi Berurutan

List menyimpan urutan elemen yang teratur di mana setiap elemen memiliki posisi indeks tertentu. Bayangkan seperti daftar belanja di mana urutan penting dan kita bisa menambah atau menghapus item.

```dart
void main() {
  // Membuat list
  List<String> warna = ['merah', 'hijau', 'biru'];
  List<int> angka = [1, 2, 3, 4, 5];
  var listCampur = ['halo', 42, true]; // Tipe campuran (tidak disarankan)
  
  // Mengakses elemen list
  print('Warna pertama: ${warna[0]}');     // merah
  print('Angka terakhir: ${angka[angka.length - 1]}'); // 5
  
  // Properti list
  print('Jumlah warna: ${warna.length}'); // 3
  print('Apakah angka kosong? ${angka.isEmpty}'); // false
  print('Apakah angka tidak kosong? ${angka.isNotEmpty}'); // true
  
  // Menambah elemen
  warna.add('kuning');
  print('Setelah menambah kuning: $warna');
  
  warna.addAll(['orange', 'ungu']);
  print('Setelah menambah beberapa: $warna');
  
  // Menyisipkan di posisi tertentu
  warna.insert(1, 'pink');
  print('Setelah menyisipkan pink di indeks 1: $warna');
  
  // Menghapus elemen
  warna.remove('hijau');          // Hapus berdasarkan nilai
  print('Setelah menghapus hijau: $warna');
  
  String dihapus = warna.removeAt(2); // Hapus berdasarkan indeks
  print('Dihapus: $dihapus');
  print('Setelah menghapus di indeks 2: $warna');
  
  // Iterasi melalui list
  print('\nIterasi melalui angka:');
  for (int i = 0; i < angka.length; i++) {
    print('Indeks $i: ${angka[i]}');
  }
  
  // Perulangan for-in yang disempurnakan
  print('\nMenggunakan perulangan for-in:');
  for (String warnaItem in warna) {
    print('Warna: $warnaItem');
  }
}
```

**📋 Operasi List Langkah demi Langkah:**
```
🎯 Awal: warna = ['merah', 'hijau', 'biru']
   Indeks:        [0]      [1]      [2]
  ↓
1️⃣ warna.add('kuning'):
   Sebelum: ['merah', 'hijau', 'biru']
   Sesudah: ['merah', 'hijau', 'biru', 'kuning']
   Indeks:   [0]      [1]      [2]      [3]
  ↓
2️⃣ warna.addAll(['orange', 'ungu']):
   Sebelum: ['merah', 'hijau', 'biru', 'kuning']  
   Sesudah: ['merah', 'hijau', 'biru', 'kuning', 'orange', 'ungu']
   Indeks:   [0]      [1]      [2]      [3]       [4]       [5]
  ↓
3️⃣ warna.insert(1, 'pink'):
   Sebelum: ['merah', 'hijau', 'biru', 'kuning', 'orange', 'ungu']
   Sesudah: ['merah', 'pink', 'hijau', 'biru', 'kuning', 'orange', 'ungu']
   Indeks:   [0]      [1]     [2]      [3]      [4]       [5]       [6]
   (Semua elemen setelah indeks 1 bergeser ke kanan)
  ↓
4️⃣ warna.remove('hijau'):
   Sebelum: ['merah', 'pink', 'hijau', 'biru', 'kuning', 'orange', 'ungu']
   Sesudah: ['merah', 'pink', 'biru', 'kuning', 'orange', 'ungu']
   (Elemen setelah item yang dihapus bergeser ke kiri)
  ↓
✅ Struktur list final dipertahankan dengan indeks yang diperbarui
```

🚀 **Coba Sekarang!** 
Praktikkan operasi List di: https://zapp.run/

### 🔹 Set: Koleksi Unik

Set menyimpan elemen unik dalam koleksi yang tidak berurutan, secara otomatis mencegah duplikasi. Seperti kumpulan stiker di mana tidak ada stiker yang sama dua kali.

```dart
void main() {
  // Membuat set
  Set<String> buah = {'apel', 'pisang', 'ceri'};
  Set<int> angka = {1, 2, 3, 2, 1}; // Duplikasi otomatis dihapus
  
  print('Buah: $buah');
  print('Angka: $angka'); // {1, 2, 3} - duplikasi dihapus
  
  // Menambah elemen
  buah.add('kurma');
  print('Setelah menambah kurma: $buah');
  
  // Mencoba menambah duplikasi
  bool ditambahkan = buah.add('apel'); // Return false - sudah ada
  print('Apakah apel ditambahkan lagi? $ditambahkan'); // false
  print('Buah setelah mencoba menambah apel: $buah'); // tidak berubah
  
  // Menambah beberapa elemen
  buah.addAll(['elderberry', 'ara', 'apel']); // 'apel' diabaikan
  print('Setelah menambah beberapa: $buah');
  
  // Operasi set
  Set<String> buahTropis = {'pisang', 'mangga', 'pepaya'};
  Set<String> buahSitrus = {'lemon', 'jeruk', 'limau'};
  
  // Union (gabungan set)
  Set<String> semua_buah = buah.union(buahTropis);
  print('Gabungan buah dan tropis: $semua_buah');
  
  // Intersection (elemen yang sama)
  Set<String> buahSama = buah.intersection(buahTropis);
  print('Buah yang sama: $buahSama');
  
  // Memeriksa keanggotaan
  print('Mengandung pisang? ${buah.contains('pisang')}');
  print('Mengandung anggur? ${buah.contains('anggur')}');
  
  // Iterasi melalui set
  print('\nSemua buah dalam set kita:');
  for (String buah_item in buah) {
    print('- $buah_item');
  }
}
```

**📋 Demonstrasi Keunikan Set:**
```
🎯 Membuat: Set<int> angka = {1, 2, 3, 2, 1}
  ↓
1️⃣ Proses elemen satu per satu:
   • Tambah 1: Set menjadi {1}
   • Tambah 2: Set menjadi {1, 2}  
   • Tambah 3: Set menjadi {1, 2, 3}
   • Tambah 2: Sudah ada → diabaikan, Set tetap {1, 2, 3}
   • Tambah 1: Sudah ada → diabaikan, Set tetap {1, 2, 3}
  ↓
✅ Set Final: {1, 2, 3} (duplikasi otomatis dihapus)

Contoh Operasi Set:
🎯 buah = {'apel', 'pisang', 'ceri', 'kurma'}
   buahTropis = {'pisang', 'mangga', 'pepaya'}
  ↓
1️⃣ Union (buah.union(buahTropis)):
   • Gabungkan semua elemen unik dari kedua set
   • Hasil: {'apel', 'pisang', 'ceri', 'kurma', 'mangga', 'pepaya'}
  ↓
2️⃣ Intersection (buah.intersection(buahTropis)):
   • Cari elemen yang ada di KEDUA set
   • Elemen sama: 'pisang'
   • Hasil: {'pisang'}
  ↓
✅ Operasi set mempertahankan keunikan
```

🚀 **Coba Sekarang!** 
Eksperimen dengan operasi Set di: https://zapp.run/

### 🗝️ Map: Koleksi Kunci-Nilai

Map menyimpan data sebagai pasangan kunci-nilai, memungkinkan kita mengaitkan kunci unik dengan nilai tertentu. Seperti kamus di mana setiap kata (kunci) memiliki definisi (nilai).

```dart
void main() {
  // Membuat map
  Map<String, int> umur = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35
  };
  
  Map<String, String> ibu_kota = {
    'Indonesia': 'Jakarta',
    'Jepang': 'Tokyo',
    'Brasil': 'Brasília'
  };
  
  // Mengakses nilai
  print('Alice berumur ${umur['Alice']} tahun');
  print('Ibu kota Jepang: ${ibu_kota['Jepang']}');
  
  // Menambah pasangan kunci-nilai baru
  umur['Diana'] = 28;
  ibu_kota['Kanada'] = 'Ottawa';
  print('Setelah penambahan:');
  print('Umur: $umur');
  print('Ibu kota: $ibu_kota');
  
  // Memperbarui nilai yang ada
  umur['Alice'] = 26; // Alice ulang tahun
  print('Umur yang diperbarui: $umur');
  
  // Memeriksa apakah kunci ada
  print('Apakah umur mengandung Bob? ${umur.containsKey('Bob')}');
  print('Apakah umur mengandung Eve? ${umur.containsKey('Eve')}');
  
  // Memeriksa apakah nilai ada
  print('Apakah umur mengandung nilai 30? ${umur.containsValue(30)}');
  
  // Mendapatkan semua kunci dan nilai
  print('Semua orang: ${umur.keys}');
  print('Semua umur: ${umur.values}');
  
  // Menghapus entri
  int? umurDihapus = umur.remove('Charlie');
  print('Menghapus Charlie (umur $umurDihapus)');
  print('Umur yang tersisa: $umur');
  
  // Iterasi melalui map
  print('\nPasangan Negara-Ibu Kota:');
  ibu_kota.forEach((negara, ibukota) {
    print('$negara -> $ibukota');
  });
  
  // Iterasi alternatif
  print('\nInformasi umur:');
  for (MapEntry<String, int> entry in umur.entries) {
    print('${entry.key} berumur ${entry.value} tahun');
  }
}
```

**📋 Walkthrough Operasi Map:**
```
🎯 Awal: umur = {'Alice': 25, 'Bob': 30, 'Charlie': 35}
   Struktur: Pasangan Kunci -> Nilai
  ↓
1️⃣ Akses umur['Alice']:
   • Cari kunci 'Alice'
   • Temukan nilai terkait: 25
   • Return: 25
  ↓
2️⃣ Tambah umur['Diana'] = 28:
   Sebelum: {'Alice': 25, 'Bob': 30, 'Charlie': 35}
   Sesudah: {'Alice': 25, 'Bob': 30, 'Charlie': 35, 'Diana': 28}
   (Pasangan kunci-nilai baru ditambahkan)
  ↓
3️⃣ Update umur['Alice'] = 26:
   Sebelum: {'Alice': 25, 'Bob': 30, 'Charlie': 35, 'Diana': 28}
   Sesudah: {'Alice': 26, 'Bob': 30, 'Charlie': 35, 'Diana': 28}
   (Nilai yang ada diperbarui)
  ↓
4️⃣ Hapus umur.remove('Charlie'):
   Sebelum: {'Alice': 26, 'Bob': 30, 'Charlie': 35, 'Diana': 28}
   Sesudah: {'Alice': 26, 'Bob': 30, 'Diana': 28}
   Return: 35 (nilai yang dihapus)
  ↓
✅ Map mempertahankan asosiasi kunci-nilai sepanjang operasi
```

🚀 **Coba Sekarang!** 
Praktikkan manipulasi Map di: https://zapp.run/

### 🔄 Pola Iterasi Koleksi

Memahami berbagai cara untuk mengiterasi koleksi akan membantu Anda memproses data dengan lebih efisien dan fleksibel.

```dart
void main() {
  List<String> bahasa = ['Dart', 'JavaScript', 'Python', 'Swift'];
  Map<String, int> nilai = {'Matematika': 95, 'IPA': 87, 'Bahasa': 92};
  
  // Pola iterasi List
  print('Bahasa Pemrograman:');
  
  // Perulangan for tradisional dengan indeks
  for (int i = 0; i < bahasa.length; i++) {
    print('${i + 1}. ${bahasa[i]}');
  }
  
  // Perulangan for-in yang disempurnakan
  print('\nBahasa yang kita suka:');
  for (String bahasaItem in bahasa) {
    print('- $bahasaItem');
  }
  
  // Menggunakan metode forEach
  print('\nBahasa (forEach):');
  bahasa.forEach((bahasaItem) => print('Belajar: $bahasaItem'));
  
  // Pola iterasi Map
  print('\nNilai Ujian:');
  
  // Iterasi atas kunci
  for (String mataPelajaran in nilai.keys) {
    print('$mataPelajaran: ${nilai[mataPelajaran]}%');
  }
  
  // Iterasi atas entri
  for (MapEntry<String, int> entry in nilai.entries) {
    String grade = entry.value >= 90 ? 'A' : 'B';
    print('${entry.key}: ${entry.value}% (Grade: $grade)');
  }
  
  // Menggunakan forEach dengan pasangan kunci-nilai
  print('\nAnalisis Nilai:');
  nilai.forEach((mataPelajaran, skorNilai) {
    String performa = skorNilai >= 90 ? 'Sangat Baik' : 'Baik';
    print('$mataPelajaran ($skorNilai%): $performa');
  });
}
```

🚀 **Coba Sekarang!** 
Test berbagai operasi koleksi di: https://zapp.run/

---

## 💻 Praktikum 2: Tantangan Algoritmik

Terapkan pengetahuan Anda tentang alur kontrol, fungsi, dan koleksi data dengan menyelesaikan tantangan pemrograman ini. Setiap masalah membangun konsep yang telah dipelajari dalam materi minggu ini.

### 🧮 Tantangan 1: Fungsi Analisis Angka

Buat fungsi yang menganalisis list angka dan mengembalikan berbagai statistik. Ini akan menguji pemahaman Anda tentang fungsi, perulangan, dan kondisional.

```dart
Map<String, dynamic> analisisAngka(List<int> angka) {
  // Implementasi Anda di sini
  // Harus mengembalikan map dengan kunci: 'jumlah', 'rata', 'min', 'maks', 'genap', 'ganjil'
}

void main() {
  List<int> angkaTest = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Map<String, dynamic> hasil = analisisAngka(angkaTest);
  print('Hasil Analisis: $hasil');
  
  // Output yang diharapkan harus mencakup jumlah=55, rata=5.5, min=1, maks=10, genap=5, ganjil=5
}
```

**💡 Petunjuk Solusi:**
- Gunakan perulangan untuk melalui semua angka
- Gunakan variabel untuk melacak jumlah, minimum, maksimum
- Gunakan operator modulo (%) untuk menentukan genap/ganjil
- Hitung rata-rata dengan membagi jumlah dengan panjang list

🚀 **Coba Sekarang!** 
Implementasikan solusi Anda di: https://zapp.run/

### 📊 Tantangan 2: Kalkulator Nilai dengan Kontrol Alur

Bangun sistem manajemen nilai yang komprehensif menggunakan fungsi dan koleksi. Tantangan ini menguji kemampuan Anda dalam mengorganisir kode dan memproses data.

```dart
void main() {
  // Data mahasiswa: Nama -> List nilai
  Map<String, List<int>> nilaiMahasiswa = {
    'Alice': [85, 92, 78, 96],
    'Bob': [76, 83, 89, 94],
    'Charlie': [92, 88, 85, 90],
    'Diana': [78, 82, 86, 91]
  };
  
  // Implementasikan fungsi-fungsi ini:
  // 1. hitungRataRata(List<int> nilai) -> double
  // 2. dapatHurufNilai(double rataRata) -> String (A: 90+, B: 80-89, C: 70-79, D: 60-69, E: <60)
  // 3. buatLaporan(Map<String, List<int>> nilai) -> void
  
  buatLaporan(nilaiMahasiswa);
}
```

**💡 Petunjuk Implementasi:**

```dart
double hitungRataRata(List<int> nilai) {
  // Hitung total semua nilai
  // Bagi dengan jumlah nilai
  // Kembalikan hasil sebagai double
}

String dapatHurufNilai(double rataRata) {
  // Gunakan if-else atau switch untuk menentukan grade
  // A: 90 ke atas, B: 80-89, C: 70-79, D: 60-69, E: di bawah 60
}

void buatLaporan(Map<String, List<int>> nilai) {
  // Iterasi melalui setiap mahasiswa
  // Hitung rata-rata untuk setiap mahasiswa
  // Tentukan grade berdasarkan rata-rata
  // Tampilkan laporan yang rapi
}
```

🚀 **Coba Sekarang!** 
Bangun sistem nilai lengkap di: https://zapp.run/

### 📚 Tantangan 3: Manipulasi Koleksi - Sistem Perpustakaan

Buat program yang mengelola sistem perpustakaan menggunakan set dan list. Tantangan ini fokus pada manipulasi koleksi data yang kompleks.

```dart
void main() {
  Set<String> bukuTersedia = {'1984', 'Dune', 'Neuromancer', 'Foundation'};
  List<String> bukuDipinjam = [];
  Set<String> anggota = {'Alice', 'Bob', 'Charlie'};
  
  // Implementasikan fungsi-fungsi ini:
  // 1. pinjamBuku(String buku, String anggota, Set<String> tersedia, List<String> dipinjam) -> bool
  // 2. kembalikanBuku(String buku, Set<String> tersedia, List<String> dipinjam) -> bool  
  // 3. tampilkanStatusPerpustakaan(Set<String> tersedia, List<String> dipinjam) -> void
  // 4. cariBukuAnggota(String anggota, List<String> dipinjam) -> List<String>
  
  // Test fungsi Anda dengan berbagai operasi
}
```

**💡 Petunjuk Implementasi:**

```dart
bool pinjamBuku(String buku, String anggota, Set<String> tersedia, List<String> dipinjam) {
  // Cek apakah buku tersedia
  // Cek apakah anggota terdaftar
  // Pindahkan buku dari tersedia ke dipinjam
  // Catat siapa yang meminjam (format: "buku - anggota")
  // Return true jika berhasil, false jika gagal
}

bool kembalikanBuku(String buku, Set<String> tersedia, List<String> dipinjam) {
  // Cari entri buku dalam daftar dipinjam
  // Hapus dari daftar dipinjam
  // Tambahkan kembali ke buku tersedia
  // Return true jika berhasil, false jika buku tidak ditemukan
}

void tampilkanStatusPerpustakaan(Set<String> tersedia, List<String> dipinjam) {
  // Tampilkan daftar buku yang tersedia
  // Tampilkan daftar buku yang dipinjam
  // Tampilkan statistik perpustakaan
}
```

🚀 **Coba Sekarang!** 
Buat sistem perpustakaan interaktif di: https://zapp.run/

### 🔍 Tantangan 4: Implementasi Algoritma

Implementasikan algoritma pencarian dan pengurutan sederhana menggunakan perulangan dan fungsi. Tantangan ini akan mengasah kemampuan berpikir algoritmik Anda.

```dart
void main() {
  List<int> angka = [64, 34, 25, 12, 22, 11, 90];
  
  // Implementasikan fungsi-fungsi ini:
  // 1. bubbleSort(List<int> list) -> List<int> (urutkan list menggunakan bubble sort)
  // 2. pencarianLinear(List<int> list, int target) -> int (return indeks atau -1 jika tidak ditemukan)
  // 3. cariMinMaks(List<int> list) -> Map<String, int> (return map dengan kunci 'min' dan 'maks')
  
  print('Asli: $angka');
  List<int> diurutkan = bubbleSort([...angka]); // Buat salinan untuk mempertahankan asli
  print('Diurutkan: $diurutkan');
  
  int targetPencarian = 25;
  int indeks = pencarianLinear(diurutkan, targetPencarian);
  print('$targetPencarian ditemukan di indeks: $indeks');
  
  Map<String, int> minMaks = cariMinMaks(angka);
  print('Min: ${minMaks['min']}, Maks: ${minMaks['maks']}');
}
```

**💡 Petunjuk Algoritma:**

**Bubble Sort:**
```dart
List<int> bubbleSort(List<int> list) {
  List<int> hasil = [...list]; // Buat salinan
  
  for (int i = 0; i < hasil.length - 1; i++) {
    for (int j = 0; j < hasil.length - 1 - i; j++) {
      // Bandingkan elemen bersebelahan
      if (hasil[j] > hasil[j + 1]) {
        // Tukar posisi jika tidak urut
        int temp = hasil[j];
        hasil[j] = hasil[j + 1];
        hasil[j + 1] = temp;
      }
    }
  }
  
  return hasil;
}
```

**Pencarian Linear:**
```dart
int pencarianLinear(List<int> list, int target) {
  // Periksa setiap elemen satu per satu
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i; // Kembalikan indeks jika ditemukan
    }
  }
  return -1; // Kembalikan -1 jika tidak ditemukan
}
```

🚀 **Coba Sekarang!** 
Test implementasi algoritma Anda di: https://zapp.run/

### 🏆 Tantangan Bonus: Pipeline Pemrosesan Data

Buat sistem pemrosesan data lengkap yang menggabungkan semua konsep dari minggu ini. Tantangan ini akan menguji kemampuan Anda dalam mengintegrasikan berbagai konsep.

```dart
void main() {
  // Data mentah yang merepresentasikan suhu harian selama seminggu
  List<Map<String, dynamic>> dataCuaca = [
    {'hari': 'Senin', 'suhu': 28, 'kondisi': 'cerah'},
    {'hari': 'Selasa', 'suhu': 25, 'kondisi': 'mendung'},
    {'hari': 'Rabu', 'suhu': 31, 'kondisi': 'cerah'},
    {'hari': 'Kamis', 'suhu': 22, 'kondisi': 'hujan'},
    {'hari': 'Jumat', 'suhu': 29, 'kondisi': 'cerah'},
    {'hari': 'Sabtu', 'suhu': 26, 'kondisi': 'berawan'},
    {'hari': 'Minggu', 'suhu': 24, 'kondisi': 'hujan'}
  ];
  
  // Implementasikan sistem analisis cuaca lengkap:
  // 1. Proses data untuk mengekstrak berbagai insight
  // 2. Gunakan ketiga jenis koleksi (List, Set, Map)  
  // 3. Implementasikan beberapa fungsi dengan berbagai jenis parameter
  // 4. Gunakan kontrol alur untuk mengkategorikan dan menganalisis data
  
  // Solusi Anda harus menghasilkan laporan cuaca yang komprehensif
}
```

**💡 Ide Implementasi:**

```dart
// Fungsi untuk menganalisis suhu
Map<String, double> analisisSuhu(List<Map<String, dynamic>> data) {
  // Hitung rata-rata, minimum, maksimum suhu
  // Kembalikan dalam Map
}

// Fungsi untuk mengkategorikan kondisi cuaca
Map<String, int> hitungKondisiCuaca(List<Map<String, dynamic>> data) {
  // Hitung berapa kali setiap kondisi terjadi
  // Gunakan Map untuk menyimpan hasil
}

// Fungsi untuk mencari hari terpanas dan terdingin
Map<String, String> cariEkstremSuhu(List<Map<String, dynamic>> data) {
  // Cari hari dengan suhu tertinggi dan terendah
  // Kembalikan nama hari
}

// Fungsi untuk merekomendasikan aktivitas
List<String> rekomendasiAktivitas(List<Map<String, dynamic>> data) {
  // Berikan rekomendasi berdasarkan cuaca
  // Gunakan kondisional untuk menentukan aktivitas yang sesuai
}
```

🚀 **Coba Sekarang!** 
Bangun sistem analisis cuaca lengkap di: https://zapp.run/

---

## 📚 Glosarium

| **Istilah** | **Definisi** | **Contoh** |
|-------------|--------------|------------|
| **API (Application Programming Interface)** | Sekumpulan protokol dan tools untuk membangun aplikasi software | REST API, Flutter Widget API |
| **Arrow Function** | Sintaks ringkas untuk menulis fungsi menggunakan operator `=>` | `int tambah(int a, int b) => a + b;` |
| **Boolean Expression** | Ekspresi yang menghasilkan nilai true atau false | `umur >= 18`, `nama == 'Alice'` |
| **Break Statement** | Pernyataan kontrol alur yang keluar dari perulangan atau switch | `break;` dalam loop |
| **Collection** | Struktur data yang menyimpan beberapa elemen | List, Set, Map di Dart |
| **Continue Statement** | Pernyataan yang melompat ke iterasi berikutnya dalam perulangan | `continue;` dalam loop |
| **Control Flow** | Urutan eksekusi pernyataan dalam program | if-else, loops, switch |
| **Decrement Operator** | Operator `--` yang mengurangi nilai numerik sebesar satu | `counter--` |
| **For-In Loop** | Perulangan yang mengiterasi koleksi tanpa manajemen indeks eksplisit | `for (item in list)` |
| **Function** | Blok kode yang dapat digunakan kembali untuk melakukan tugas tertentu | `void sapaUser() { ... }` |
| **Increment Operator** | Operator `++` yang menambah nilai numerik sebesar satu | `counter++` |
| **Index** | Posisi numerik elemen dalam koleksi berurutan seperti List | `list[0]` untuk elemen pertama |
| **Iteration** | Proses mengulang sekumpulan operasi | for loop, while loop |
| **Key-Value Pair** | Struktur data di mana setiap kunci dikaitkan dengan nilai tertentu | Map di Dart |
| **List** | Koleksi berurutan yang memungkinkan duplikasi dan akses berbasis indeks | `['apel', 'pisang', 'ceri']` |
| **Logical Operator** | Operator seperti `&&` (AND), `\|\|` (OR), dan `!` (NOT) | `isStudent && hasID` |
| **Map** | Koleksi yang menyimpan pasangan kunci-nilai | `{'nama': 'Alice', 'umur': 25}` |
| **Named Parameter** | Parameter fungsi yang diidentifikasi dengan nama saat pemanggilan | `func(nama: 'Alice', umur: 25)` |
| **Optional Parameter** | Parameter fungsi yang tidak wajib disediakan saat pemanggilan | `[String? lastName]` |
| **Parameter** | Variabel yang digunakan dalam fungsi untuk menerima input | `int tambah(int a, int b)` |
| **Set** | Koleksi tidak berurutan yang berisi elemen unik | `{1, 2, 3}` |
| **Void** | Tipe return yang menunjukkan fungsi tidak mengembalikan nilai | `void printMessage()` |
| **While Loop** | Perulangan yang terus berjalan selama kondisi tetap true | `while (condition)` |

---

## 📖 Referensi

### 📚 Dokumentasi Resmi
1. **Dart Language Tour - Operators**. (2024). *Dart.dev*. https://dart.dev/language/operators
2. **Dart Language Tour - Control Flow**. (2024). *Dart.dev*. https://dart.dev/language/branches
3. **Dart Language Tour - Functions**. (2024). *Dart.dev*. https://dart.dev/language/functions
4. **Dart Language Tour - Collections**. (2024). *Dart.dev*. https://dart.dev/language/collections

### 📊 Sumber Akademik
5. Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). *Introduction to Algorithms* (3rd ed.). MIT Press.
6. Martin, R. C. (2017). *Clean Code: A Handbook of Agile Software Craftsmanship*. Pearson Education.
7. Knuth, D. E. (1997). *The Art of Computer Programming, Volume 1: Fundamental Algorithms* (3rd ed.). Addison-Wesley Professional.

### 📖 Buku Pemrograman
8. Bracha, G. (2015). *The Dart Programming Language*. Addison-Wesley Professional.
9. Windmill, E., & Biggs, S. (2019). *Flutter in Action*. Manning Publications.
10. Wu, F. (2022). *Beginning App Development with Flutter*. Apress.

### 🌐 Sumber Online
11. **DartPad Online IDE**. (2024). https://dartpad.dev
12. **Zapp.run Flutter Playground**. (2024). https://zapp.run
13. **Flutter Community Guidelines**. (2024). https://flutter.dev/community

---

## 📝 Catatan Pengajar

### 🎯 Penilaian Pembelajaran

**Indikator Keberhasilan:**
- ✅ Mahasiswa dapat menggunakan operator dengan benar dalam berbagai konteks
- ✅ Mahasiswa dapat mengimplementasikan logika kondisional yang efektif
- ✅ Mahasiswa dapat menulis perulangan yang efisien dan aman
- ✅ Mahasiswa dapat membuat dan menggunakan fungsi dengan berbagai jenis parameter
- ✅ Mahasiswa dapat memanipulasi koleksi data dengan tepat

### 🎪 Tips Pengajaran

1. **🎨 Pembelajaran Visual**: Gunakan diagram alur untuk menjelaskan logika kondisional dan perulangan
2. **🤝 Praktik Berkelompok**: Dorong mahasiswa untuk menyelesaikan tantangan secara berpasangan
3. **🔄 Latihan Berulang**: Berikan latihan dengan tingkat kesulitan yang meningkat secara bertahap
4. **🛠️ Hands-on Approach**: Prioritaskan praktik coding daripada teori yang panjang

### ⚠️ Kesalahan Umum

- **Logika perulangan**: Mahasiswa sering lupa mengupdate variabel kontrol dalam while loop
- **Parameter fungsi**: Kebingungan antara parameter posisional dan named parameter
- **Koleksi data**: Tidak memahami perbedaan antara List, Set, dan Map
- **Operator logika**: Salah menggunakan && dan || dalam kondisi kompleks

---

## 🎯 Persiapan Minggu Depan!

**Preview Minggu 3: Pemrograman Berorientasi Objek (OOP) di Dart**

🔮 **Yang Akan Datang:**
- 🎭 **Classes dan Objects**: Memodelkan entitas dunia nyata
- 🔒 **Encapsulation**: Menyembunyikan detail implementasi
- 🧬 **Inheritance**: Mewarisi fungsionalitas dari class lain
- 🎨 **Polymorphism**: Satu interface, banyak implementasi

**📚 Persiapan:**
- Review semua konsep fungsi dan koleksi data
- Praktikkan membuat fungsi yang complex
- Pahami cara mengorganisir kode dengan baik

---

*🎓 Selamat Belajar! Semoga perjalanan menguasai logika pemrograman Anda menyenangkan dan bermanfaat!*

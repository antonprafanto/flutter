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

**📋 Eksekusi Program Langkah demi Langkah:**
```
🎯 PROGRAM DIMULAI: Dart runtime mencari function main()
  ↓
1️⃣ DEKLARASI VARIABEL:
   • Memory dialokasikan untuk variabel "nilai1" (tipe int)
   • Nilai 10 disimpan di memory address untuk nilai1
   • Memory dialokasikan untuk variabel "nilai2" (tipe int)  
   • Nilai 3 disimpan di memory address untuk nilai2
  ↓
2️⃣ EKSEKUSI print('Penjumlahan: ${nilai1 + nilai2}'):
   • Dart parser mengidentifikasi string interpolation ${...}
   • Evaluasi ekspresi nilai1 + nilai2:
     - Ambil nilai dari memory nilai1 → 10
     - Ambil nilai dari memory nilai2 → 3
     - CPU melakukan operasi penjumlahan: 10 + 3 = 13
   • Hasil 13 dikonversi ke string dan dimasukkan ke template
   • String "Penjumlahan: 13" dikirim ke output stream (console)
  ↓
3️⃣ EKSEKUSI print('Pengurangan: ${nilai1 - nilai2}'):
   • Parser mengidentifikasi string interpolation
   • Evaluasi ekspresi nilai1 - nilai2:
     - Ambil nilai1 dari memory → 10
     - Ambil nilai2 dari memory → 3
     - CPU melakukan operasi pengurangan: 10 - 3 = 7
   • Output: "Pengurangan: 7"
  ↓
4️⃣ EKSEKUSI print('Pembagian: ${nilai1 / nilai2}'):
   • Evaluasi nilai1 / nilai2:
     - Dart mendeteksi operator / (pembagian double)
     - Konversi operand ke double: 10.0 / 3.0
     - CPU melakukan floating-point division
     - Hasil: 3.3333333333333335 (double precision)
   • Output: "Pembagian: 3.3333333333333335"
  ↓
✅ PROGRAM SELESAI: Semua instruksi telah dieksekusi, program terminate
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

**📋 Eksekusi Program Step-by-Step:**
```
🎯 PROGRAM START: main() function dipanggil
  ↓
1️⃣ DEKLARASI & INISIALISASI:
   • Stack frame dibuat untuk main()
   • Memory allocation untuk variabel "penghitung" (int)
   • Nilai 5 di-store ke memory address penghitung
  ↓
2️⃣ EKSEKUSI print('Nilai awal: $penghitung'):
   • String interpolation evaluation: $penghitung
   • Memory read: ambil nilai dari address penghitung → 5
   • String concatenation: "Nilai awal: " + "5"
   • Output ke console: "Nilai awal: 5"
  ↓
3️⃣ EKSEKUSI print('Post-increment: ${penghitung++}'):
   • Evaluasi expresi penghitung++:
     - Memory read: baca nilai current penghitung → 5
     - SIMPAN nilai current (5) untuk return value expression
     - Memory write: increment nilai di address penghitung (5 → 6)
     - Return saved value (5) untuk string interpolation
   • Output: "Post-increment: 5"
   • State sekarang: penghitung = 6 di memory
  ↓
4️⃣ EKSEKUSI print('Pre-increment: ${++penghitung}'):
   • Evaluasi expresi ++penghitung:
     - Memory read: baca nilai current penghitung → 6
     - Memory write: increment dulu (6 → 7)
     - Return new value (7) untuk string interpolation
   • Output: "Pre-increment: 7"
   • State sekarang: penghitung = 7 di memory
  ↓
✅ STACK CLEANUP: main() stack frame di-deallocate, program terminate
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

**📋 Eksekusi Perbandingan dalam Program:**
```
🎯 PROGRAM START: main() function execution
  ↓
1️⃣ VARIABLE DECLARATIONS:
   • Stack allocation untuk umur, batasMinum, batasVoting
   • Memory write: umur = 20, batasMinum = 21, batasVoting = 17
  ↓
2️⃣ EVALUASI print('umur == batasMinum: ${umur == batasMinum}'):
   • String interpolation processing: ${umur == batasMinum}
   • Expression evaluation umur == batasMinum:
     - Memory read: load umur value → 20
     - Memory read: load batasMinum value → 21
     - CPU comparison: 20 == 21 → false (boolean result)
   • String interpolation: "umur == batasMinum: " + "false"
   • Console output: "umur == batasMinum: false"
  ↓
3️⃣ EVALUASI print('umur < batasMinum: ${umur < batasMinum}'):
   • Expression evaluation umur < batasMinum:
     - Memory read: load umur → 20
     - Memory read: load batasMinum → 21
     - CPU comparison: 20 < 21 → true (boolean result)
   • Console output: "umur < batasMinum: true"
  ↓
4️⃣ EVALUASI print('umur >= batasVoting: ${umur >= batasVoting}'):
   • Expression evaluation umur >= batasVoting:
     - Memory read: load umur → 20
     - Memory read: load batasVoting → 17
     - CPU comparison: 20 >= 17 → true (boolean result)
   • Console output: "umur >= batasVoting: true"
  ↓
✅ STACK CLEANUP: main() execution complete, memory deallocated
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

**📋 Eksekusi Operator Logika dengan Short-Circuit Evaluation:**
```
🎯 PROGRAM START: main() function di call stack
  ↓
1️⃣ VARIABLE INITIALIZATION di stack frame:
   • mahasiswa = true (1 byte boolean di memory)
   • punyaKTP = false (1 byte boolean di memory)  
   • umur = 19 (4 byte integer di memory)
  ↓
2️⃣ EVALUASI bisaMasukPerpustakaan = mahasiswa && punyaKTP:
   • Dart menggunakan SHORT-CIRCUIT EVALUATION:
     - Memory read: load mahasiswa → true
     - Karena operator && dan left operand = true, lanjut evaluasi right operand
     - Memory read: load punyaKTP → false  
     - CPU logical operation: true && false = false
   • Memory write: store false ke variable bisaMasukPerpustakaan
  ↓
3️⃣ EVALUASI dapatDiskon = mahasiswa || (umur < 18):
   • SHORT-CIRCUIT EVALUATION untuk operator ||:
     - Memory read: load mahasiswa → true
     - Karena left operand = true pada operator ||, 
       Dart SKIP evaluasi right operand (umur < 18)
     - Result langsung = true (optimization)
   • Memory write: store true ke variable dapatDiskon
  ↓
4️⃣ EVALUASI layakProgram = mahasiswa && (umur >= 18) && (punyaKTP || umur > 21):
   • Evaluasi left-to-right dengan short-circuiting:
     - Memory read: mahasiswa → true, lanjut
     - Evaluasi (umur >= 18): 19 >= 18 → true, lanjut
     - Evaluasi (punyaKTP || umur > 21):
       * Memory read: punyaKTP → false
       * Karena left = false, evaluasi right: umur > 21
       * 19 > 21 → false
       * false || false = false
     - Final: true && true && false = false
   • Memory write: store false ke layakProgram
  ↓
✅ EXECUTION COMPLETE: Stack frame cleaned up
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

**📋 Eksekusi Conditional Branching dalam Program:**
```
🎯 PROGRAM START: main() function loaded ke call stack
  ↓
1️⃣ VARIABLE DECLARATIONS & INITIALIZATION:
   • Stack frame allocation: suhu (int), cuaca (String)
   • Memory write: suhu = 28, cuaca = "cerah" (string di heap)
  ↓
2️⃣ CONDITIONAL CHECK: if (suhu > 30)
   • Program counter di instruction: if (suhu > 30)
   • CPU load: register A = suhu value → 28
   • CPU load: register B = literal → 30  
   • CPU compare: 28 > 30 → false (zero flag set)
   • Branch predictor: predict NOT taken
   • Program counter SKIP if-block, jump ke next statement
  ↓
3️⃣ CONDITIONAL CHECK: if (suhu < 15) else branch
   • CPU comparison: 28 < 15 → false
   • Program counter skip if-block
   • Program counter jump ke ELSE clause
   • Execute else block: print('Pakaian ringan sudah cukup')
  ↓
4️⃣ MULTI-CONDITIONAL CHAIN if-else if-else:
   • First check: suhu >= 35 → 28 >= 35 → false, skip block
   • Second check: suhu >= 25 → 28 >= 25 → true (condition met!)
   • Program counter enter true branch
   • Execute: print('Hangat dan menyenangkan')  
   • Program counter SKIP remaining else-if conditions (short-circuit)
  ↓
5️⃣ NESTED CONDITIONAL:
   • Outer check: suhu > 20 → 28 > 20 → true, enter outer block
   • Inner check: cuaca == 'cerah' 
     - String comparison: memory reference comparison
     - String content comparison: 'cerah' == 'cerah' → true
   • Execute nested block: print('Hari yang sempurna...')
  ↓
✅ EXECUTION COMPLETE: Stack frame deallocated, program counter to end
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

**📋 Eksekusi For Loop dalam Call Stack:**
```
🎯 PROGRAM START: main() function execution begins
  ↓
1️⃣ LOOP INITIALIZATION: for (int i = 5; i >= 1; i--)
   • Stack frame expansion: allocate memory untuk loop variable i
   • Memory write: i = 5 (initial value assignment)
   • Program counter positioned di loop header
  ↓
2️⃣ LOOP ITERATION #1:
   • CONDITION CHECK: i >= 1
     - CPU load: register A = i value → 5
     - CPU load: register B = literal → 1  
     - CPU compare: 5 >= 1 → true (condition flag set)
     - Branch predictor: predict TAKEN (enter loop body)
   • LOOP BODY EXECUTION:
     - Program counter jump ke loop body
     - Execute: print('5...') → string ke output buffer
   • LOOP INCREMENT: i--
     - CPU load: current i value → 5
     - CPU operation: decrement → 4
     - Memory write: store 4 back ke variable i
   • Program counter jump back ke condition check
  ↓
3️⃣ LOOP ITERATION #2:
   • CONDITION CHECK: i >= 1 → 4 >= 1 → true
   • BODY: print('4...'), increment: i-- (4 → 3)
   • Program counter loop back
  ↓
4️⃣ LOOP ITERATIONS #3, #4, #5:
   • Iterations continue dengan same pattern
   • i values: 3 → 2 → 1 (successive decrements)
   • Each iteration: condition check → body execution → increment
  ↓
5️⃣ LOOP TERMINATION:
   • CONDITION CHECK: i >= 1 → 0 >= 1 → false
   • Branch predictor: predict NOT TAKEN
   • Program counter SKIP loop body, jump ke post-loop code
   • Loop variable i automatically deallocated dari stack
  ↓
6️⃣ POST-LOOP EXECUTION:
   • Execute: print('Selamat! 🎉')
   • Continue dengan remaining main() instructions
  ↓
✅ LOOP COMPLETE: Stack cleanup, program counter advance
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

**📋 Eksekusi While Loop dengan Memory Management:**
```
🎯 PROGRAM START: main() function dalam call stack
  ↓
1️⃣ VARIABLE INITIALIZATION:
   • Stack allocation: variabel hitungan (int type, 4 bytes)
   • Memory write: store nilai 1 ke address hitungan
   • Program counter advance ke while statement
  ↓
2️⃣ WHILE LOOP ENTRY: while (hitungan <= 3)
   • Program counter positioned di loop condition
   • Dart compiler set up loop control structure
  ↓
3️⃣ ITERATION #1:
   • CONDITION EVALUATION:
     - CPU load: register A = hitungan value → 1
     - CPU load: register B = literal value → 3
     - CPU compare: 1 <= 3 → true (condition satisfied)
     - Branch predictor: predict TAKEN (enter loop body)
   • LOOP BODY EXECUTION:
     - Program counter jump ke loop body instructions
     - Execute print('Hitungan: 1') → string buffer output
     - Execute hitungan++:
       * Memory read: load current hitungan → 1
       * CPU arithmetic: increment operation → 2
       * Memory write: store 2 back ke hitungan address
   • LOOP CONTINUATION:
     - Program counter jump back ke condition check
  ↓
4️⃣ ITERATION #2:
   • CONDITION: hitungan <= 3 → 2 <= 3 → true
   • BODY: print('Hitungan: 2'), hitungan++ (2 → 3)
   • Program counter loop back
  ↓
5️⃣ ITERATION #3:
   • CONDITION: hitungan <= 3 → 3 <= 3 → true
   • BODY: print('Hitungan: 3'), hitungan++ (3 → 4)  
   • Program counter loop back
  ↓
6️⃣ LOOP TERMINATION:
   • CONDITION: hitungan <= 3 → 4 <= 3 → false
   • Branch predictor: predict NOT TAKEN
   • Program counter exit loop, jump ke post-loop instructions
   • Variabel hitungan remains di stack (scope masih aktif)
  ↓
✅ POST-LOOP: Continue dengan next statements dalam main()
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

**📋 Eksekusi Break dan Continue dengan Jump Instructions:**
```
CONTOH BREAK: Mencari bilangan genap pertama
🎯 PROGRAM START: for loop initialization dalam call stack
  ↓
1️⃣ LOOP ITERATION i=1:
   • Loop condition: i <= 10 → 1 <= 10 → true
   • Program counter enter loop body
   • Condition check: i % 2 == 0 → 1 % 2 == 0 → false
   • Program counter skip if-block (no break executed)
   • Execute: print('1 adalah ganjil, lanjutkan...')
   • Loop increment: i++ (1 → 2)
   • Program counter jump back ke loop condition
  ↓
2️⃣ LOOP ITERATION i=2:
   • Loop condition: 2 <= 10 → true, enter body
   • Condition check: i % 2 == 0 → 2 % 2 == 0 → true
   • Program counter enter if-block
   • Execute: print('Bilangan genap ditemukan: 2')
   • BREAK STATEMENT EXECUTION:
     - CPU execute jump instruction (unconditional branch)
     - Program counter IMMEDIATELY jump keluar dari loop
     - Stack cleanup: loop variables maintained tapi loop terminated
     - Remaining iterations (i=3,4,5...10) TIDAK dieksekusi
  ↓
✅ POST-LOOP: Program counter lanjut ke statement setelah loop

CONTOH CONTINUE: Melewati bilangan ganjil
🎯 LOOP ITERATIONS dengan continue logic:
  ↓
1️⃣ ITERATION i=1:
   • Condition: i % 2 == 1 → 1 % 2 == 1 → true
   • CONTINUE STATEMENT EXECUTION:
     - CPU execute conditional jump ke loop increment
     - Program counter SKIP remaining loop body statements
     - Skip: print('Bilangan genap: 1') tidak dieksekusi
     - Jump langsung ke i++ dan condition check
  ↓
2️⃣ ITERATION i=2:
   • Condition: i % 2 == 1 → 2 % 2 == 1 → false
   • Continue NOT executed, program counter lanjut normal
   • Execute: print('Bilangan genap: 2')
   • Normal loop increment dan condition check
  ↓
✅ PATTERN CONTINUES: Continue mempengaruhi control flow per-iteration
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

**📋 Eksekusi Function Calls dengan Call Stack Management:**
```
🎯 PROGRAM START: Dart runtime load main() ke call stack
  ↓
1️⃣ CALL STACK FRAME #1: main() function
   • Stack pointer allocation untuk main() local variables
   • Program counter positioned di first instruction dalam main()
  ↓
2️⃣ FUNCTION CALL: sapaUser()
   • CALL INSTRUCTION:
     - Push current program counter (return address) ke stack
     - Create new stack frame untuk sapaUser()  
     - Program counter jump ke sapaUser() function address
   • FUNCTION EXECUTION:
     - Execute: print('Selamat datang di aplikasi Flutter kami!')
     - String literal loaded ke heap, output ke console
   • FUNCTION RETURN:
     - Pop sapaUser() stack frame
     - Program counter restore ke saved return address
     - Control kembali ke main() function
  ↓
3️⃣ FUNCTION CALL: tambahAngka(5, 3)
   • PARAMETER PASSING:
     - Push argument values ke stack: 5, 3
     - Create stack frame untuk tambahAngka()
     - Map parameters: a=5, b=3 dalam function scope
   • FUNCTION EXECUTION:
     - Load a value ke register: 5
     - Load b value ke register: 3  
     - CPU addition: 5 + 3 = 8
     - Store result dalam return value register
   • FUNCTION RETURN:
     - Return value (8) passed back melalui register
     - Pop function stack frame
     - Program counter restore, control ke main()
     - Assign returned value ke variable: jumlah = 8
  ↓
4️⃣ FUNCTION CALL: hitungLuas(5.0)
   • PARAMETER PASSING: 5.0 (double) passed via floating-point register
   • FUNCTION EXECUTION:
     - Expression evaluation: 3.14159 * 5.0 * 5.0
     - CPU floating-point operations: 
       * Load 3.14159 ke FPU register
       * Multiply: 3.14159 * 5.0 = 15.70795
       * Multiply: 15.70795 * 5.0 = 78.53975
   • RETURN: hasil (78.53975) via floating-point return register
  ↓
✅ STACK CLEANUP: main() stack frame deallocated, program terminate
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

**📋 Parameter Handling dan Memory Layout dalam Function Calls:**
```
FUNCTION CALL: formatNama('John')
🎯 CALL STACK SETUP: Parameter passing mechanism
  ↓
1️⃣ PARAMETER PREPARATION:
   • Dart compiler analyze function signature: formatNama(String namaDepan, [String? namaBelakang])
   • REQUIRED PARAMETER: namaDepan
     - Argument 'John' di-evaluate
     - String 'John' allocated di heap memory  
     - String reference (pointer) passed ke function
   • OPTIONAL PARAMETER: namaBelakang
     - No argument provided untuk optional parameter
     - Default value null assigned automatically
  ↓
2️⃣ STACK FRAME CREATION:
   • New stack frame allocated untuk formatNama()
   • Parameter mapping dalam function scope:
     - namaDepan: String reference pointing ke 'John' di heap
     - namaBelakang: null reference (default value)
   • Local variable space reserved
  ↓
3️⃣ FUNCTION BODY EXECUTION:
   • CONDITIONAL CHECK: if (namaBelakang != null)
     - Load namaBelakang value ke register → null
     - CPU comparison: null != null → false
     - Branch prediction: NOT TAKEN (skip if-block)
   • ELSE PATH: return namaDepan
     - Load namaDepan reference
     - Return string reference 'John' via return register
  ↓
4️⃣ STACK CLEANUP:
   • Function stack frame deallocated
   • Parameter values cleaned up (stack unwinding)
   • Return value 'John' available di calling context
   • Program counter restore ke call site
  ↓
✅ RESULT: String 'John' returned ke caller

FUNCTION CALL: formatNama('Jane', 'Smith')
🎯 DIFFERENT PARAMETER SCENARIO:
  ↓
1️⃣ PARAMETER SETUP:
   • REQUIRED: namaDepan = 'Jane' (string heap allocation)
   • OPTIONAL: namaBelakang = 'Smith' (provided argument)
     - Override default null dengan actual value
  ↓
2️⃣ EXECUTION PATH:
   • CONDITIONAL: namaBelakang != null → 'Smith' != null → true
   • BRANCH TAKEN: enter if-block
   • STRING CONCATENATION:
     - Template literal processing: '$namaDepan $namaBelakang'  
     - Dart string interpolation engine:
       * Load namaDepan → 'Jane'
       * Load namaBelakang → 'Smith'
       * Heap allocation untuk result string
       * Memory copy: 'Jane' + ' ' + 'Smith' = 'Jane Smith'
   • RETURN: reference ke new string 'Jane Smith'
  ↓
✅ RESULT: String 'Jane Smith' dengan different execution path
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

**📋 Compilation dan Eksekusi: Traditional vs Arrow Function:**
```
🎯 COMPILE-TIME ANALYSIS: Dart compiler processing function definitions
  ↓
1️⃣ TRADITIONAL FUNCTION COMPILATION:
   int kalikan(int a, int b) {
     return a * b;
   }
   • Dart compiler parsing:
     - Function signature analysis: name=kalikan, params=(int a, int b), return=int
     - Body analysis: single return statement dengan expression
     - Generate bytecode: parameter load, multiply operation, return instruction
     - Symbol table entry: kalikan → function address dalam compiled code
  ↓
2️⃣ ARROW FUNCTION COMPILATION:
   int kalikan(int a, int b) => a * b;
   • Dart compiler parsing:
     - Same signature analysis: identical parameter dan return types
     - Body analysis: single expression (no explicit return statement)
     - OPTIMIZATION: compiler recognize simple expression pattern
     - Generate IDENTICAL bytecode: same instructions sebagai traditional function
     - NO performance difference dalam compiled code
  ↓
3️⃣ RUNTIME EXECUTION COMPARISON:
   • FUNCTION CALL: kalikan(4, 5)
   • STACK FRAME SETUP: identical untuk both versions
     - Parameter passing: a=4, b=5 ke function scope
     - Local variable allocation (none needed untuk simple expression)
   • BYTECODE EXECUTION:
     - Load parameter a ke CPU register → 4
     - Load parameter b ke CPU register → 5  
     - CPU multiply instruction: 4 * 5 = 20
     - Store result dalam return value register
   • RETURN MECHANISM: identical untuk both versions
     - Return value 20 passed back ke caller
     - Stack frame cleanup
  ↓
✅ CONCLUSION: Arrow syntax = syntactic sugar (compilation shorthand)
   Kedua functions produce identical machine code dan runtime behavior
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

**📋 List Operations dengan Memory Management dan Array Manipulation:**
```
🎯 INITIAL STATE: List creation dan memory allocation
  ↓
1️⃣ LIST INITIALIZATION: ['merah', 'hijau', 'biru']
   • Dart allocate dynamic array structure di heap
   • Array metadata: length=3, capacity=4 (over-allocation untuk growth)
   • String references stored di array slots:
     - Index 0: pointer ke 'merah' string di heap
     - Index 1: pointer ke 'hijau' string di heap  
     - Index 2: pointer ke 'biru' string di heap
     - Index 3: null (unused capacity)
   • Variable warna: reference ke array object di heap
  ↓
2️⃣ OPERATION: warna.add('kuning')
   • METHOD CALL: add() function di List class
   • CAPACITY CHECK: current length (3) < capacity (4) → no reallocation needed
   • APPEND OPERATION:
     - String 'kuning' allocated di heap
     - Store reference di index 3
     - Increment array length: 3 → 4
   • MEMORY STATE: ['merah', 'hijau', 'biru', 'kuning'] dengan capacity=4
  ↓
3️⃣ OPERATION: warna.addAll(['orange', 'ungu'])
   • CAPACITY CHECK: need space untuk 2 more items (4 + 2 = 6 > capacity 4)
   • DYNAMIC RESIZE:
     - Allocate new array dengan capacity 8 (double previous capacity)
     - Memory copy: transfer all existing references ke new array
     - Deallocate old array memory (garbage collection)
   • APPEND OPERATIONS:
     - Add 'orange' reference di index 4
     - Add 'ungu' reference di index 5  
     - Update length: 4 → 6
  ↓
4️⃣ OPERATION: warna.insert(1, 'pink')
   • INSERT PREPARATION: need space di index 1
   • ELEMENT SHIFTING:
     - Array elements di indices 1,2,3,4,5 must shift right
     - Copy references: index 5→6, 4→5, 3→4, 2→3, 1→2 (backwards order)
     - CPU: multiple memory copy operations untuk preserve order
   • INSERT: place 'pink' reference di newly empty index 1
   • UPDATE: increment length 6 → 7
   • FINAL ORDER: ['merah', 'pink', 'hijau', 'biru', 'kuning', 'orange', 'ungu']
  ↓
5️⃣ OPERATION: warna.remove('hijau')
   • LINEAR SEARCH: iterate melalui array untuk find 'hijau'
     - Compare references: warna[0] != 'hijau', warna[1] != 'hijau', warna[2] == 'hijau' ✓
   • REMOVAL: found di index 2
   • ELEMENT SHIFTING:
     - Elements di indices 3,4,5,6 shift left ke fill gap
     - Copy references: 3→2, 4→3, 5→4, 6→5
   • UPDATE: decrement length 7 → 6, set index 6 = null
   • STRING DEALLOCATION: 'hijau' eligible untuk garbage collection
  ↓
✅ FINAL STATE: List dengan optimized memory layout dan maintained ordering
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

**📋 Set Operations dengan Hash Table Implementation dan Uniqueness Guarantee:**
```
🎯 SET CREATION: Dart internal hash table allocation
  ↓
1️⃣ INITIALIZATION: Set<int> angka = {1, 2, 3, 2, 1}
   • Dart allocate hash table structure di heap
   • Hash table metadata: buckets array, load factor, collision handling
   • ELEMENT PROCESSING (left-to-right):
  ↓
2️⃣ ELEMENT 1 (first occurrence):
   • HASH COMPUTATION: hash(1) → hash value (contoh: 0x1A4B)
   • BUCKET SELECTION: hash % bucket_count → bucket index
   • COLLISION CHECK: bucket empty → no collision
   • STORE: place value 1 di selected bucket
   • SET STATE: {1}
  ↓
3️⃣ ELEMENT 2:
   • HASH: hash(2) → different hash value
   • BUCKET: different bucket than element 1
   • STORE: value 2 added ke hash table
   • SET STATE: {1, 2} (order not guaranteed dalam hash table)
  ↓
4️⃣ ELEMENT 3:
   • HASH: hash(3) → unique hash value
   • STORE: value 3 added
   • SET STATE: {1, 2, 3}
  ↓
5️⃣ ELEMENT 2 (duplicate):
   • HASH: hash(2) → same hash value sebagai sebelumnya
   • BUCKET: same bucket sebagai original 2
   • COLLISION DETECTION: bucket contains value 2
   • EQUALITY CHECK: new value (2) == existing value (2) → true
   • DUPLICATE HANDLING: IGNORE new value (no insertion)
   • SET STATE: remains {1, 2, 3}
  ↓
6️⃣ ELEMENT 1 (duplicate):
   • HASH: hash(1) → same hash sebagai original 1
   • EQUALITY CHECK: duplicate detected
   • IGNORE: no change ke set
   • FINAL SET STATE: {1, 2, 3}
  ↓
✅ UNIQUENESS GUARANTEED: Hash table automatically prevents duplicates
   Time complexity: O(1) average untuk add/contains operations
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

**📋 Map Operations dengan Hash Table Key-Value Storage dan Dynamic Resizing:**
```
🎯 MAP INITIALIZATION: Hash table creation dengan key-value pairs
  ↓
1️⃣ MAP CREATION: {'Alice': 25, 'Bob': 30, 'Charlie': 35}
   • Dart allocate hash table structure di heap
   • Table structure: array of buckets, each bucket dapat hold multiple key-value pairs
   • ENTRY INSERTION PROCESS:
  ↓
2️⃣ ENTRY: 'Alice' → 25
   • KEY HASHING: hash('Alice') → hash value (contoh: 0x8F2A)
   • BUCKET SELECTION: hash % bucket_count → bucket index
   • STORAGE: create key-value pair object {'Alice': 25} di selected bucket
   • METADATA UPDATE: increment map size counter
  ↓
3️⃣ ACCESS OPERATION: umur['Alice']
   • KEY LOOKUP PROCESS:
     - Hash computation: hash('Alice') → same hash value (0x8F2A)
     - Bucket selection: locate same bucket sebagai insertion
     - BUCKET SEARCH: iterate melalui key-value pairs dalam bucket
     - KEY COMPARISON: compare 'Alice' == stored key → match found
     - VALUE RETRIEVAL: return associated value → 25
   • CPU LOAD: value 25 loaded ke register untuk expression evaluation
  ↓
4️⃣ UPDATE OPERATION: umur['Alice'] = 26
   • KEY LOOKUP: same hashing dan bucket selection process
   • KEY FOUND: locate existing 'Alice' entry dalam hash table
   • VALUE UPDATE: overwrite old value (25) dengan new value (26)
   • NO SIZE CHANGE: map size remains same (update, bukan insertion)
   • MEMORY OPTIMIZATION: old value 25 eligible untuk garbage collection
  ↓
5️⃣ INSERTION: umur['Diana'] = 28
   • NEW KEY HASHING: hash('Diana') → new hash value
   • LOAD FACTOR CHECK: (current_size + 1) / bucket_count
   • IF LOAD FACTOR > threshold (typically 0.75):
     - DYNAMIC RESIZE: allocate new hash table dengan 2x bucket count
     - REHASHING: recalculate hash values untuk all existing entries
     - MIGRATION: move all key-value pairs ke new table structure
     - DEALLOCATION: old table eligible untuk garbage collection
   • INSERT: add new key-value pair ke appropriate bucket
  ↓
6️⃣ REMOVAL: umur.remove('Charlie')
   • KEY LOOKUP: hash('Charlie') dan locate bucket
   • ENTRY REMOVAL: delete key-value pair dari bucket
   • RETURN VALUE: return removed value (35) ke caller
   • SIZE UPDATE: decrement map size counter
   • MEMORY CLEANUP: removed entry eligible untuk garbage collection
  ↓
✅ OPTIMIZED STORAGE: Hash table maintains O(1) average lookup time
   Dynamic resizing ensures efficient memory usage dan performance
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

# 🎮 Godot Engine 2D Platformer Game

Repository ini berisi proyek permainan 2D Platformer sederhana yang dikembangkan menggunakan **Godot Engine 4**[cite: 1]. Proyek ini disusun sebagai bagian dari luaran praktikum mata kuliah **Workshop Pengembangan Perangkat Lunak dan Gim**[cite: 1].

---

## 📌 Deskripsi Proyek

Proyek ini mendemonstrasikan implementasi dasar mekanika gim 2D, mulai dari kontrol fisik karakter, tata letak lingkungan (*stage*), hingga logika kondisi kemenangan (*win condition*)[cite: 1].

### ✨ Fitur Utama
* **Karakter Terkontrol (`CharacterBody2D`):** Pergerakan horizontal (kiri/kanan) dan mekanika melompat dengan perhitungan fisika gravitasi[cite: 1, 3].
* **Pengisian Animasi & Visual:** Integrasi *sprite sheet* / *animated sprite* dengan penyesuaian pembalikan arah (*flip_h*)[cite: 1, 3].
* **Desain Lingkungan & Stage (`TileMapLayer`):** Peta berbasis grid untuk lantai, platform, dan latar belakang gim[cite: 1, 4].
* **Sistem Kolisi (*Collision Detection*):** Deteksi tabrakan fisik antara karakter, platform, rintangan, dan objek *finish*[cite: 1].
* **Titik Finish & Win Screen (`Area2D` & `Control`):** Pemicu kondisi menang saat pemain menyentuh titik tujuan, menampilkan *Win Screen* ("YOU WIN!!!"), memberhentikan permainan, dan keluar secara otomatis melalui skrip[cite: 1].

---

## 🛠️ Tools & Tech Stack

| Perangkat Lunak / Tool | Fungsi / Peran |
| :--- | :--- |
| **[Godot Engine 4](https://godotengine.org/)** | Utama (Game Engine & Scripting)[cite: 1] |
| **GDScript** | Bahasa pemrograman logika objek & karakter[cite: 1] |
| **[GIMP](https://www.gimp.org/)** | Penyuntingan grafis bitmap / raster |
| **[Inkscape](https://inkscape.org/)** | Penyuntingan grafis vektor & elemen UI |
| **[Audacity](https://www.audacityteam.org/)** | Pengolahan audio & efek suara |
| **[BFXR](https://www.bfxr.net/)** | Generator efek suara 8-bit / retro |

---

## 📁 Struktur Proyek

```text
Godot-Engine/
├── scenes/
│   ├── stage.tscn        # Scene utama level gim[cite: 2]
│   ├── player.tscn       # Scene karakter pemain[cite: 1, 3]
│   ├── coin.tscn         # Scene titik finish / collectible[cite: 1, 2]
│   └── win_screen.tscn   # Scene / Node UI Kemenangan[cite: 1]
├── scripts/
│   ├── Player.gd         # Skrip logika pergerakan & gravitasi karakter[cite: 3]
│   ├── coin.gd           # Skrip interaksi titik finish & panggilan UI[cite: 2]
│   ├── tiles.gd          # Skrip pendukung TileMapLayer[cite: 4]
│   └── win_screen.gd     # Skrip kontrol penayangan UI & hitung mundur[cite: 1]
├── assets/               # File gambar, sprite sheet, dan audio[cite: 1]
└── project.godot         # Konfigurasi utama proyek Godot[cite: 1]

```

---

## 🚀 Cara Menjalankan Proyek

1. **Clone Repository**
```bash
git clone [https://github.com/AdhyDa/Godot-Engine.git](https://github.com/AdhyDa/Godot-Engine.git)

```


2. **Buka Proyek di Godot**
* Buka **Godot Engine** (versi 4.x yang disarankan).
* Klik tombol **Import** pada Project Manager.
* Arahkan ke folder hasil *clone*, lalu pilih file `project.godot`.




3. **Jalankan Gim**
* Tekan tombol **F5** (atau tombol *Play* di pojok kanan atas editor Godot) untuk menjalankan scene utama (`stage.tscn`).





---

## 🎮 Kontrol Permainan

| Tombol / Input | Aksi |
| --- | --- |
| **A / Panah Kiri** | Bergerak ke kiri

 |
| **D / Panah Kanan** | Bergerak ke kanan

 |
| **Spacebar / UI Accept** | Melompat

 |

---

## 👨‍💻 Penulis

**Adhyaksa Daudi**

* GitHub: [@AdhyDa](https://www.google.com/search?q=https://github.com/AdhyDa)
* Program Studi / Jurusan: Pendidikan Teknik Informatika, Universitas Negeri Malang

---

*Proyek ini dibuat untuk memenuhi tugas praktikum Workshop Pengembangan Perangkat Lunak dan Gim.*

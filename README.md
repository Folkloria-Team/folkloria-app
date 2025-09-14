# Folkloria

[![Stars](https://img.shields.io/github/stars/Folkloria-Team/folkloria-app.svg)](https://github.com/Folkloria-Team/folkloria-app/stargazers)
[![Forks](https://img.shields.io/github/forks/Folkloria-Team/folkloria-app.svg)](https://github.com/Folkloria-Team/folkloria-app/network/members)
[![Watchers](https://img.shields.io/github/watchers/Folkloria-Team/folkloria-app.svg)](https://github.com/Folkloria-Team/folkloria-app/watchers)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Folkloria-Team/folkloria-app/blob/main/LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)

This project is part of the capstone project for  
**BEKUP Create: Upskilling Bootcamp 2025 - Flutter Path**

Star ⭐ the repository if you like what you see!

---

## 📖 About Folkloria

Folkloria adalah aplikasi mobile interaktif yang bertujuan melestarikan cerita rakyat Indonesia melalui teknologi. Aplikasi ini menyajikan cerita rakyat dari berbagai daerah dalam format digital yang menarik, mudah diakses, dan edukatif, khususnya untuk anak-anak dan remaja. Dengan peta interaktif Indonesia, pengguna dapat menjelajahi dan membaca cerita rakyat dari berbagai wilayah.

---

## ✨ Folkloria Features

- 🗺️ **Peta Interaktif**: Eksplorasi cerita rakyat melalui peta Indonesia dengan marker yang dapat diklik.
- 📚 **Daftar & Detail Cerita**: Menampilkan 5–10 cerita rakyat lengkap dengan ilustrasi dan (opsional) audio.
- 💾 **Penyimpanan Offline**: Cerita dapat diakses tanpa koneksi internet menggunakan Hive/SharedPreferences.
- 🎨 **UI Ramah Anak**: Desain antarmuka menarik dan edukatif.
- 🔊 **(Opsional) Audio & Gamifikasi**: Fitur audio narasi dan placeholder gamifikasi (jika waktu memungkinkan).

---

## 👥 Team Members

- BC25B058 - Alan Aditya
- BC25B060 - Ahnaf
- BC25B077 - Muhammad Radifa
- BC25B095 - Arnan Refael Adriwinoto

---

## 🗓️ Development Timeline

- **Minggu 1:** Wireframe, desain UI awal, format data JSON
- **Minggu 2:** Peta interaktif & layanan pembaca data
- **Minggu 3:** Daftar & detail cerita, integrasi data ke UI
- **Minggu 4:** Penyimpanan offline, uji coba fitur utama, perbaikan bug
- **Minggu 5 (opsional):** Audio, placeholder gamifikasi, build final aplikasi

---

## 🛠️ Tech Stack

| Feature            | Package/Tool                                                                                            |
| ------------------ | ------------------------------------------------------------------------------------------------------- |
| Framework          | [Flutter](https://flutter.dev/)                                                                         |
| State Management   | [Provider](https://pub.dev/packages/provider)                                                           |
| Local Storage      | [Hive](https://pub.dev/packages/hive), [SharedPreferences](https://pub.dev/packages/shared_preferences) |
| UI/UX Design       | [Figma](https://figma.com/)                                                                             |
| Backend (lanjutan) | [NestJS](https://nestjs.com/), [MySQL](https://www.mysql.com/)                                          |

---

## 🖼️ Screenshots

|                                                |                                                     |                                                       |
| :--------------------------------------------: | :-------------------------------------------------: | :---------------------------------------------------: |
|              **Peta Interaktif**               |                  **Daftar Cerita**                  |                   **Detail Cerita**                   |
| ![Peta Interaktif](images/screenshots/map.png) | ![Daftar Cerita](images/screenshots/story_list.png) | ![Detail Cerita](images/screenshots/story_detail.png) |

> Tambahkan screenshot aplikasi Anda di folder `images/screenshots/` untuk menampilkan preview di sini.

---

## 🚀 Build & Run Folkloria

1. Clone repository ini:
   ```bash
   git clone https://github.com/Folkloria-Team/folkloria-app.git
   cd folkloria-app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

---

## 📚 Sumber Data Cerita

Cerita rakyat diambil dari berbagai sumber daring (blog dongeng, portal pendidikan, dsb) melalui proses web scraping, karena belum tersedia API publik khusus cerita rakyat Indonesia.

---

## 📋 Project Management

- ClickUp — Manajemen tugas dan kolaborasi tim
- Figma — Desain UI/UX

---

## 🧭 SWOT (Ringkasan)

- **Strengths:** Nilai budaya tinggi, inovasi digital, gamifikasi, aksesibilitas luas
- **Weaknesses:** Fitur awal terbatas, ketergantungan perangkat, validasi pengguna, konten terbatas
- **Opportunities:** Minat generasi muda, dukungan pemerintah, potensi ekspansi, kerja sama lintas sektor
- **Threats:** Kompetisi aplikasi hiburan, perubahan preferensi pengguna, isu hak cipta, kendala distribusi

---

> Folkloria — Menghidupkan kembali cerita rakyat Indonesia melalui teknologi.

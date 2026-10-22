# Menggunakan `superior-ui`

Skill ini membangun, merombak, atau memperhalus antarmuka produk berdasarkan bukti proyek, konten nyata, state fungsional, dan komposisi visual yang disengaja.

## Kapan dipakai

Gunakan untuk implementasi halaman, komponen, dashboard, alur produk, atau redesign yang memang memerlukan perubahan kode UI. Untuk laporan read-only gunakan `superior-ui-audit`; untuk perubahan behavior nonvisual gunakan `superior-logic`.

## Alur kerja

1. Pelajari pengguna, tugas utama, design owner, komponen, token, dan pola yang sudah ada.
2. Tentukan tesis visual serta hierarki sebelum menulis detail dekoratif.
3. Bangun dengan struktur semantik, konten nyata, dan state loading/empty/error/success.
4. Pastikan kontrol benar-benar berfungsi dan terhubung ke perilaku yang dimaksud.
5. Kritik hasil pada tingkat halaman, komponen, dan detail; lalu uji viewport serta interaksi utama.

Jika proyek belum memiliki arah visual yang mengikat, skill dapat menawarkan dua atau tiga style yang sesuai, menjelaskan kecocokan dan risikonya, lalu memilih satu arah utama sebelum implementasi. Referensi warna dipetakan ke token semantik untuk body, component, typography, interaction, dan state; urutan warna pada palet tidak otomatis menentukan penggunaannya.

Untuk design recreation, screenshot digunakan sebagai evidence hierarki dan proporsi, bukan ukuran CSS yang pasti. Skill memeriksa typography token yang sudah ada terlebih dahulu; bila belum ada, skill memulai dari baseline body, control, dan caption yang terbaca lalu menyesuaikannya terhadap hasil render, bukan menyalin apparent pixel yang terlalu kecil.

Untuk landing page dan homepage, skill juga memperlakukan footer sebagai penutup komposisi yang disengaja. Skill memilih mode minimal utility, sitemap, conversion, editorial, atau product-service dari route dan konten nyata, bukan menjadikan strip tipis generik sebagai default atau mengarang link untuk memenuhi kolom.

Untuk halaman publik yang perlu ditemukan atau diindeks, skill mempertahankan hierarki HTML yang bermakna, source order yang stabil, navigasi yang dapat diikuti crawler, metadata milik route, dan strategi rendering proyek yang sudah ada. Persyaratan ini tidak otomatis berlaku pada dashboard privat atau tool yang memerlukan autentikasi.

## Contoh prompt

```text
$superior-ui Bangun halaman pengaturan tim mengikuti design system yang sudah ada. Sertakan loading, empty, error, dan success state.
```

```text
$superior-ui Redesign dashboard ini agar hierarki keputusan lebih jelas tanpa mengubah kontrak API.
```

## Kombinasi yang sesuai

- Tambahkan `superior-responsive` untuk adaptasi lintas ukuran.
- Tambahkan `superior-ux` bila journey, arsitektur informasi, task flow, feedback, atau recovery menjadi concern utama.
- Tambahkan `superior-accessibility` untuk pemeriksaan akses yang mendalam.
- Tambahkan `superior-copy` bila teks produk ikut dirancang.
- Tambahkan `superior-logic` bila API atau behavior aplikasi ikut berubah.
- Gunakan `superior-docs` setelah perubahan durable yang mengubah konteks proyek.

## Hasil yang perlu diperiksa

UI harus cocok dengan produk, bukan tampak seperti template generik. Hierarki, konten, state, dan interaksi harus lengkap. Pastikan konsisten dengan design system yang ada dan jangan menciptakan data, fitur, atau bukti sosial palsu.

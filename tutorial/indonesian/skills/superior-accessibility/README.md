# Menggunakan `superior-accessibility`

Skill ini menangani aksesibilitas antarmuka: semantik, urutan keyboard, fokus, nama yang dapat diakses, kontras, pengumuman status, dan perilaku saat zoom.

## Kapan dipakai

Gunakan ketika accessibility diminta, diwajibkan kontrak produk, atau perubahan interaction menciptakan risiko substansial: form, dialog, composite widget, navigasi, status dinamis, keyboard, atau assistive technology. Jangan aktifkan untuk setiap edit visual atau menjadikannya pengganti audit desain umum.

## Alur kerja

1. Jelaskan halaman, komponen, dan pengguna yang terdampak.
2. Minta pemeriksaan semantik native sebelum menambah ARIA.
3. Periksa keyboard, fokus, label, status, kontras, zoom, dan ukuran target.
4. Untuk interaction custom atau dinamis, verifikasi lifecycle keyboard, fokus, nama, state, dan announcement secara lengkap.
5. Jalankan pemeriksaan otomatis yang tersedia, lalu validasi manual pada alur kritis.
6. Sebutkan browser, platform, dan assistive technology yang benar-benar diuji serta laporkan kombinasi yang tidak tersedia.

## Contoh prompt

```text
$superior-accessibility Audit dan perbaiki modal checkout ini. Pastikan fokus masuk, terperangkap secara benar, lalu kembali ke tombol pemicu.
```

```text
$superior-accessibility Periksa form registrasi untuk label, pesan error, urutan tab, kontras, dan zoom 200%.
```

## Kombinasi yang sesuai

- Dengan `superior-ui` ketika aksesibilitas merupakan bagian dari pembangunan UI.
- Dengan `superior-responsive` untuk masalah zoom, reflow, dan target sentuh.
- Dengan `superior-code-review` ketika accessibility merupakan salah satu risiko dalam review change set yang lebih luas.
- Dengan `superior-ui-audit` hanya jika pengguna juga meminta audit aksesibilitas; audit visual sendiri tidak otomatis mencakupnya.

## Hasil yang perlu diperiksa

Pastikan seluruh kontrol dapat dioperasikan dengan keyboard, fokus terlihat, nama kontrol bermakna, status penting diumumkan, dan tidak ada informasi yang hanya bergantung pada warna. Hindari ARIA berlebihan dan jangan mengklaim kompatibilitas screen reader untuk environment yang tidak diuji.

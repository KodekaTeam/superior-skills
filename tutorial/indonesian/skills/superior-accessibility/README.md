# Menggunakan `superior-accessibility`

Skill ini menangani aksesibilitas antarmuka: semantik, urutan keyboard, fokus, nama yang dapat diakses, kontras, pengumuman status, dan perilaku saat zoom.

## Kapan dipakai

Gunakan saat membuat atau memeriksa komponen interaktif, form, dialog, navigasi, status dinamis, atau masalah penggunaan keyboard dan pembaca layar. Jangan jadikan skill ini pengganti audit visual umum atau perubahan aturan bisnis.

## Alur kerja

1. Jelaskan halaman, komponen, dan pengguna yang terdampak.
2. Minta pemeriksaan semantik native sebelum menambah ARIA.
3. Periksa keyboard, fokus, label, status, kontras, zoom, dan ukuran target.
4. Jalankan pemeriksaan otomatis yang tersedia, lalu validasi manual pada alur kritis.
5. Pastikan perbaikan tidak mengubah perilaku produk secara tidak sengaja.

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
- Dengan `superior-ui-audit` hanya jika pengguna juga meminta audit aksesibilitas; audit visual sendiri tidak otomatis mencakupnya.

## Hasil yang perlu diperiksa

Pastikan seluruh kontrol dapat dioperasikan dengan keyboard, fokus terlihat, nama kontrol bermakna, status penting diumumkan, dan tidak ada informasi yang hanya bergantung pada warna. Hindari ARIA berlebihan dan perubahan visual yang tidak diminta.

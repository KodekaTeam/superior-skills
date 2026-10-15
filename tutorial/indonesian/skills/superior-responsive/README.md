# Menggunakan `superior-responsive`

Skill ini memperbaiki cara UI beradaptasi terhadap ruang: reflow, overflow, navigasi, urutan konten, breakpoint berbasis konten, zoom, dan target sentuh.

## Kapan dipakai

Gunakan ketika layout pecah, konten terpotong, tabel tidak dapat digunakan, navigasi terlalu padat, atau komponen hanya dikecilkan tanpa recomposition. Jangan gunakan untuk redesign visual menyeluruh jika masalah utamanya bukan responsivitas.

## Alur kerja

1. Reproduksi kegagalan pada viewport dan konten nyata.
2. Temukan pemilik width, overflow, min-content, atau constraint yang menyebabkan masalah.
3. Recompose berdasarkan prioritas konten; jangan sekadar mengecilkan semua elemen.
4. Buat scroll lokal hanya pada area yang memang membutuhkannya.
5. Ketika ruang runtime berubah, perhitungkan visual viewport, virtual keyboard, safe area, orientation, kemampuan input, dan embedded container.
6. Uji viewport lebar, sekitar breakpoint, sempit, zoom, teks panjang, sentuhan, dan keyboard.

Untuk layout baru atau perubahan beberapa region, skill dapat menentukan komposisi desktop dan mobile yang berbeda sambil mempertahankan kontrak tugas yang sama. Skill memilih pola seperti split-to-stack, sidebar-to-drawer, grid-to-list, table-to-scroller atau representasi alternatif, mega-navigation-to-disclosure, dan multi-column-footer-to-prioritized-groups.

## Contoh prompt

```text
$superior-responsive Perbaiki dashboard ini pada lebar 320-768px. Prioritaskan reflow dan jangan sembunyikan aksi utama.
```

```text
$superior-responsive Buat tabel transaksi tetap dapat digunakan di mobile dengan scroll lokal dan header yang jelas.
```

```text
$superior-responsive Rancang komposisi desktop dan mobile yang saling konsisten untuk halaman akun ini. Pertahankan aksi dan kontennya, tetapi jangan jadikan mobile sebagai desktop yang diperkecil.
```

## Kombinasi yang sesuai

- Dengan `superior-ui` untuk pembangunan atau redesign halaman.
- Dengan `superior-accessibility` untuk zoom, keyboard, urutan baca, dan ukuran target.
- Dengan `superior-performance` ketika loading, rendering, atau responsiveness client memerlukan pengukuran dan profiling.
- Dengan `superior-copy` jika panjang teks nyata menjadi bagian dari pengujian layout.

## Hasil yang perlu diperiksa

Tidak boleh ada horizontal scroll pada halaman kecuali memang disengaja; konten penting tetap tersedia; target sentuh tidak terlalu kecil; urutan fokus dan baca tetap masuk akal. Breakpoint harus muncul karena kebutuhan konten, bukan kebiasaan angka perangkat. Emulasi berbasis width saja tidak cukup ketika keyboard, safe area, orientation, atau touch behavior menjadi sumber risiko.

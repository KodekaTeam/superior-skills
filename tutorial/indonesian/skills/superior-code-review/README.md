# Menggunakan `superior-code-review`

Skill ini meninjau diff, commit, branch, pull request, atau working tree untuk menemukan defect dan regression yang actionable. Sifatnya read-only kecuali pengguna secara eksplisit meminta perbaikan.

## Kapan digunakan

Gunakan ketika code review menjadi hasil utama: meninjau perubahan yang diusulkan, menilai risiko merge, menemukan regression, atau memverifikasi implementasi dan test terhadap kontrak yang dimaksud. Gunakan skill khusus untuk audit visual, security, database, atau performance yang mendalam.

## Alur kerja

1. Konfirmasi target review, comparison base, behavior yang dimaksud, dan apakah perbaikan diizinkan.
2. Baca diff, lalu telusuri kontrak yang berubah melalui caller, state, data, configuration, dan consumer.
3. Uji kandidat finding terhadap skenario yang dapat dicapai dan perlindungan yang sudah ada.
4. Jalankan pemeriksaan aman dan terfokus yang meningkatkan confidence.
5. Pertahankan hanya finding actionable yang disebabkan atau dibuka oleh perubahan target.
6. Laporkan finding terlebih dahulu berdasarkan severity, lalu verifikasi dan risiko yang belum diperiksa.

## Contoh prompt

```text
$superior-code-review Review branch saat ini terhadap main. Fokus pada correctness, compatibility, dan regression coverage yang hilang. Jangan ubah file.
```

```text
$superior-code-review Review perubahan checkout yang sudah staged. Laporkan hanya defect actionable dengan lokasi file, trigger, dan consequence yang presisi.
```

## Kombinasi yang sesuai

- Dengan `superior-api-security` untuk review yang secara eksplisit berfokus pada keamanan.
- Dengan `superior-database` ketika migration, transaction, atau compatibility stored data mendominasi risiko.
- Dengan `superior-performance` ketika analisis performa terukur menjadi hasil yang diminta.
- Dengan `superior-testing` ketika arsitektur atau reliability test memerlukan review khusus.

## Pemeriksaan hasil

Review yang baik berisi sedikit finding berbasis evidence, bukan preferensi style. Hasil tanpa finding actionable juga valid selama menyebutkan pemeriksaan yang dilakukan dan area material yang tidak dapat diverifikasi.

## Perilaku penting:
- Code review bersifat read-only secara default.
- Tidak boleh mengedit file, mengirim komentar, atau menyetujui PR tanpa permintaan eksplisit.
- Temuan harus memiliki trigger, jalur yang dapat dicapai, konsekuensi konkret, dan lokasi file yang presisi.
- Style preference dan redesign spekulatif tidak dianggap sebagai defect.
- Temuan diurutkan berdasarkan dampak dan jangkauan.
- Hasil “tidak ada actionable findings” dianggap valid.
- Review umum tidak otomatis berubah menjadi security audit, visual audit, atau implementation task.
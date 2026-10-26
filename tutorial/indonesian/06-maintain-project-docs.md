# 06 — Memelihara Dokumentasi Setelah Perubahan

Setiap implementasi material yang telah diverifikasi mendapatkan catatan outcome di timeline secara default. Pengguna dapat menolaknya secara eksplisit. Dokumen pendukung hanya diperbarui ketika klaim atau prosedurnya sendiri berubah.

## Catatan implementasi otomatis

Setelah fitur, perbaikan, perubahan behavior, kontrol keamanan, perubahan schema, konfigurasi runtime, atau refactor yang bermakna:

1. Buat atau perbarui satu catatan di `docs/implementation-timeline/<feature-domain>/` dengan nama spesifik seperti `2026-10-15-perbaiki-validasi-login.md`.
2. Buat `docs/README.md`, indeks timeline, dan indeks feature-domain ketika sistem dokumentasi belum ada.
3. Catat outcome, mekanisme implementasi, keputusan, verifikasi yang benar-benar dijalankan, keterbatasan, dan docs terkait.
4. Kurasi intent akhir, criteria, batas scope, dan maintenance notes yang telah diterima ketika berguna untuk pekerjaan berikutnya; perbarui living implementation guide hanya ketika contract saat ini atau jalur perubahan amannya berubah.
5. Jangan masukkan prompt mentah, transkrip chat, hidden reasoning, secret, atau narasi setiap file.
6. Jangan membuat dokumentasi ketika pengguna secara eksplisit meminta untuk melewatinya.

## Update docs ketika berubah

- tujuan, boundary, atau kemampuan produk;
- arsitektur, ownership, atau aliran data;
- keputusan teknis yang membatasi pekerjaan berikutnya;
- environment, command, build, migration, release, rollback, atau deployment;
- batasan implementasi dan maintenance risk;
- milestone atau release yang bernilai historis.

## Jangan membuat catatan otomatis hanya karena

- formatting atau rename internal tidak mengubah cara memahami sistem;
- refactor mempertahankan seluruh boundary dan contract;
- chat menghasilkan ide yang belum diterima;
- sebuah commit tidak mempunyai dampak durable.
- tugas bersifat read-only, gagal, documentation-only, atau tidak meninggalkan perubahan material.

## Prompt sinkronisasi

```text
$superior-docs Sinkronkan dokumentasi yang benar-benar terpengaruh oleh
perubahan pada working tree ini. Jangan menulis ulang dokumen lain.
Pisahkan current state dari history dan planned work, lalu periksa semua link.
```

## Prompt handoff

```text
$superior-docs Buat maintenance handoff untuk pekerjaan saat ini: outcome,
owner yang berubah, affected consumers, keputusan, hasil verifikasi,
known limitations, risiko, dan safe next steps. Gunakan konvensi timeline
atau history yang sudah ada; jangan membuat format baru jika tidak perlu.
```

## Prinsip sinkronisasi

Perbarui klaim current-state yang sudah salah. Pertahankan sejarah yang masih berguna. Jangan menambahkan verification date atau commit marker jika dokumen belum benar-benar diperiksa terhadap revision tersebut.

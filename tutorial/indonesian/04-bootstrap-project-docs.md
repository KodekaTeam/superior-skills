# 04 — Membuat Dokumentasi Proyek Pertama Kali

## Kapan digunakan

Gunakan tutorial ini saat repository belum memiliki sistem dokumentasi persisten atau dokumentasinya perlu direkonstruksi dari implementasi.

## Prompt yang disarankan

```text
$superior-docs

Bootstrap sistem dokumentasi persisten untuk repository ini.
Periksa kode aktif, konfigurasi, tests, scripts, deployment files,
dokumentasi lama, dan Git history. Buat docs/README.md serta:

- docs/structure-of-app/PROJECT_CONTEXT.md
- docs/structure-of-app/ARCHITECTURE.md
- docs/structure-of-app/DECISIONS.md

Tambahkan timeline, implementation guides, build-and-distribution,
history, audit, roadmap, atau research hanya jika repository memiliki
bukti dan kebutuhan maintenance yang nyata. Jangan membuat placeholder.
```

## Yang dilakukan skill

1. Menentukan fakta saat ini dari repository.
2. Memisahkan fakta, keputusan, sejarah, rencana, dan unknown.
3. Membuat `docs/README.md` sebagai indeks pembacaan.
4. Membuat tiga dokumen inti.
5. Menambahkan collection lain hanya ketika isinya dapat dibuktikan.
6. Memeriksa link, command, path, revision, dan potensi informasi sensitif.

## Review hasil

Pastikan:

- fitur yang belum dibuat tidak ditulis sebagai kemampuan aktif;
- keputusan tanpa rationale tidak diberi alasan rekaan;
- command build berasal dari konfigurasi atau telah diverifikasi;
- commit history dirangkum berdasarkan outcome, bukan disalin mentah;
- indeks docs menunjuk ke seluruh dokumen yang benar-benar dipelihara.

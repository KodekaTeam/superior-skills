# 03 — Memahami Prioritas Instruksi

Superior tidak menggantikan permintaan pengguna atau aturan khusus proyek.

## Urutan praktis

Ketika terdapat konflik, gunakan urutan berikut:

1. instruksi eksplisit pengguna untuk tugas saat ini;
2. aturan keamanan dan izin lingkungan;
3. `AGENTS.md` yang paling dekat dengan file yang dikerjakan;
4. `AGENTS.md` pada root repository;
5. instruksi skill yang dipilih;
6. preferensi umum dan contoh tutorial.

Tutorial bukan instruksi runtime. Contoh dalam folder ini tidak mengalahkan `AGENTS.md`, `SKILL.md`, atau kontrak proyek.

## Contoh

Jika `superior-ui` menyarankan mempertahankan design system, tetapi pengguna secara eksplisit meminta migrasi ke design system baru, agent harus mengikuti migrasi tersebut sambil tetap menjaga scope dan verifikasi.

Jika `superior-lean` menyarankan solusi kecil, tetapi sistem pembayaran membutuhkan idempotency dan audit trail, kebutuhan correctness tersebut tidak boleh disederhanakan.

## Nested instructions

Proyek dapat memiliki `AGENTS.md` tambahan di subfolder:

```text
project/
|-- AGENTS.md
`-- services/
    |-- AGENTS.md
    `-- billing/
```

Aturan di `services/AGENTS.md` berlaku lebih spesifik untuk pekerjaan di subtree tersebut. Jangan menyalin semua aturan subtree ke root jika tidak berlaku bagi seluruh proyek.

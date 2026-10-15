# Menggunakan `superior-database`

Skill ini menangani pekerjaan database ketika keputusan schema, query, transaction, migration, atau lifecycle data berdampak material pada correctness maupun keamanan rollout.

## Kapan digunakan

Gunakan untuk desain schema dan index, correctness query, boundary transaction, kontrol concurrency, migration production, backfill, perbaikan data, atau review datastore. Pemanggilan repository rutin tanpa perubahan kontrak data tetap berada di `superior-logic`.

## Alur kerja

1. Identifikasi engine dan versi datastore, sumber schema, kepemilikan data, serta compatibility window.
2. Tetapkan invariant, pola akses, cardinality, volume, dan behavior concurrency.
3. Rancang schema, query, index, dan boundary transaction sebagai satu kontrak.
4. Rencanakan rollout compatibility-first, verifikasi, dan recovery sebelum menjalankan migration.
5. Uji menggunakan engine nyata dan state representatif ketika semantics engine atau scale menjadi sumber risiko.
6. Laporkan environment, skala data, command, hasil, dan kondisi rollout yang belum diverifikasi.

## Contoh prompt

```text
$superior-database Tambahkan uniqueness email per tenant tanpa memblokir read yang sudah berjalan. Periksa duplikat legacy, rencanakan migration kompatibel, dan tentukan verifikasi sebelum constraint diberlakukan.
```

```text
$superior-database Review transaction pembuatan order ini terhadap duplicate delivery dan update inventory concurrent. Pertahankan database dan tooling migration yang sudah digunakan.
```

## Kombinasi yang sesuai

- Dengan `superior-logic` untuk behavior aplikasi yang menggunakan kontrak data.
- Dengan `superior-testing` untuk desain test migration, compatibility, integration, atau concurrency.
- Dengan `superior-api-security` untuk tenant isolation, query injection, atau boundary data sensitif.
- Dengan `superior-debugging` ketika penyebab symptom data belum diketahui.

## Pemeriksaan hasil

Hasil yang baik membuktikan integritas dan compatibility data, menyebutkan risiko lock serta recovery, dan membedakan behavior yang diverifikasi lokal dari keamanan rollout production. File migration yang berhasil dibuat saja belum cukup sebagai evidence.

## Kemampuan utamanya mencakup:
- schema, constraint, query, dan index berdasarkan pola akses nyata;
- transaction isolation, locking, concurrency, idempotency, replica, cache, dan event consistency;
- rollout migration dengan tahapan expand, migrate, verify, dan contract;
- backfill yang bounded, resumable, observable, serta aman dijalankan ulang;
- penilaian lock, table rewrite, replication lag, recovery, dan compatibility window;
- larangan menjalankan migration production atau destructive query tanpa target dan otorisasi eksplisit.
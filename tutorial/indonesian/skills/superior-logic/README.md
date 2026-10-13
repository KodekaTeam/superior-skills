# Menggunakan `superior-logic`

Skill ini menangani perilaku program: API, state, data, validasi, otorisasi, transaksi, idempotency, concurrency, error handling, dan aturan bisnis.

## Kapan dipakai

Gunakan untuk fitur backend, integrasi data, perubahan kontrak, workflow stateful, atau bug perilaku. Jangan gunakan sebagai skill utama untuk perubahan visual atau copy-only.

## Alur kerja

1. Nyatakan kontrak input, output, side effect, dan failure mode.
2. Telusuri boundary ke database, layanan eksternal, queue, cache, atau client.
3. Tentukan invariant, validasi, otorisasi, atomicity, retry, dan concurrency yang relevan.
4. Implementasikan perubahan sekecil mungkin tanpa melemahkan kontrak.
5. Uji happy path, edge case, kegagalan dependency, dan perilaku berulang.

## Contoh prompt

```text
$superior-logic Tambahkan endpoint refund yang idempotent. Pertahankan kontrak API lama dan sertakan tes untuk retry serta concurrent request.
```

```text
$superior-logic Diagnosis bug transisi status pesanan ini, lalu perbaiki invariant dan test regresinya.
```

## Kombinasi yang sesuai

- Dengan `superior-lean` untuk memilih desain terkecil yang tetap menangani risiko sistem.
- Dengan `superior-ui` bila pekerjaan mencakup client dan server.
- Dengan `superior-docs` bila kontrak, arsitektur, atau keputusan berubah.
- Jalankan `superior-comments` secara terpisah bila komentar perlu diaudit.

## Hasil yang perlu diperiksa

Pastikan kontrak tetap eksplisit, error dapat ditangani pemanggil, operasi sensitif memiliki otorisasi, dan perubahan data aman terhadap kegagalan parsial. Tes harus membuktikan invariant penting, bukan sekadar mengejar coverage.

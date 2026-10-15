# Menggunakan `superior-testing`

Skill ini merancang, menerapkan, memperbaiki, atau meninjau automated test ketika testing membutuhkan keputusan khusus tentang risiko, level test, isolasi, fixture, atau reliabilitas.

## Kapan dipakai

Gunakan untuk regression test, strategi pengujian, coverage yang hilang pada boundary penting, flaky failure, contract test, atau perubahan test suite yang substansial. Jangan memanggilnya hanya karena implementasi biasa perlu menjalankan pemeriksaan yang sudah ada sebelum selesai.

## Alur kerja

1. Tentukan kontrak yang dapat diamati, regresi, dan risiko yang dilindungi.
2. Periksa tooling, konvensi, fixture, dan batasan CI yang sudah digunakan repository.
3. Pilih level test paling sempit yang tetap menguji pemilik risiko sebenarnya.
4. Kendalikan state, waktu, randomness, concurrency, dan boundary eksternal yang memang dimiliki test.
5. Jalankan test terfokus terlebih dahulu, kemudian suite terkait dan pemeriksaan repository yang relevan.
6. Laporkan apa yang berhasil dibuktikan serta environment atau kondisi yang belum diuji.

## Contoh prompt

```text
$superior-testing Tambahkan regression test untuk duplicate webhook delivery. Buktikan bahwa retry tidak dapat membuat pembayaran kedua tanpa melakukan mock pada idempotency store.
```

```text
$superior-testing Diagnosis dan perbaiki test asynchronous yang flaky ini. Temukan kondisi yang tidak terkendali tanpa menambahkan retry atau timeout yang lebih besar.
```

## Kombinasi yang sesuai

- Dengan `superior-logic` ketika behavior bisnis atau state transition pada production juga berubah.
- Dengan `superior-api-security` untuk verifikasi negatif atas otorisasi, limiter, token, SSRF, atau abuse control.
- Dengan skill interface ketika kontrak yang diuji dimiliki oleh component, accessibility, responsive behavior, atau interaction.

## Hasil yang perlu diperiksa

Hasil yang baik menjelaskan kontrak yang dilindungi, alasan level test tersebut dapat dipercaya, perintah yang berhasil atau gagal, dan risiko yang masih tersisa. Persentase coverage saja bukan bukti bahwa behavior penting telah diuji.

## Karakteristik utama skill:
- Aktif ketika testing merupakan bagian utama pekerjaan.
- Mencakup regression test, test strategy, contract test, fixture, mock/double, flaky test, concurrency, waktu, dan external system.
- Tidak aktif hanya karena implementasi biasa perlu menjalankan test yang sudah tersedia.
- Tidak memaksakan framework, test pyramid, atau target coverage generik.
- Mengutamakan level test paling kecil yang benar-benar membuktikan risiko terkait.
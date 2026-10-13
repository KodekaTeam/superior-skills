# Menggunakan `superior-lean`

Skill ini mencari solusi terkecil yang tetap lengkap, benar, aman, dan sesuai kontrak. Prinsipnya berasal dari pendekatan Ponytail, tetapi routing dan instruksi runtime tetap milik Superior.

## Kapan dipakai

Gunakan ketika implementasi mulai menambah abstraksi, dependency, wrapper, konfigurasi, atau lapisan yang mungkin tidak diperlukan. Jangan gunakan untuk memangkas kebutuhan pengguna, keamanan, aksesibilitas, kompatibilitas, atau perlindungan concurrency.

## Alur kerja

1. Tulis kontrak yang wajib dipenuhi dan risiko yang tidak boleh diabaikan.
2. Cari kemampuan yang sudah ada: kode lokal, standard library, native platform, atau dependency terpasang.
3. Bandingkan solusi berdasarkan jumlah konsep baru, bukan hanya jumlah baris.
4. Hapus abstraksi single-use atau generalisasi spekulatif jika tidak membawa nilai nyata.
5. Uji perilaku penting dan jelaskan trade-off yang tetap ada.

## Contoh prompt

```text
$superior-lean Implementasikan cache sederhana ini dengan fasilitas yang sudah tersedia. Hindari dependency baru kecuali benar-benar diperlukan.
```

```text
$superior-lean Tinjau rancangan ini dan sederhanakan tanpa mengurangi validasi, keamanan, atau kemampuan retry.
```

## Kombinasi yang sesuai

- Dengan `superior-logic` untuk menjaga perubahan backend tetap kecil tetapi kuat.
- Dengan `superior-ui` untuk menghindari komponen dan variasi yang spekulatif.
- Dengan `superior-docs` bila penyederhanaan mengubah keputusan arsitektur yang terdokumentasi.

## Hasil yang perlu diperiksa

Solusi akhir memenuhi seluruh acceptance criteria dengan konsep baru seminimal mungkin. Pastikan kesederhanaan bukan hasil menghapus error handling, validasi, observability yang diperlukan, atau edge case yang memang berada dalam cakupan.

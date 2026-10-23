# Menggunakan `superior-lean`

Skill ini mencari solusi terkecil yang tetap lengkap, benar, aman, dan sesuai kontrak. Routing dan instruksi runtime-nya sepenuhnya dimiliki oleh Superior.

## Kapan dipakai

Gunakan ketika implementasi mulai menambah abstraksi, dependency, wrapper, konfigurasi, atau lapisan yang mungkin tidak diperlukan. Jangan gunakan untuk memangkas kebutuhan pengguna, keamanan, aksesibilitas, kompatibilitas, atau perlindungan concurrency.

## Alur kerja

1. Tulis kontrak yang wajib dipenuhi dan risiko yang tidak boleh diabaikan.
2. Cari kemampuan yang sudah ada: kode lokal, standard library, native platform, atau dependency terpasang.
3. Bandingkan solusi berdasarkan jumlah konsep baru, bukan hanya jumlah baris.
4. Bedakan machinery yang tidak perlu dari boundary yang dibenarkan oleh consumer saat ini, sistem eksternal, policy, compatibility, atau variasi nyata.
5. Telusuri indirect consumer dan bandingkan total ownership sebelum menghapus shared code atau dependency.
6. Uji perilaku penting dan jelaskan trade-off yang tetap ada.

Kode tanpa direct caller masih dapat diaktifkan melalui registry, configuration, route, event, reflection, build tooling, atau public API. Dependency juga baru lebih sederhana untuk dihapus ketika proyek mampu memiliki seluruh behavior dan beban maintenance-nya dengan aman, bukan hanya menulis ulang happy path dalam lebih sedikit baris.

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

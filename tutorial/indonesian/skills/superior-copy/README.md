# Menggunakan `superior-copy`

Skill ini menulis dan memperbaiki teks yang terlihat pengguna, termasuk heading, CTA, onboarding, empty state, pesan error, dan copy pemasaran.

## Kapan dipakai

Gunakan ketika kualitas bahasa, kejelasan tindakan, atau konsistensi suara produk menjadi tujuan utama. Jangan gunakan untuk komentar kode atau dokumentasi teknis netral kecuali pengguna secara khusus meminta tone produk.

## Alur kerja

1. Cari bukti suara merek, istilah produk, audiens, dan fakta yang boleh dinyatakan.
2. Tentukan tindakan atau pemahaman yang harus dimiliki pengguna setelah membaca teks.
3. Tulis copy yang konkret dan sesuai konteks antarmuka.
4. Periksa panjang, hierarki, konsistensi istilah, dan kondisi error/empty/loading.
5. Hapus klaim, angka, testimonial, atau bukti sosial yang tidak memiliki sumber.

## Contoh prompt

```text
$superior-copy Tulis ulang onboarding ini agar ringkas dan jelas bagi pemilik toko baru. Pertahankan tone yang sudah dipakai di halaman pricing.
```

```text
$superior-copy Perbaiki CTA dan empty state dashboard. Jangan membuat klaim manfaat yang tidak ada di materi produk.
```

## Kombinasi yang sesuai

- Dengan `superior-ui` saat copy merupakan bagian dari implementasi halaman.
- Dengan `superior-accessibility` untuk label kontrol dan pesan error yang harus dapat dipahami semua pengguna.
- Dengan `superior-docs` hanya jika perubahan terminologi perlu dicatat sebagai keputusan atau konteks proyek.

## Hasil yang perlu diperiksa

Setiap teks harus membantu pengguna memahami keadaan atau mengambil tindakan. Pastikan tone mengikuti bukti yang ada, CTA spesifik, error menjelaskan pemulihan, dan layout tetap bekerja dengan panjang copy nyata. Jangan menerapkan larangan gaya universal yang menghapus karakter merek.

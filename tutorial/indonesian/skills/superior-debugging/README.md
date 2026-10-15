# Menggunakan `superior-debugging`

Skill ini menyelidiki kegagalan software yang konkret ketika penyebabnya belum pasti, lalu memperbaiki boundary yang memiliki kontrak yang dilanggar.

## Kapan digunakan

Gunakan untuk bug yang dapat direproduksi, kegagalan intermittent, behavior khusus environment, insiden production dengan evidence yang tersedia, atau usulan perbaikan yang hubungan kausalnya belum jelas. Jangan gunakan untuk penerapan fitur, code review umum, atau cleanup spekulatif tanpa kegagalan yang teramati.

## Alur kerja

1. Tentukan behavior yang diharapkan dan yang teramati dari evidence otoritatif.
2. Tetapkan reproduksi terkecil, scope terdampak, dan kondisi terakhir yang diketahui baik bila tersedia.
3. Pisahkan symptom, trigger, root cause, dan amplifier.
4. Uji hipotesis yang dapat difalsifikasi dengan pemeriksaan aman termurah yang dapat membedakannya.
5. Perbaiki boundary yang memiliki kontrak rusak.
6. Jalankan ulang reproduksi awal dan verifikasi behavior terkait.
7. Laporkan confidence serta ketidakpastian environment atau operasional yang tersisa.

## Contoh prompt

```text
$superior-debugging Diagnosis mengapa invoice duplikat hanya dibuat ketika payment webhook di-retry. Telusuri persisted state dan queue delivery sebelum mengusulkan perbaikan.
```

```text
$superior-debugging Selidiki timeout yang hanya terjadi di production menggunakan trace dan konfigurasi tersanitasi yang tersedia. Jangan ubah pengaturan production atau menaikkan timeout tanpa membuktikan mekanisme kausalnya.
```

## Kombinasi yang sesuai

- Dengan `superior-logic` ketika perbaikan terkonfirmasi mengubah behavior aplikasi atau persistence.
- Dengan `superior-testing` ketika regression coverage atau behavior test nondeterministic membutuhkan desain khusus.
- Dengan `superior-api-security` ketika kegagalan membuka kelemahan kontrol keamanan.

## Pemeriksaan hasil

Hasil yang baik membedakan observasi dari hipotesis, menjelaskan rantai kausal, memverifikasi symptom awal, dan menandai ketidakpastian tersisa. Restart, retry, peningkatan timeout, atau error yang menghilang saja bukan bukti penyelesaian.

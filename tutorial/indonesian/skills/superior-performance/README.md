# Menggunakan `superior-performance`

Skill ini menyelidiki dan meningkatkan performa ketika latency, throughput, penggunaan resource, loading, rendering, biaya bundle, atau capacity menjadi concern utama.

## Kapan digunakan

Gunakan untuk perlambatan terukur, performance budget yang disepakati, batas capacity, workload mahal, masalah loading atau interaction client, maupun review yang berfokus pada performa. Jangan gunakan untuk micro-optimization spekulatif tanpa symptom, target, atau bottleneck yang terbukti.

## Alur kerja

1. Tentukan journey, workload, metric, target, dan batas correctness yang tidak boleh dikorbankan.
2. Ambil baseline yang dapat diulang beserta environment, bentuk data, concurrency, dan kondisi cache.
3. Profile workload representatif dan temukan bottleneck yang memiliki biaya tersebut.
4. Hilangkan pekerjaan yang tidak perlu atau optimalkan resource terbatas tanpa memindahkan biaya tersembunyi.
5. Ulangi protokol pengukuran yang sama dan jalankan pemeriksaan correctness.
6. Laporkan evidence sebelum/sesudah, variance, tradeoff, dan kondisi yang belum diuji.

## Contoh prompt

```text
$superior-performance Kurangi p95 latency pada alur export ini. Reproduksi dahulu dengan jumlah row representatif, profile waktu database, serialization, dan transfer, lalu optimalkan hanya kontributor dominan.
```

```text
$superior-performance Selidiki interaction lambat pada route katalog mobile. Gunakan tooling browser yang sudah ada, pertahankan accessibility, dan bandingkan loading serta input responsiveness sebelum dan sesudah.
```

## Kombinasi yang sesuai

- Dengan `superior-debugging` ketika penyebab perlambatan belum diketahui.
- Dengan `superior-database` ketika query plan, index, lock, atau capacity datastore memiliki biaya tersebut.
- Dengan `superior-testing` untuk benchmark atau otomatisasi regresi performa yang reliabel.
- Dengan skill interface ketika optimasi mengubah rendering, interaction, responsive behavior, atau accessibility.

## Pemeriksaan hasil

Hasil yang baik menyertakan evidence sebelum/sesudah yang dapat dibandingkan, detail workload dan environment, pemeriksaan correctness, serta tradeoff resource atau biaya. Satu eksekusi lebih cepat yang masih berada dalam variance normal bersifat inconclusive.


## Prinsip utamanya:
- Harus memiliki symptom, target, budget, atau bottleneck terukur.
- Membandingkan kondisi sebelum dan sesudah dengan workload yang sama.
- Menggunakan profile, trace, query plan, allocation, atau browser timeline sebagai evidence.
- Menolak micro-optimization spekulatif.
- Tidak menganggap satu eksekusi yang lebih cepat sebagai bukti.
- Mempertahankan correctness, security, accessibility, backpressure, dan boundedness.
- Memperlakukan cache, concurrency, lazy loading, dan preloading sebagai tradeoff, bukan solusi otomatis.
- Aktivitas production seperti profiling, load generation, dan cache flushing tetap membutuhkan izin eksplisit.
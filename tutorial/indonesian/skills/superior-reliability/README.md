# Menggunakan `superior-reliability`

Skill ini meningkatkan reliability operasional melalui objective yang eksplisit, isolasi kegagalan, graceful degradation, recovery, observability, dan kesiapan incident.

## Kapan digunakan

Gunakan ketika availability, resilience, kegagalan dependency, overload, failover, disaster recovery, backup, SLO, atau operability menjadi concern utama. Jangan aktifkan untuk error handling biasa, satu bug yang belum dijelaskan, atau machinery distributed system yang spekulatif.

## Alur kerja

1. Identifikasi critical user journey, objective, state, dependency, failure domain, dan owner operasional.
2. Pilih indicator dan target dari requirement yang diterima, bukan angka yang dibuat sendiri.
3. Prioritaskan failure mode berdasarkan impact, reach, detection delay, dan kesulitan recovery.
4. Tambahkan timeout, retry, isolation, degradation, backpressure, atau redundancy yang bounded hanya ketika evidence mendukungnya.
5. Tentukan alert, runbook, prosedur restore atau failover, dan stop condition.
6. Verifikasi failure dan recovery pada environment terotorisasi terkecil yang mempertahankan mekanismenya.

## Contoh prompt

```text
$superior-reliability Tentukan reliability objective untuk checkout berdasarkan evidence produk dan telemetry yang ada. Identifikasi failure domain dan usulkan hanya kontrol yang terkait outcome yang diterima.
```

```text
$superior-reliability Tingkatkan resilience ketika provider inventory lambat atau tidak tersedia. Batasi retry, pertahankan backpressure, tentukan degradation yang jujur, dan uji recovery tanpa menyentuh production.
```

## Kombinasi yang sesuai

- Dengan `superior-debugging` untuk mendiagnosis incident yang teramati.
- Dengan `superior-performance` untuk pengukuran capacity dan saturation.
- Dengan `superior-delivery` untuk rollout, rollback, dan mutasi environment.
- Dengan `superior-database` untuk consistency, replication, backup, dan mekanisme restore.
- Dengan `superior-testing` untuk desain fault dan recovery test yang terkontrol.

## Pemeriksaan hasil

Hasil yang baik menyebutkan objective, failure mode, blast radius, control owner, degradation behavior, detection, recovery, dan residual risk. Review configuration saja tidak membuktikan high availability, restorasi backup, failover, atau disaster recovery.

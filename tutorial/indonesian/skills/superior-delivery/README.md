# Menggunakan `superior-delivery`

Skill ini menangani CI/CD, artifact release, promotion environment, verifikasi rollout, rollback, dan pekerjaan lain ketika keamanan delivery menjadi concern utama.

## Kapan digunakan

Gunakan untuk merancang atau memperbaiki pipeline, membuat package release, memverifikasi integritas artifact, merencanakan promotion environment, atau menjalankan deployment yang diizinkan secara eksplisit. Jangan aktifkan hanya untuk menjalankan local build yang sudah ada, dan jangan menganggap persiapan release sebagai izin deployment.

## Alur kerja

1. Identifikasi source revision, deployable unit, artifact, environment, owner, dan tingkat mutasi eksternal yang diminta.
2. Periksa konfigurasi authoritative untuk pipeline, packaging, credential, migration, dan release.
3. Build satu kali bila memungkinkan dan promosikan artifact immutable yang sama.
4. Tentukan gate, compatibility, health evidence, pause threshold, serta rollback atau forward recovery.
5. Konfirmasi target dan otorisasi tepat sebelum publish, deploy, promote, atau rollback.
6. Laporkan artifact, environment, job atau command, mutasi eksternal, verifikasi, dan kondisi rollout yang belum diuji.

## Contoh prompt

```text
$superior-delivery Siapkan release pipeline untuk service ini. Build satu image immutable, promosikan melalui staging, dan tentukan approval production serta rollback gate. Jangan lakukan deployment.
```

```text
$superior-delivery Diagnosis mengapa job publication dapat merilis artifact yang berbeda dari artifact yang diuji. Perbaiki pipeline dan verifikasi identity artifact tanpa memublikasikan release.
```

## Kombinasi yang sesuai

- Dengan `superior-database` untuk migration dan compatibility stored data.
- Dengan `superior-reliability` untuk availability objective, failover, dan kesiapan recovery.
- Dengan `superior-testing` untuk desain test pipeline atau release yang substansial.
- Dengan `superior-docs` untuk prosedur build, deployment, rollback, dan operator yang durable.

## Pemeriksaan hasil

Hasil yang baik membedakan build, package, publication, deployment, dan promotion. Hasil harus mengidentifikasi artifact immutable beserta source revision, mencatat setiap mutasi eksternal, dan tidak mengklaim behavior rollout atau rollback yang tidak diuji.

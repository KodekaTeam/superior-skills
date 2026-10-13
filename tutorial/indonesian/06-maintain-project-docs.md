# 06 — Memelihara Dokumentasi Setelah Perubahan

Tidak semua edit kode memerlukan update docs. Perbarui dokumentasi ketika perubahan memengaruhi pengetahuan yang harus bertahan lintas sesi.

## Update docs ketika berubah

- tujuan, boundary, atau kemampuan produk;
- arsitektur, ownership, atau aliran data;
- keputusan teknis yang membatasi pekerjaan berikutnya;
- environment, command, build, migration, release, rollback, atau deployment;
- batasan implementasi dan maintenance risk;
- milestone atau release yang bernilai historis.

## Jangan update hanya karena

- formatting atau rename internal tidak mengubah cara memahami sistem;
- refactor mempertahankan seluruh boundary dan contract;
- chat menghasilkan ide yang belum diterima;
- sebuah commit tidak mempunyai dampak durable.

## Prompt sinkronisasi

```text
$superior-docs Sinkronkan dokumentasi yang benar-benar terpengaruh oleh
perubahan pada working tree ini. Jangan menulis ulang dokumen lain.
Pisahkan current state dari history dan planned work, lalu periksa semua link.
```

## Prompt handoff

```text
$superior-docs Buat maintenance handoff untuk pekerjaan saat ini: outcome,
owner yang berubah, affected consumers, keputusan, hasil verifikasi,
known limitations, risiko, dan safe next steps. Gunakan konvensi timeline
atau history yang sudah ada; jangan membuat format baru jika tidak perlu.
```

## Prinsip sinkronisasi

Perbarui klaim current-state yang sudah salah. Pertahankan sejarah yang masih berguna. Jangan menambahkan verification date atau commit marker jika dokumen belum benar-benar diperiksa terhadap revision tersebut.

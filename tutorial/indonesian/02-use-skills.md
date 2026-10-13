# 02 — Menggunakan Skills

## Pemanggilan eksplisit

Sebut nama skill dengan `$` ketika Anda ingin memastikan workflow tertentu digunakan:

```text
$superior-ui Rapikan halaman pengaturan ini dengan mempertahankan design system yang ada.
```

```text
$superior-docs Bootstrap dokumentasi persisten untuk repository ini.
```

```text
$superior-ui-audit Audit halaman checkout secara read-only dan laporkan temuan yang dapat dibuktikan.
```

Pemanggilan eksplisit disarankan untuk bootstrap docs, audit yang harus tetap read-only, atau saat beberapa skill memiliki topik berdekatan.

## Pemanggilan implisit

Codex dapat memilih skill dari description ketika permintaan sudah spesifik:

```text
Perbaiki horizontal overflow dan navigasi mobile pada halaman dashboard.
```

Permintaan tersebut seharuskan cocok dengan `superior-responsive` tanpa perlu menyebut namanya.

## Tulis prompt berdasarkan outcome

Sertakan:

- hasil yang diinginkan;
- bagian proyek yang menjadi scope;
- batas yang harus dipertahankan;
- bukti atau file awal bila diketahui;
- verifikasi yang penting.

Contoh:

```text
$superior-logic Perbaiki duplikasi pembuatan invoice pada retry webhook.
Pertahankan kontrak API saat ini dan tambahkan regression test pada test suite yang sudah ada.
```

## Hindari

- memanggil semua skill “untuk berjaga-jaga”;
- mengandalkan nama skill untuk menggantikan tujuan tugas;
- memakai `superior-ui-audit` ketika sebenarnya meminta implementasi langsung;
- memakai `superior-comments` untuk perubahan yang juga mengubah executable behavior.

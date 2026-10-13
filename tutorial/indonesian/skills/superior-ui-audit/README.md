# Menggunakan `superior-ui-audit`

Skill ini melakukan audit visual secara read-only. Hasilnya adalah sedikit temuan yang kuat, terprioritas, dan memiliki jalur koreksi yang jelas - bukan perubahan kode langsung.

## Kapan dipakai

Gunakan untuk menilai UI yang sudah ada sebelum redesign atau implementasi. Jangan gunakan jika pengguna langsung meminta perbaikan kode. Masalah fungsional dan aksesibilitas berada di luar cakupan kecuali diminta secara eksplisit.

## Alur kerja

1. Tetapkan halaman, viewport, state, dan bukti visual yang akan dinilai.
2. Untuk setiap kandidat temuan, pastikan ada observasi, kontrak/desain yang dilanggar, hubungan sebab-akibat, dan koreksi yang dapat dilakukan.
3. Prioritaskan berdasarkan dampak pada tugas pengguna, hierarki, kejelasan, dan konsistensi.
4. Batasi laporan pada maksimal lima temuan terkuat.
5. Pisahkan rencana implementasi sebagai bagian opsional; jangan mengedit file.

## Contoh prompt

```text
$superior-ui-audit Audit halaman checkout ini secara read-only. Berikan maksimal lima masalah visual terpenting beserta koreksi yang spesifik.
```

```text
$superior-ui-audit Bandingkan dashboard ini dengan design system proyek. Jangan ubah kode dan jangan menilai backend.
```

## Kombinasi yang sesuai

Gunakan audit sebagai tahap terpisah sebelum `superior-ui`. Tambahkan cakupan `superior-accessibility` atau `superior-responsive` hanya jika pengguna memintanya; nyatakan dengan jelas temuan mana yang berasal dari cakupan tambahan.

## Hasil yang perlu diperiksa

Laporan tidak boleh berisi daftar panjang preferensi subjektif. Setiap temuan harus dapat dibuktikan dari UI dan dikaitkan ke dampak pengguna. Pastikan tidak ada file yang berubah selama audit.

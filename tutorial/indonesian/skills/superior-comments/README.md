# Menggunakan `superior-comments`

Skill ini merapikan komentar kode tanpa mengubah executable behavior. Targetnya adalah komentar yang menjelaskan alasan, invariant, risiko, kontrak, atau workaround yang tidak jelas dari kode.

## Kapan dipakai

Gunakan untuk audit komentar, menghapus narasi yang hanya mengulang kode, memperbaiki TODO, atau mempertahankan konteks keamanan dan legal. Jangan gunakan untuk refactor, rename simbol, formatting seluruh file, atau perubahan logika.

## Alur kerja

1. Tentukan file atau direktori yang boleh disentuh.
2. Bedakan komentar bernilai tinggi dari komentar dekoratif, basi, atau sekadar membacakan sintaks.
3. Edit hanya komentar; pertahankan kode, whitespace yang tidak relevan, dan perilaku.
4. Tinjau diff untuk memastikan setiap perubahan memang comment-only.
5. Jalankan pemeriksaan ringan bila format komentar memengaruhi tooling.

## Contoh prompt

```text
$superior-comments Audit komentar di src/auth/. Pertahankan alasan keamanan dan hapus komentar yang hanya mengulang kode.
```

```text
$superior-comments Rapikan TODO di file ini agar setiap TODO memiliki tindakan atau kondisi penyelesaian yang jelas. Jangan ubah kode.
```

## Kombinasi yang sesuai

Biasanya gunakan skill ini sendiri agar batas comment-only mudah diverifikasi. Setelah perubahan logika besar dengan `superior-logic`, jalankan sebagai tugas terpisah jika komentar juga perlu diselaraskan.

## Hasil yang perlu diperiksa

Diff hanya boleh berisi komentar. Komentar yang tersisa harus menambah informasi yang tidak mudah dibaca dari implementasi. Jangan menghapus catatan keamanan, lisensi, legal, invariant, atau workaround tanpa bukti bahwa catatan itu tidak lagi berlaku.

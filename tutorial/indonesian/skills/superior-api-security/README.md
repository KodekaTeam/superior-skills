# Menggunakan `superior-api-security`

Skill ini menerapkan atau meninjau kontrol keamanan defensif untuk REST API. Cakupannya meliputi boundary autentikasi dan otorisasi, validasi, pembatasan rate dan resource, pencegahan abuse, SSRF, error dan logging yang aman, serta negative security test.

## Kapan dipakai

Gunakan ketika keamanan menjadi bagian eksplisit dari perubahan endpoint, saat melakukan hardening atau review API, atau ketika melindungi login, recovery, pembayaran, reservasi, export, webhook, upload, dan flow sensitif lain. Perilaku API biasa tetap menjadi tanggung jawab `superior-logic`.

## Alur kerja

1. Petakan caller, trust boundary, resource sensitif, operasi, dan dampak bisnis.
2. Telusuri kontrol pada gateway, aplikasi, identity provider, worker, dan downstream service.
3. Pilih kontrol untuk otorisasi object/function/property, boundary input-output, biaya resource, otomatisasi, outbound request, dan lifecycle credential.
4. Untuk session, token, reset credential, API key, atau webhook, tentukan validation, storage, rotation, revocation, dan replay behavior.
5. Terapkan kontrol koheren yang paling kecil pada enforcement point yang berwenang.
6. Verifikasi negative case, lifecycle transition, limit, failure mode, telemetry, dan asumsi pada deployment path.

## Contoh prompt

```text
$superior-api-security Tambahkan rate limiting pada login dan password recovery. Tentukan key serta threshold dari kontrak traffic saat ini, cegah account enumeration, kembalikan respons 429 yang stabil, dan uji concurrent request.
```

```text
$superior-api-security Tinjau REST API ini untuk cross-tenant object access, mass assignment, export tanpa batas, URL webhook yang tidak aman, dan kebocoran detail melalui error. Implementasikan perbaikan yang terkonfirmasi.
```

```text
$superior-api-security Harden flow signed webhook ini. Verifikasi signature raw payload, timestamp window, secret rotation, replay protection, durable acknowledgement, dan penanganan duplicate yang idempotent.
```

## Kombinasi yang sesuai

- Dengan `superior-logic` ketika otorisasi bergantung pada state domain atau perubahan mencakup transaksi, idempotency, dan persistence.
- Dengan `superior-code-review` ketika security merupakan salah satu risiko dalam review change set yang lebih luas.
- Dengan `superior-testing` ketika fixture negative-security, isolation, atau concurrency membutuhkan desain test khusus.
- Dengan `superior-docs` ketika kontrak publik, gateway policy, threat model, atau prosedur operasional berubah.
- Dengan `superior-lean` untuk menjaga kontrol tetap proporsional tanpa melemahkan kebutuhan keamanan yang telah diidentifikasi.

## Hasil yang perlu diperiksa

Pekerjaan credential dan webhook harus membuktikan lifecycle, rotation, revocation, dan replay pada deployed boundary yang efektif.

Setiap kontrol harus memiliki ancaman, lokasi enforcement, perilaku saat gagal, dan pengujian yang dapat diamati. Rate limiting perlu mendefinisikan key, allowance, burst, concurrency atau cost model, kontrak respons, perilaku counter store, dan monitoring—bukan hanya memasang middleware dengan angka default.

# Yeni Pano Detayli Kullanim Kilavuzu

Bu kilavuz `Yeni_Pano.html` (V2) icin hazirlanmistir.

## 1. Amac ve Kapsam

Bu dokumanin amaci:
- Panoyu sorunsuz baslatmak
- Ayarlari dogru sirada yapmak
- Ders programi/tema/yayin/guvenlik akisini standartlastirmak
- Saha kullaniminda sik gorulen hatalari hizla cozmektir

## 2. Hangi Dosyalar Kullaniliyor

- Ana dosya: `Yeni_Pano.html`
- Ana ders programi CSV: `ders_programi_pano_panoformat.csv`
- HTTP kiosk baslatma: `YENI_PANO_HTTP_KIOSK_BASLAT.bat`
- Kiosk kapatma: `PANO_KIOSK_DURDUR.bat`
- Kiosk notlari: `KIOSK_KURULUM_NOTLARI.txt`

## 3. Baslatma Yontemleri (Onemli)

### 3.1 Onerilen yontem (HTTP + Kiosk)
1. `YENI_PANO_HTTP_KIOSK_BASLAT.bat` dosyasina cift tiklayin.
2. Bu script:
   - Yerel HTTP sunucu acar (`localhost:8080`)
   - Tarayiciyi kiosk modda `Yeni_Pano.html` ile baslatir
3. Cikis icin `ALT+F4` kullanin.

### 3.2 Neden bu yontem?
- `file://` modunda tarayici guvenlik kisitlari CSV okumayi engelleyebilir.
- HTTP ile acmak bu sorunu buyuk oranda ortadan kaldirir.

### 3.3 Manuel HTTP baslatma (alternatif)
`e:\okul pano` klasorunde terminal acip:

```powershell
python -m http.server 8080
```

Tarayicida:

```text
http://localhost:8080/Yeni_Pano.html
```

## 4. Rol ve PIN Yapisi

Varsayilan guvenlik degerleri:
- `admin`: `2468`
- `editor`: `2026`
- `viewer`: `1111`
- Varsayilan oturum suresi: `120 dk`

Not:
- PIN/rol ayarlari **Guvenlik** sekmesinden degistirilebilir.
- Kritik islemlerde rol kontrolu vardir (yedekten don, yayinlama, guvenlik kaydi vb.).

## 5. Ilk Kurulum (Sifirdan)

1. Panoyu HTTP kiosk ile acin.
2. Yonetim panelini acin.
3. `Genel` sekmesinde okul adi/sehir/zaman duzeltmesini kontrol edin.
4. `Ders Programi` sekmesinde CSV dosyasini yukleyin.
5. `Ses / Ders Saatleri` sekmesinde ders-teneffus saatlerini dogrulayin.
6. `Namaz`, `Hava`, `YKS`, `Rehberlik` alanlarini okulunuza gore doldurun.
7. `Tema` sekmesinde temel tema ve bayram/ramazan ayarlarini yapin.
8. `Veri Yonetimi` sekmesinde nobetci ve panel profili ayarlarini tamamlayin.
9. `AYARLARI KAYDET` ile kaydedin.
10. `Yerel Yedek` alin.

## 6. Hizli Islem Dugmeleri (Panel Ustu)

- `Yedek Indir`
- `Yerel Yedek`
- `Yedekten Don` (admin)
- `CSV Tazele`
- `Ayarlari Kaydet`
- `Acil`
- `Tam Ekran`
- `Yenile`
- `Yerlesim Modu`
- `Pro Panel`
- `Oturumu Kapat`

## 7. Sekme Sekme Kullanim

### 7.1 Genel
- Okul adi/sehir
- Gun duzeltme (otomatik veya manuel)
- Saat ofseti (dakika)
- Ekran olcekleme, letterbox rengi, guvenli bolge marji
- Doku secimi
- `Sade Gorunum`, `Yuksek Kontrast`
- `1366/1920 Uyum Kontrolu`
- `Tek Tus Kiosk`

### 7.2 Logo
- Okul logosu yukleme ve onizleme

### 7.3 Saat
- Dijital/analog secimi
- Hicri takvim
- Ozel islami gun gostergeleri

### 7.4 Hava
- Sehir girisi
- Anlik hava verisi guncelleme

### 7.5 Namaz
- Namaz widget ac/kapat
- Geri sayim
- Sehir/ulke/metod secimi (varsayilan Diyanet)
- Buyuk okul modu (namaz alani yerine nobet/genisletme)

### 7.6 Galeri
- Galeri modunu acma
- Coklu fotograf yukleme (max 10)
- Slayt araligi
- Ken Burns efekti

### 7.7 Basari
- Basari vitrini ac/kapat
- Basari kaydi ekleme (tur, baslik, aciklama, tarih, gorseller)
- Donusum suresi

### 7.8 Medya
- Tekil medya dosyasi (video/gorsel)
- Yerel dosya yolu
- URL ve playlist
- Medya suresi

### 7.9 Ses / Ders Saatleri
- Otomatik ses kontrolu:
  - Derste ses kis
  - Teneffuste ses ac
- Teneffus ses seviyesi
- Ders-teneffus periyot tanimlari
- Varsayilan saatleri yukleme
- Anlik durum paneli

### 7.10 Tatil
- Tatil modunu acma (`DERS YOK`)
- Yeni tatil ekleme (baslangic-bitis)
- Resmi tatilleri otomatik ekleme
- Bugun durumunu izleme

### 7.11 Icerik
- Ayet/Hadis tekli metin
- Ayet/Hadis listeleri
- Motivasyon ve degerler egitimi mesajlari
- Donusum sureleri
- Motivasyon kutusu stil ayarlari

### 7.12 Tema
- Hazir tema secimi
- Ozel renk paleti
- Ramazan modu + otomatik
- Ramazan paketleri
- Milli/dini bayram paketleri
- Milli bayrak ayarlari:
  - Bayramda goster
  - Yogunluk
  - Her zaman goster (manuel)
  - Manuel preset (23 Nisan, 19 Mayis, 30 Agustos, 29 Ekim)

### 7.13 Widget Stil
- Tum kutularin arkaplan/cerceve/golge/baslik stili
- Hazir presetler ve sifirlama

### 7.14 Kayan Yazi
- Mesaj ekleme/silme (max 5)
- Mesaj degisim araligi
- Hiz, boyut, renk

### 7.15 Fontlar
- Alan bazli font ailesi
- Alan bazli font boyutlari
- Font renkleri
- Panel baslik gradyan/cizgi/golge stili
- Google Font / yerel font yukleme

### 7.16 YKS
- Sinav tarihi + saat
- Sol widget geri sayim

### 7.17 Rehberlik
- Tema basligi/metni
- Tema listesi ve donusum suresi
- Stil ayarlari

### 7.18 Ders Programi
- CSV yukleme
- Program sifirlama
- Sinif filtreleme
- Panel profili (id, grup, nobet bolgesi, rotasyon)
- Sinif grup secimi
- Sinif oncelik agirliklari
- Sharded CSV (parcali) URL listesi

### 7.19 Ekstra
- Acil duyuru (baslik, mesaj, otomatik kapatma, rotasyon kilidi)
- QR duyuru/link
- Sessiz saatler
- Otomatik remote CSV (Google Sheets URL + interval)

### 7.20 Veri Yonetimi
- Haftalik nobetci yonetimi
- Idareci/ogretmen kapasite ayarlari
- Konum/zaman tabanli nobet slotlari
- Yedekleme ve aktarim
- Merkezi endpoint/senkron/push ayarlari

### 7.21 Yayin
- Taslak modu
- Taslak kaydet
- Taslagi yayina alma (admin)
- Geri alma (rollback)

### 7.22 Denetim
- Islem loglarini goruntuleme
- JSON indirme
- Kayit temizleme (admin)

### 7.23 Guvenlik
- PIN korumasi
- Oturum suresi
- Admin/editor/viewer PIN yonetimi

## 8. Ders Programi CSV Kurallari

### 8.1 Oncelikli kaynak
- Ana kaynak: `ders_programi_pano_panoformat.csv`

### 8.2 Desteklenen kolon adlari
- `Gun`
- `Saat`
- `Sinif`
- `Ders`
- `Ogretmen`
- `Blok` (opsiyonel)

Sistem farkli baslik varyasyonlarini da esleyebilir.

### 8.3 Onemli notlar
- `._` ile baslayan dosyalari secmeyin (Apple metadata).
- CSV bozuksa veya erisim yoksa ders kutusunda bos/uyari gorunebilir.
- File modunda kisit varsa sistem uygun durumda onbellek CSV ile devam eder.

## 9. Yayin Akisi (Onerilen)

1. `Yayin` sekmesinde taslak modunu acin.
2. Degisiklikleri yapin.
3. `Taslak Kaydet`.
4. Kontrol edin.
5. `Taslagi Yayinla` (admin).
6. Sorun olursa `Yayini Geri Al`.

## 10. Yedekleme ve Tasinabilirlik

### 10.1 Yerel yedek
- `Yerel Yedek` ile localStorage anlik yedeklenir.

### 10.2 Dosya yedegi
- `Yedek Indir` ile JSON dosyasi alin.
- Baska cihaza tasiyip yukleyebilirsiniz.

### 10.3 Geri yukleme
- `Yedekten Don` (admin) veya dosyadan yukleme (admin).

## 11. Sik Hatalar ve Cozumler

### 11.1 "CSV dosyasi okunamadi"
- En dogru cozum: `YENI_PANO_HTTP_KIOSK_BASLAT.bat` ile acin.
- CSV dosyasinin adini/dizinini kontrol edin.
- Bir kez manuel CSV secerek onbellek olusturun.

### 11.2 Ders kutusunda beklenmeyen icerik
- `Ders Programi > Programi Sifirla`
- Dogru CSV yukle
- Kaynak secimini tekrar dogrula (server/uploaded/remote/sharded)

### 11.3 Medya yuklenemedi
- Dosya yolu hatali olabilir
- Tarayici dosya erisim kisiti olabilir
- Uygun formatla tekrar yukleyin (mp4 onerilir)

### 11.4 PIN hatasi
- Dogru role gore PIN girin
- Guvenlik sekmesinden admin ile PINleri guncelleyin

### 11.5 Ayarlar kayboldu gibi gorunuyor
- Ayni tarayici profiliyle acildigindan emin olun
- Yedekten geri yukleme yapin

## 12. Gunluk Isletim Rutini (Oneri)

Her sabah:
1. Pano acildi mi kontrol et
2. Saat/tarih dogru mu kontrol et
3. Ders kutusunda anlik dersler dogru mu kontrol et
4. Medya oynuyor mu kontrol et
5. Sesin derste kapali/teneffuste acik davrandigini kontrol et

Her hafta:
1. Nobetci verisi guncelle
2. CSV guncelle
3. Yedek al (indir + yerel)

Her buyuk degisiklikte:
1. Taslak kaydet
2. Kisa test yap
3. Yayina al

## 13. Hizli Komut Ozeti

- HTTP kiosk baslat: `YENI_PANO_HTTP_KIOSK_BASLAT.bat`
- Kiosk kapat: `PANO_KIOSK_DURDUR.bat`
- Ayarlar kaydet: Panel alti `AYARLARI KAYDET`
- Acil ac/kapat: Hizli islem `Acil` veya `Ekstra > Acil Duyuru`

## 14. Son Not

Sahada stabil calisma icin:
- `file://` yerine HTTP kiosk acilisini standart hale getirin
- Haftalik yedek rutini uygulayin
- Yayin akisini taslak->yayin seklinde yonetin


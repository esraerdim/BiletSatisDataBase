--SORGULAR
-- soyisminde AY harfi bulunan  01-01-2019 tarihinde sefer yapmýþ bilet fiyatý 70 tl olan bütün Yolcularýn adýný soyadýný doðum tarihini ve cinsiyetini listeleyin.
select Ad,Soyad,D_Tarihi,Cinsiyet 
From Yolcu y inner join Bilet b on
y.yolcuID=b.BiletID
inner join Sefer s on
b.BiletID=s.seferID
where y.Soyad LIKE '%ay%' AND b.Fiyat='70'

-- 25 ve 29 yaþ arasýnda  olan 01-01-2000 ve 01-01-2019 tarihleri arasýnda Adanadan Adýyamana sefer yapmýþ ve bilet fiyatý 50 tl olan bütün yolcularý listeleyiniz.
select Ad,Soyad,D_Tarihi,Cinsiyet
From Yolcu y inner join Bilet b on
y.yolcuID=b.BiletID inner join Sefer s on
b.BiletID= s.seferID where (y.D_Tarihi>='1990-01-01'and y.D_Tarihi<='1994-01-01') and (s.kalkis_tarihi>='2000-01-01'and s.kalkis_tarihi='2019-01-01') and s.kalkisterminalID=1
and s.varisterminalID=2 and b.Fiyat='50'







--  iptal edilen biletlerden kredi kartý ile ödeme yapan müþterilerden adýnda 'ö'  bulunup soyisminde 'k' geçen bilet fiyatý '50 tl' olan müþterileri listeleyiniz.
	
	select Datediff(year,D_Tarihi,GetDate())
	from Yolcu y inner join Bilet b on b.BiletID=y.yolcuID

	where y.Ad LIKE '%ö%'and y.Soyad LIKE'%k%' and b.Fiyat='50' and b.Durum=0
	






-- marka adý dennis olan aracýn yolcu kapasitesi
Select yolcu_kapasitesi
from Arac a inner join Marka m ON
a.aracID=m.MarkaID
where m.MarkaAdý='DENNÝS'
--Bu ay içinde Pamukkale firmasýndan hem Ankara-Ýstanbul hem de Ýzmir-Ýstanbul otobüs bileti alan yolcularýn tcno,ad soyad bilgileri

select tc, ad, soyad
from Yolcu y inner join Bilet b on y.yolcuID=b.BiletID inner join Il i on b.BiletID=i.ilID inner join Sefer s on s.seferID=b.BiletID inner join Firma f on
f.FirmaID=b.BiletID 
where s.kalkisterminalID=06 and s.varisterminalID=34 and f.FirmaAd='Pamukkale Turizm'
Intersect
select tc,ad,soyad
from Yolcu y inner join Bilet b on y.yolcuID=b.BiletID 
inner join Sefer s on s.seferID=b.BiletID inner join  Firma f on f.FirmaID=b.BiletID inner join Il i on b.BiletID=i.ilID 
where s.kalkisterminalID=35 and s.varisterminalID=34 and f.FirmaAd='Pamukkale Turizm'

-- THY yollarý için 2018 yýlýnda en az doluluk oranýna sahip olduðu ilk 3 ay da seyahat eden yolcularýn bilgileri.
select top 3 tc,ad,soyad
from yolcu y inner  join Bilet b on b.BiletID=y.yolcuID inner join
Sefer s on s.seferID = b.BiletID inner join Arac a on a.aracID=b.BiletID inner join Firma f on f.FirmaID=a.aracID
where FirmaAd='THY' and s.kalkis_tarihi like '%2018%'
order by yolcu_kapasitesi desc





--UPDATE

--Bagaj kg 150 olan yolcularýn bagajlarýn +5kg ekleyip bagaj kgý 50 nin altýnda olanlara 10 kg ekleyerek update edin.
-- BÝLET IDSÝ 1 OLAN YOLCUNUN BAGAJKG I 150YDÝ +5 EKLENDÝ. 17,18,37,38 IDLÝ YOLCULARIN BAGAJKGI 0 DI 10 EKLENDÝ. 23 IDLI YOLCUNUN BAGAJKG I 13TÜ 10 EKLENDÝ. 29 IDLI YOLCUNUN 
--BAGAJKGI 45TÝ 10 EKLENDÝ.
 Select BagajKg,BiletID
 from Bilet
 update Bilet Set BagajKg=(case when BagajKg=150 Then BagajKg+5
							when BagajKg<50 then BagajKg+10
							else BagajKg
							END) 




--Mail adresinde 'GUN' harfleri bulunan personellerden görevi satýþ danýþmaný olanlarýn görevini muavin olarak update et.
-- IDsi 1 olan personelin mail adresinde 'gun ' harfleri bulunuyordu. ve görevi satýþ danýþmanýydý. görevi muavin olarak deðiþtirildi.
Update Görev Set Açýklama ='Muavin'
From Personel AS P inner join Görev g on
p.personelID=g.GörevID
where p.Mail LIKE '%gun%'and g.Açýklama='Satýþ Danýþmaný'

Select Açýklama
from Görev



--Telefon numarasýnda 532 bulunan  olan yolculardan cinsiyetleri kadýn olanlarýn bilet fiyatlarýný 50 tl arttýrarak update et.
--IDSÝ 5 OLAN YOLCU ÞARTLARI SAÐLADIÐI ÝÇÝN BÝLET FÝYATI 50 TL ARTTIRILDI
Update Bilet set Fiyat= Fiyat+50
From Yolcu y inner join bilet b on
y.yolcuID=b.BiletID 
where y.Tel LIKE '%532%'  and y.Cinsiyet='kadýn'

select BiletID,fiyat
from bilet


-- Kredi kartýyla ödeme yapan yolcularýn biletlerini iptal ederek update et.
-- kredi kartýyla ödeme yapan yolcularýn biletleri iptal edildi.

update Bilet set Durum =0
from Odeme o inner join bilet b on b.BiletID=o.OdemeID
where o.OdemeTýpý='Kredi'




-- Ödeme tipi banka olan yolculardan '01-01-2019' tarihinde bursaya giden ve erkek olan yolcularýn bilet fiyatlarýný 15 arttýrarak update et.
-- þartý saðlayan 1  yolcunun bilgileri update edildi.
update Bilet set Fiyat = Fiyat+15
from Yolcu y inner join Bilet b on
y.yolcuID=b.BiletID inner join Sefer s on
s.seferID=b.BiletID
where s.kalkis_tarihi='2019-01-01'and y.Cinsiyet='Erkek'





--DELETE 
--  biletini iptal ettirmiþ ve bilet fiyatý 100tl yolcularý sil.
-- foreign key hatasý
delete from Yolcu
where yolcuID IN(select y.yolcuID from Yolcu y where exists (select * from Yolcu inner join Bilet b on b.BiletID=y.yolcuID where b.Durum='0' and b.Fiyat='100'))

-- yolcu kapasitesi 100 olan firmayý sil.

delete from Firma 
where FirmaID IN(select f.firmaID from Firma f where exists(select* from firma inner join Arac a  on f.FirmaID=a.aracID where a.yolcu_kapasitesi=40))
select *
from Firma

--yolcu kapasitesi 100den küçü olan araçlarýn firmasýný sil

delete from firma
where FirmaID IN (select f.firmaID from Firma f where exists(select* from firma inner join arac a on f.FirmaID=a.aracID where  yolcu_kapasitesi <100))

-- model adý Tourliner L olan aracýn marka Idsini sil

delete from Model
where ModelID in (select m.modelID from Model m where exists(select* from model inner join Arac a on m.ModelID=a.aracID where m.ModelAdý='Tourliner L'  ))

-- mailinde 'gu'bulunan personelin görevini silin.
delete from Görev
where GörevID in (select g.görevID from Görev g where exists(select* from Görev inner join Personel p on g.GörevID=p.personelID where p.Mail like '%gu%'))

-- firma ismi pamukkale turizm olan 100 yolcu kapasiteli aracýn modelini silin.
delete from Model
where ModelID in (select m.modelID from Model m where exists(select* from Model inner join Firma f on f.FirmaID=m.ModelID where f.FirmaAd='pamukkale turizm'))


-- iptal edilmiþ bileti bulunan araçlarýn modelini silin.
delete from model
where ModelID in (select m.modelID from Model m where exists(select* from model inner join bilet b on b.BiletID=m.ModelID where b.Durum='0'))


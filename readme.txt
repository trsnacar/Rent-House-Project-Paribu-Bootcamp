Rental Management System
=========================

Bu proje, Ethereum blockchain üzerinde çalışan bir kira yönetim sistemi geliştirmeyi amaçlar. Sistem, kiracıların mülkleri kiralayabileceği ve mülk sahiplerinin kiracıları yönetebileceği bir platform sağlar.

Özellikler:
- Kullanıcı oluşturma (Kiracı ve Mülk Sahibi)
- Mülk bilgilerini tanımlama ve listeleme
- Kiralama sözleşmeleri yönetimi
- Şikayet yönetimi

Kurulum:
1. Projeyi GitHub reposundan klonlayın veya indirin.
2. Terminalde `npm install` komutunu çalıştırarak gerekli bağımlılıkları yükleyin.
3. `truffle develop` komutunu kullanarak yerel bir Ethereum test ağında projeyi başlatın.
4. `truffle migrate` komutu ile akıllı kontratları ağa dağıtın.
5. `npm start` komutu ile web sunucusunu başlatın ve uygulamayı tarayıcıda görüntüleyin.

Kullanım:
- Web arayüzü üzerinden yeni kullanıcılar (kiracı veya mülk sahibi) ekleyin.
- Mülk sahipleri, mülk ekleyebilir ve mevcut mülkleri yönetebilir.
- Kiracılar, mevcut mülkleri görüntüleyebilir ve kiralama sözleşmesi başlatabilir.
- Her iki taraf da şikayet oluşturabilir ve yönetebilir.

Geliştirici Notları:
- Proje, Solidity, HTML, CSS, JavaScript ve Web3.js teknolojilerini kullanmaktadır.
- Akıllı kontrat testleri için `truffle test` komutunu kullanabilirsiniz.
- Projeyi geliştirirken herhangi bir değişiklik yaptıktan sonra testleri yeniden çalıştırın.

Destek ve İletişim:
- Projeye ilişkin sorularınız ve destek talepleriniz için [GitHub Issues](github.com/YourRepoLink/issues) kullanabilirsiniz.

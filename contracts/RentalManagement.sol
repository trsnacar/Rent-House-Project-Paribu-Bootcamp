// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Rental Management Contract
 * @dev Kiracı ve mülk sahipleri için kira yönetim sistemi
 */
contract RentalManagement {
    // Kullanıcı yapısı
    struct User {
        string name;
        string contactInfo;
        bool isLandlord;
    }

    // Mülk yapısı
    struct Property {
        string location;
        uint256 rent;
        bool isAvailable;
    }

    // Sözleşme yapısı
    struct RentalAgreement {
        uint256 propertyId;
        address tenant;
        uint256 startDate;
        uint256 endDate;
        bool isActive;
    }

    // Şikayet yapısı
    struct Complaint {
        uint256 propertyId;
        string description;
        address complainant;
        bool resolved;
    }

    // Kullanıcılar ve mülkler için mapping
    mapping(address => User) public users;
    mapping(uint256 => Property) public properties;
    mapping(uint256 => RentalAgreement) public agreements;
    mapping(uint256 => Complaint) public complaints;
    
    // Mülk ID ve Sözleşme ID sayaçları
    uint256 public nextPropertyId;
    uint256 public nextAgreementId;
    uint256 public nextComplaintId;

    // Olaylar (Events)
    event NewUser(address indexed user, bool isLandlord);
    event NewProperty(uint256 indexed propertyId, string location);
    event NewRentalAgreement(uint256 indexed agreementId, uint256 propertyId, address indexed tenant);
    event NewComplaint(uint256 indexed complaintId, uint256 propertyId, address indexed complainant);
    event ComplaintResolved(uint256 indexed complaintId, uint256 propertyId);

    // Kullanıcı ekleme
    function addUser(string memory _name, string memory _contactInfo, bool _isLandlord) public {
        require(bytes(_name).length > 0, "Isim bos olamaz");
        require(bytes(_contactInfo).length > 0, "Iletisim bilgisi gerekli");
        users[msg.sender] = User(_name, _contactInfo, _isLandlord);
        emit NewUser(msg.sender, _isLandlord);
    }

    // Mülk ekleme
    function addProperty(string memory _location, uint256 _rent) public {
        require(bytes(_location).length > 0, "Konum bos olamaz");
        require(_rent > 0, "Kira bedeli sifirdan buyuk olmalidir");
        uint256 propertyId = nextPropertyId++;
        properties[propertyId] = Property(_location, _rent, true);
        emit NewProperty(propertyId, _location);
    }

    // Sözleşme başlatma
    function startRentalAgreement(uint256 _propertyId, uint256 _startDate, uint256 _endDate) public {
        require(properties[_propertyId].isAvailable, "Mulk musait degil");
        require(_endDate > _startDate, "Bitis tarihi, baslangic tarihinden sonra olmalidir");
        uint256 agreementId = nextAgreementId++;
        agreements[agreementId] = RentalAgreement(_propertyId, msg.sender, _startDate, _endDate, true);
        properties[_propertyId].isAvailable = false;
        emit NewRentalAgreement(agreementId, _propertyId, msg.sender);
    }

    // Şikayet ekleme
    function addComplaint(uint256 _propertyId, string memory _description) public {
        require(properties[_propertyId].isAvailable, "Mulk musait degil");
        require(users[msg.sender].isLandlord || agreements[_propertyId].tenant == msg.sender, "Yalnizca mulk sahibi veya kiraci sikayet ekleyebilir");
        require(bytes(_description).length > 0, "Sikayet aciklamasi bos olamaz");
        uint256 complaintId = nextComplaintId++;
        complaints[complaintId] = Complaint(_propertyId, _description, msg.sender, false);
        emit NewComplaint(complaintId, _propertyId, msg.sender);
    }

    // Şikayeti çözüldü olarak işaretleme
    function resolveComplaint(uint256 _complaintId) public {
        require(complaints[_complaintId].complainant == msg.sender, "Yalnizca sikayet sahibi sikayeti cozebilir");
        complaints[_complaintId].resolved = true;
        emit ComplaintResolved(_complaintId, complaints[_complaintId].propertyId);
    }

    // Yardımcı fonksiyonlar

    // Mülkün durumunu kontrol etme
    function isPropertyAvailable(uint256 _propertyId) public view returns (bool) {
        return properties[_propertyId].isAvailable;
    }

    // Kiracının aktif kiralama sözleşmesini sorgulama
    function getActiveAgreement(address _tenant) public view returns (uint256) {
        for (uint256 i = 0; i < nextAgreementId; i++) {
            if (agreements[i].tenant == _tenant && agreements[i].isActive) {
                return i;
            }
        }
        return 0; // Aktif sözleşme bulunamadı
    }

    // ...
}
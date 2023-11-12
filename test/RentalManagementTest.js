const RentalManagement = artifacts.require("RentalManagement");

contract("RentalManagement", accounts => {
    let rentalManagement;
    
    before(async () => {
        rentalManagement = await RentalManagement.deployed();
    });

    // Kullanıcı ekleme testi
    it("should allow adding a new user", async () => {
        const userName = "Test User";
        const userContact = "test@example.com";
        const isLandlord = true;

        await rentalManagement.addUser(userName, userContact, isLandlord);

        const user = await rentalManagement.users(accounts[0]);
        assert.equal(user.name, userName, "User name should match");
        assert.equal(user.contactInfo, userContact, "User contact info should match");
        assert.equal(user.isLandlord, isLandlord, "User type should match");
    });

    // Mülk ekleme testi
    it("should allow a landlord to add a property", async () => {
        const propertyLocation = "123 Main St";
        const propertyRent = web3.utils.toWei("1", "ether");

        await rentalManagement.addProperty(propertyLocation, propertyRent, { from: accounts[0] });

        // Burada mülkün başarıyla eklendiğini kontrol edin.
    });

    // Diğer fonksiyon testleri...
});

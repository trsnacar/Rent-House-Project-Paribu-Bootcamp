// Bu fonksiyon, kullanıcının arayüzdeki formu kullanarak mülk eklemesini sağlar.
function addProperty() {
    const location = document.getElementById("location").value;
    const rent = document.getElementById("rent").value;
    console.log("Adding property:", location, rent);

    // Burada Web3.js veya ethers.js kullanarak akıllı kontratınızla etkileşime geçebilirsiniz.
    // Örneğin: rentalManagementContract.addProperty(location, rent);
}

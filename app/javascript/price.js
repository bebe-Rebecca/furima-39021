function priceInput() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(priceInput.value * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(
      priceInput.value - Math.floor(priceInput.value * 0.1)
    );
  });
}

window.addEventListener("load", priceInput);

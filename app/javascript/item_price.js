function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
    let feeRate = 0.1;
    addTaxDom.innerHTML = Math.floor(priceInput.value * feeRate);
  const addProfitDom = document.getElementById("profit");
    let fee = 0.9;
    addProfitDom.innerHTML = Math.floor(priceInput.value * fee);
  });
};


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
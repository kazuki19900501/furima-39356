window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  if (isNaN(inputValue) || inputValue === "") {
    addTaxDom.innerHTML = "0";
    profitDom.innerHTML = "0";
    return;
  }

  // 販売手数料の計算（入力値の10%）
  const tax = Math.floor(inputValue * 0.1);

  // 販売利益の計算（入力値から販売手数料を引いた値）
  const profit = inputValue - tax;

  addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;

})
});

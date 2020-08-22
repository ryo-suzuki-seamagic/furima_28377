window.addEventListener('load',function(){

  const Price = document.getElementById("item-price");
  const Tax = document.getElementById("add-tax-price");

  const Profit = document.getElementById("profit");

    Price.addEventListener('input', function(){
      
      const addTax = (Price.value * 0.1);
      Tax.textContent = addTax;
      const addProfit = (Price.value - addTax );
      Profit.textContent = addProfit;

      


    })

    
  
})
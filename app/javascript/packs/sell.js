console.log(document.getElementById("item-price"))
document.addEventListener('DOMContentLoaded', function() {
  document.getElementById("item-price").onchange = function(){
    console.log('test')
    let tax = Math.floor(document.getElementById('item-price').value * 0.1);
    let profit = Math.floor(document.getElementById('item-price').value * 0.9);
    document.getElementById('add-tax-price').innerHTML = tax;
    document.getElementById('profit').innerHTML = profit;
  };
});
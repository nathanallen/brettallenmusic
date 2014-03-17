var handler, item_data

$('document').ready(function(){

  setBuyNowListeners()

  handler = StripeCheckout.configure({
    key: 'pk_test_o9iaBk6OeqmmjDG5o5XaLrAf',
    shippingAddress: true,
    //image: '/kcleff-icon-or-sheetmusic.png',
    token: submitOrder
  });

})

function setBuyNowListeners(){
  $('.buy-now').each(function(_,v){
    $(v).on('click',function(e){
      e.preventDefault()
      item_data = getItemData(e)
      openCheckout(item_data)
    })
  })
}

function getItemData(e){
  var dropdown = $('#' + e.target.id + '.form-control')[0]
  var selected_item = dropdown.selectedOptions[0]
  return {
    name: dropdown.dataset.name,
    description: selected_item.value,
    price: parseInt(selected_item.dataset.price),
  }
}

function openCheckout(item_data){
  handler.open(item_data);
}
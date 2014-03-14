var handler

$('document').ready(function(){

  setBuyNowListeners()

  handler = StripeCheckout.configure({
    key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
    shippingAddress: true,
    //image: '/kcleff-icon-or-sheetmusic.png',
    token: function(token, args) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
      $.post('/charges', {stripeToken: token.id})
        .done(function(data){console.log(data)})
    }
  });

})

function setBuyNowListeners(){
  $('.buy-now').each(function(_,v){
    $(v).on('click',function(e){
      e.preventDefault();
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
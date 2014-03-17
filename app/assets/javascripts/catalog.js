var handler, item_data

$('document').ready(function(){
  setBuyNowListeners()
  configureCheckout()
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
    //item_id
  }
}

function configureCheckout(){
  var stripe_key = $('meta[name="stripe-key"]').attr('content')
  handler = StripeCheckout.configure({
    key: stripe_key,
    shippingAddress: true,
    //image: '/kcleff-icon-or-sheetmusic.png',
    token: submitOrder
  });
}

function openCheckout(item_data){
  handler.open(item_data)
}

function submitOrder(token,args){
  args.email = token.email
  $.post('/charges', {stripe_token: token.id, customer: args, item: item_data})
   .success(function(data){alert("Thanks for your order!")})
   .fail(function(){alert("There was a problem with your order.")})
}
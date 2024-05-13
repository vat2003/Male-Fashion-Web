/**
 * 
 */

 function addToCart(proId) {
    var sizeSelected = $("input[name='sizes']:checked").val();
    console.log('clicked');
    if (!sizeSelected) {
        $('#sizeErrorModal').modal('show');
        return;
    } else {
        updateAddToCartLink(proId);
    }
}

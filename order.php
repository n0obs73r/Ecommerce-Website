<?php


include("includes/db.php");
include("includes/header.php");
include("functions/functions.php");

?>

<?php



if(isset($_GET['c_id'])){

$customer_id = $_GET['c_id'];

}


$get_orders = "select * from customer_orders where customer_id='$customer_id'";

$run_orders = mysqli_query($con,$get_orders);

$i = 1600;

while($row_orders = mysqli_fetch_array($run_orders)) {

    $order_id = $row_orders['order_id'];

    $i++;
}
$ip_add = getRealUserIp();

$status = "pending";

$invoice_no = mt_rand();

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);


$unique_id = $i;


while($row_cart = mysqli_fetch_array($run_cart)){

$pro_id = $row_cart['p_id'];

$pro_size = $row_cart['size'];

$pro_qty = $row_cart['qty'];


$sub_total = $row_cart['p_price']*$pro_qty;


$insert_customer_order = "insert into customer_orders (order_id, customer_id,due_amount,invoice_no,qty,size,order_date,order_status) values ('$unique_id','$customer_id','$sub_total','$invoice_no','$pro_qty','$pro_size',NOW(),'$status')";

$run_customer_order = mysqli_query($con,$insert_customer_order);

$insert_pending_order = "insert into pending_orders (order_id, customer_id,invoice_no,product_id,qty,size,order_status) values ('$unique_id','$customer_id','$invoice_no','$pro_id','$pro_qty','$pro_size','$status')";

$run_pending_order = mysqli_query($con,$insert_pending_order);

$delete_cart = "delete from cart where ip_add='$ip_add'";

$run_delete = mysqli_query($con,$delete_cart);



}

function validShipRocketToken($con){
    date_default_timezone_set('Asia/Kolkata');
    $row=mysqli_fetch_assoc(mysqli_query($con,"select * from shiprocket_token"));
    $added_on=strtotime($row['added_on']);
    $current_time=strtotime(date('Y-m-d h:i:s'));
    $diff_time = $current_time-$added_on;
    if($diff_time>86400){
        $token=generateShipRocketToken($con);
//        echo $token;
    }
    else{
        $token=$row['token'];
//        echo $token;

    }
    return $token;
}

function generateShipRocketToken($con)
{

    date_default_timezone_set('Asia/Kolkata');
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://apiv2.shiprocket.in/v1/external/auth/login",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>"{\n    \"email\": \"aryan.prince999@gmail.com\",\n    \"password\": \"Koha4life.\"\n}",
        CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json"
        ),
    ));
    $SR_login_Response = curl_exec($curl);
    curl_close($curl);
    $SR_login_Response_out = json_decode($SR_login_Response);
    $token = $SR_login_Response_out->{'token'};
    $added_on=date('Y-m-d h:i:s');
    mysqli_query($con,"update shiprocket_token set token='$token', added_on = '$added_on' where id=2");
    return $token;
}

$total =0;
function placeShipRocketOrder($con, $token, $unique_id)
{

    if(isset($_GET['c_id'])){

        $customer_id = $_GET['c_id'];

    }
    date_default_timezone_set('Asia/Kolkata');
    $row=mysqli_fetch_assoc(mysqli_query($con,"select * from shiprocket_token"));
    $order_date_str=strtotime($row['added_on']);
    $order_date=date('Y-m-d h:i',$order_date_str);
//        echo $customer_id;
    $row_order=mysqli_fetch_assoc(mysqli_query($con, "select * from customers where customer_id='$customer_id'"));
    $name=$row_order['customer_name'];
    $email=$row_order['customer_email'];
    $mobile=$row_order['customer_contact'];
    $address=$row_order['customer_address'];

    $html='';
    $res=mysqli_query($con, "select pending_orders.*, products.product_title,products.product_price from pending_orders, products where products.product_id = pending_orders.product_id  and pending_orders.order_id='$unique_id'");
    while($row = mysqli_fetch_assoc($res)){
        $sku=rand(111111,999999);
        $html.='{
		  "name": "'.$row['product_title'].'",
		  "sku": "'.$sku.'",
		  "units": '.$row['qty'].',
		  "selling_price": "'.$row['product_price'].'",
		  "discount": "",
		  "tax": "",
		  "hsn": ""
		},';
    }
    echo $html;
    $html=rtrim($html,",");

$total=0;
$reso=mysqli_query($con, "select pending_orders.*, products.product_title,products.product_price from pending_orders, products where products.product_id = pending_orders.product_id  and pending_orders.order_id='$unique_id'");
while($row_p = mysqli_fetch_assoc($reso)){
    $total+=$row_p['product_price']*$row_p['qty'];
}


//$resol=mysqli_query($con, "select pending_orders.order_id,pending_orders.product_id,pending_orders.qty from pending_orders where pending_orders.order_id = '$unique_id'");
//    //$row_payments = mysqli_fetch_array($resol);
//$total=0;
//while($co = mysqli_fetch_array($resol)){
//    $total+=$co['due_amount'];
//}
echo $total;

    date_default_timezone_set('Asia/Kolkata');
    $row=mysqli_fetch_assoc(mysqli_query($con,"select * from shiprocket_token"));
    $order_date_str=strtotime($row['added_on']);
//    echo $order_date_str;
    $order_date=date('Y-m-d h:i',$order_date_str);
    $order_id = $unique_id;
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://apiv2.shiprocket.in/v1/external/orders/create/adhoc",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{"order_id": "'.$order_id.'",
  "order_date": "'.$order_date.'",
  "pickup_location": "home",
  "billing_customer_name": "'.$name.'",
  "billing_last_name": "",
  "billing_address": "'.$address.'",
  "billing_address_2": " ",
  "billing_city": "Not Applicable",
  "billing_pincode": "122039",
  "billing_state": "Not Applicable",
  "billing_country": "India",
  "billing_email": "'.$email.'",
  "billing_phone": "'.$mobile.'",
  "shipping_is_billing": true,
  "shipping_customer_name": "",
  "shipping_last_name": "",
  "shipping_address": "",
  "shipping_address_2": "",
  "shipping_city": "",
  "shipping_pincode": "",
  "shipping_country": "",
  "shipping_state": "",
  "shipping_email": "",
  "shipping_phone": "",
  "order_items": [
    '.$html.'
  ],
  "payment_method": "Cod",
  "shipping_charges": 0,
  "giftwrap_charges": 0,
  "transaction_charges": 0,
  "total_discount": 0,
  "sub_total": '.$total.',
  "length": 10,
  "breadth": 15,
  "height": 20,
  "weight": 2.5
	}',
        CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json",
            "Authorization: Bearer $token"
        ),
    ));
    $SR_login_Response = curl_exec($curl);
    curl_close($curl);
    //$SR_login_Response_out = json_decode($SR_login_Response);
    echo '<pre>';
    print_r($SR_login_Response);
}

$token = validShipRocketToken($con);

placeShipRocketOrder($con, $token, $unique_id);
//$i++;

echo "<script>alert('Your order has been submitted,Thanks ')</script>";

echo "<script>window.open('customer/my_account.php?my_orders','_self')</script>";


?>

<footer class="bg-primary text-white text-center text-lg-start" style="background-color:#000000;font-family:poppins;" id="testfooter">
  <!-- Grid container -->
    <div class="footer-newsletter">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 d-flex align-items-stretch justify-content-center">
                    <h4 style="text-align: center;">Our Newsletter</h4>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 d-flex align-items-stretch justify-content-center">
                    <p style="text-align: center;">Stay in the loop for upcoming products</p>
                </div>
                <div class="col-lg-6">
                    <form method="post" style="background-color: black">
                        <input type="email" style="color: black; border-radius: 20px; text-align: center"
                               name="useremail" placeholder="YourEmail@email.com" class="email-box" maxlength="60"
                               id="email_data">
                        <br>
                        <span class="email-message" id="email_msg"></span>
                        <br>
                        <button class="submit-button"
                                style="background-color: aquamarine; border-radius: 20px; color: black" type="button"
                                id="email_submit">Subscribe
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  <div class="container p-4" id="testmen">
    <!--Grid row-->
    <div class="row">
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase" style="text-decoration:underline;">KOHA</h5>

        <ul class="list-unstyled mb-0">
		<li>
            <a href="index.php" class="text-white" style="color:white;line-height:50px;">Home</a>
          </li>
		  <li>
            <a href="aboutus.php" class="text-white" style="color:white;line-height:50px;">How it All Started</a>
          </li>
		  <li>
            <a href="#" class="text-white" style="color:white;line-height:50px;">PIXEL ART</a>
          </li>
          <li>
            <a href="howitworks.php" class="text-white" style="color:white;line-height:50px;">How It Works</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase mb-0" style="text-decoration:underline;">MORE</h5>

        <ul class="list-unstyled mb-0">
		 <li>
            <a href="faq.php" class="text-white" style="color:white;line-height:50px;">FAQ</a>
          </li>
		  <li>
            <a href="termsandconditions.php" class="text-white" style="color:white;line-height:50px;">Shipping Information</a>
          </li>
          <li>
            <a href="privacypolicy.php" class="text-white" style="color:white;line-height:50px;">Privacy Policy</a>
          </li>
          <li>
            <a href="returnsandrefunds.php" class="text-white" style="color:white;line-height:50px;">Return Policy</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->
    </div>
    <!--Grid row-->
  </div>
  <!-- Grid container -->
<div class="container pt-4" style="line-height:50px;background-color:blue;width:100%;">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-facebook-f" style="color:white;"></i
      ></a>

      <!-- Twitter -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-twitter" style="color:white;"></i
      ></a>

      <!-- Google -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-google" style="color:white;"></i
      ></a>

      <!-- Instagram -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-instagram" style="color:white;"></i
      ></a>

      <!-- Linkedin -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-linkedin" style="color:white;"></i
      ></a>
      <!-- Github -->
      <a
        class="btn btn-link btn-floating btn-lg text-dark m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-github" style="color:white;"></i
      ></a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Copyright -->
  <div class="text-center p-3">
   Copyright © 2022, Koha Website. All Rights Reserved – 
    <a class="text-white" style="color:#FFFFFF;line-height:50px;" href="#">Developed and Designed by Bleam Technologies Private Limited</a>
  </div>
</footer>
  <!-- Copyright -->
    <script>
        $(document).ready(function () {

            $('#itemslider').carousel({ interval: 3000 });

            $('.carousel-showmanymoveone .item').each(function () {
                var itemToClone = $(this);

                for (var i = 1; i < 5; i++) {
                    itemToClone = itemToClone.next();

                    if (!itemToClone.length) {
                        itemToClone = $(this).siblings(':first');
                    }

                    itemToClone.children(':first-child').clone()
                        .addClass("cloneditem-" + (i))
                        .appendTo($(this));
                }
            });
        });

        $("#email_submit").click(function (){

            var $email_data_var;
            $email_data_var = $("#email_data").val();
            if($email_data_var == ''){
                $("#email_msg").html("Please Enter a Email Address");
            }
            else{

                $.ajax({

                    type:'POST',
                    url:"ajax/email-submit.php",
                    data:{email_data_values : $email_data_var},
                    success:function(response){
                        $("#email_msg").html(response);
                    }

                });

            }

        });

    </script>

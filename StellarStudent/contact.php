<?php
include("header.php");
?>
  <section id="contentSection">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-8">
        <div class="left_content">
          <div class="contact_area">

            <h2>Contact Us</h2>
<?php
if(isset($_POST['submit']))
{   
		$msg = "<strong>Name :</strong> $_POST[name]<br>
		<strong>Email ID :</strong> $_POST[email]<br>
		<strong>Mobile No. :</strong> $_POST[mobno]<br>
		$_POST[message]
		";
		include("phpmailer.php");
		sendmail('rrasagna13@gmail.com',$_POST['name'],"Mail from StudentStellar..",$msg);		
}
else
{
		$msg =  "<p>Feel free to contact us...</p>";
}
?>
            
            <form action="" method="post" class="contact_form" name="frmcontact" onsubmit="return validateform()">
              <input class="form-control" type="text" name="name" placeholder="Name*">
              	<br>
              <input class="form-control" type="email" name="email" placeholder="Email*">
               <span id="idemailid"></span>
              	<br>
              <input class="form-control" type="mobile" name="mobno" placeholder="Mobile No.">
               	<br>
              <textarea class="form-control" name="message" cols="30" rows="10" placeholder="Message*"></textarea>
               <span id="idmessage"></span>
              	<br>
              <input type="submit" value="Send Message" name="submit">
            </form>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4">
        <aside class="right_content">
          <div class="single_sidebar">
            <h2><span>CONTACT INFO</span></h2>
            <ul class="spost_nav">
              <li>
                <div class="media wow fadeInDown"> <a href="#" class="media-left"> <img alt="" src="bvrithlogo.png"> </a>
                  <div class="media-body"> <a href="https://www.youtube.com/watch?v=oWy93hpX1gA" class="catg_title"> <br>BVRIT HYDERABAD College of Engineering for Women.<br><br>Plot No. 8-5/4, Rajiv Gandhi Nagar Colony, Nizampet Rd, Bachupally, <br>Hyderabad-500090</a> </div>
                </div><br>
              </li>
              <li>
                <div class="media wow fadeInDown"> <a href="#" class="media-left"> <img alt="" src="gmail.png"> </a><br>
                  <div class="media-body"> <a href="#" class="catg_title"> Mail Us - info@bvrithyderabad.edu.in</a> </div>
                </div>
              </li>
              <li>
                <div class="media wow fadeInDown"> <a href="#" class="media-left"> <img alt="" src="call.png" height="10" width="10"> </a><br>
                  <div class="media-body"> <a href="http://bvrithyderabad.edu.in/reachus/" class="catg_title"> Call Us - +91 40 4241 7773</a> </div>
                </div>
              </li>
             
            </ul>
          </div>
        </aside>
      </div>
    </div>
  </section>
 <?php
 include("footer.php")
 ?>
  <script type="application/javascript">
 function validateform()
 {
	  var alphaExp = /^[a-zA-Z]+$/; //Variable to validate only alphabets
		var alphaspaceExp = /^[a-zA-Z\s]+$/; //Variable to validate only alphabets and space
		var alphanumbericExp = /^[a-zA-Z0-9]+$/; //Variable to validate only alphabets and space
		var numericExpression = /^[0-9]+$/; //Variable to validate only numbers
	 
	 
	 var validatecondtion = 0;
	     
	 document.getElementById("idemailid").innerHTML ="";
	 document.getElementById("idmessage").innerHTML ="";
	 
	  if(document.frmcontact.email.value=="")
	 {
		 document.getElementById("idemailid").innerHTML ="<font color='red'>Kindly select User type..</font>";
		 validatecondtion=1;
	 }
	  if(document.frmcontact.message.value=="")
	 {
		 document.getElementById("idmessage").innerHTML ="<font color='red'>Kindly select User type..</font>";
		 validatecondtion=1;
	 }
	 
	 if(validatecondtion==1)
	 {
		 return false;
	 }
	 else
	 {
		 return true;
	 }
 }
 </script>
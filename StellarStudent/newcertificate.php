<?php
include("header.php");
if($_SESSION['sessionid'] == $_POST['sessionid'])
{
	if(isset($_POST['submit']))
	{
		$certificate_file = rand() . $_FILES['certificate_file']['name'];
		move_uploaded_file($_FILES['certificate_file']['tmp_name'],"certificate_file/".$certificate_file);
		$event_name= mysqli_real_escape_string($con, $_POST['event_name']);
		$certificate_detail = mysqli_real_escape_string($con, $_POST['certificate_detail']);	    
		$sql="INSERT INTO certificate(`certificate_type_id`, `certificate_date`, `cerficate_place`, `event_name`, `price_won`, `certificate_detail`, `certificate_file`, `status`,student_id) values ('$_POST[certificate_type_id]', '$_POST[certificate_date]', '$_POST[cerficate_place]', '$event_name', '$_POST[price_won]', '$certificate_detail', '$certificate_file','Pending','" . $_SESSION['student_id']. "')";
		$qsql = mysqli_query($con,$sql);
		if(!$qsql)
		{
			echo mysqli_error($con);
		}
		if(mysqli_affected_rows($con) == 1)
		{
			echo "<SCRIPT>alert('Certificate uploaded successfully.. Staff Verification required for the certificate..');</SCRIPT>";
			echo "<script>window.location='viewcertificates.php';</script>";
		}
	    
	}
}
$_SESSION['sessionid'] = rand();
if(isset($_GET['editid']))
{
	$sqledit = "SELECT * FROM certificate WHERE certificate_id='" . $_GET['editid']  . "'";
	$qsqledit = mysqli_query($con,$sqledit);
	$rsedit = mysqli_fetch_array($qsqledit);
}
?>
  <section id="contentSection">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-8">
        <div class="left_content">
          <div class="contact_area">
            <h2>Certificate</h2>
            <p>Here you can add details about the Certificates that you have achieved. Please do not enter details of any  same certificate twice.</p>
            <form action="" class="contact_form" method="post" name="frmdiscussion" onsubmit="return validateform()" enctype="multipart/form-data">
            <input  type="hidden" name="sessionid" value="<?php echo $_SESSION['sessionid']; ?>" >

              <span id="spansubjectid">
              Certificate Type:<font color='red' size='4'><strong>*</strong></font>
              <select name="certificate_type_id" class="form-control">
              	<option value="">Select Certificate Type</option>
              <?php
				  $sql ="SELECT * FROM certificate_type";
				  $qsql = mysqli_query($con, $sql);
				  echo mysqli_error($con);
				  while($rsrec = mysqli_fetch_array($qsql))
				{
					if($rsrec['certificate_type_id'] == $rsedit['certificate_type_id'])
					{
					echo "<option value='$rsrec[certificate_type_id]' selected>$rsrec[certificate_type]</option>";
					}
					else
					{					
					echo "<option value='$rsrec[certificate_type_id]'>$rsrec[certificate_type]</option>";
					}
				}
				?>
              </select>
               </span>
               <span id="idcertificate_type_id"></span>
               <br /> 
              Certificate Date:<font color='red' size='4'><strong>*</strong></font>
              <input name="certificate_date" class="form-control" type="date" placeholder="Certificate date" value="<?php echo $rsedit['certificate_date']; ?>" max="<?php echo date("Y-m-d"); ?>">
               <span id="idcertificate_date"></span>
               <br />
              Issuing organization name:<font color='red' size='4'><strong>*</strong></font>
              <input name="cerficate_place" class="form-control" type="text" placeholder="Enter the organization's name which issued certificate" value="<?php echo $rsedit['cerficate_place']; ?>">
               <span id="idcerficate_place"></span>
               <br />
              Event Name:<font color='red' size='4'><strong>*</strong></font>
              <input name="event_name" class="form-control" type="text" placeholder=" Enter name of event" value="<?php echo $rsedit['event_name']; ?>">
               <span id="idevent_name"></span>
               <br />
             Prize won:</font>
              <input name="price_won" class="form-control" type="text" placeholder="If any prize won" value="<?php echo $rsedit['price_won']; ?>">
               <span id="idprice_won"></span>
               <br />
			   
             Attach  Certificate here: (PDF Or Image Format)<font color='red' size='4'><strong>*</strong></font>
              <input name="certificate_file" class="form-control" type="file" accept="image/*,application/pdf" >
               <span id="idcertificate_file"></span>
               <br />
			   
			   
              Detailed information about certificate:</font>
            <textarea name="certificate_detail" id="descriptions" class="form-control"  rows="6" placeholder="Enter Description"><?php echo $rsedit['certificate_detail']; ?></textarea><span id="iddescription"></span>
               <br />
               <span id="idcertificate_detail"></span>
			   
              <input name="submit" type="submit" value="Upload Certificate">
            </form>
          </div>
        </div>
      </div>
      <?php include("rightsidebar.php"); ?>
    </div>
  </section>
 <?php
 include("footer.php")
 ?>
 <script>
function loadsubject(courseid) {
    if (courseid == "")
	{
        document.getElementById("spansubjectid").innerHTML = "";
        return;
    } 
	else
	{ 
        if (window.XMLHttpRequest)
		{
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } 
		else
		{
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
				
        xmlhttp.open("GET","ajaxloadsubject.php?courseid="+courseid,true);
        xmlhttp.send();
				
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("spansubjectid").innerHTML = this.responseText;
            }
        };
    }
}
</script>
<script type="application/javascript">
 function validateform()
 {
	 var validatecondtion = 0;
	 document.getElementById("idcertificate_type_id").innerHTML ="";                     
	 document.getElementById("idcertificate_date").innerHTML ="";
	 document.getElementById("idcerficate_place").innerHTML ="";
	 document.getElementById("idevent_name").innerHTML ="";
	 document.getElementById("idcertificate_file").innerHTML ="";
	 if(document.frmdiscussion.certificate_type_id.value=="")
	 {
		 document.getElementById("idcertificate_type_id").innerHTML ="<font color='red'>Select the Certificate Type...</font>";
		 validatecondtion=1;
	 }
	 if(document.frmdiscussion.certificate_date.value=="")
	 {
		 document.getElementById("idcertificate_date").innerHTML ="<font color='red'>Kindly select Certificate date</font>";
		 validatecondtion=1;
	 }
	 if(document.frmdiscussion.cerficate_place.value=="")
	 {
		 document.getElementById("idcerficate_place").innerHTML ="<font color='red'>Kindly enter Location</font>";
		 validatecondtion=1;
	 }
	 if(document.frmdiscussion.event_name.value=="")
	 {
		 document.getElementById("idevent_name").innerHTML ="<font color='red'>Event Name should not be empty</font>";
		 validatecondtion=1;
	 }
	 if(document.frmdiscussion.certificate_file.value=="")
	 {
		 document.getElementById("idcertificate_file").innerHTML ="<font color='red'>Kindly upload certificate </font>";
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
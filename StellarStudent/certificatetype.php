<?php
include("header.php");
if($_SESSION['sessionid'] == $_POST['sessionid'])
{
	if(isset($_POST['submit']))
	{
		$course_description= mysqli_real_escape_string($con, $_POST['certificate_type_note']);
		if(isset($_GET['editid']))
		{
			echo $sql="UPDATE certificate_type set certificate_type='$_POST[certificate_type]',certificate_type_note='$course_description',certificate_type_status='Active' WHERE certificate_type_id='" . $_GET['editid']  . "'";
			$qsql = mysqli_query($con,$sql);
				echo mysqli_error($con);
			if(mysqli_affected_rows($con) == 1)
			{
				echo "<SCRIPT>alert('Certificate Type UPDATED successfully..');</SCRIPT>";
				echo "<script>window.location='viewcertificatetype.php';</script>";
			}	
		}
		else
		{
			$sql="INSERT INTO certificate_type(certificate_type,certificate_type_note,certificate_type_status) values ('$_POST[certificate_type]','$course_description','Active')";
			$qsql = mysqli_query($con,$sql);
			if(!$qsql)
			{
				echo mysqli_error($con);
			}
			if(mysqli_affected_rows($con) == 1)
			{
				echo "<SCRIPT>alert('Certificate Type inserted successfully.');</SCRIPT>";
				echo "<script>window.location='viewcertificatetype.php';</script>";
			}
		}
	}
}
$_SESSION['sessionid'] = rand();
if(isset($_GET['editid']))
{
	$sqledit = "SELECT * FROM certificate_type WHERE certificate_type_id='" . $_GET['editid']  . "'";
	$qsqledit = mysqli_query($con,$sqledit);
	$rsedit = mysqli_fetch_array($qsqledit);
}
?>
  <section id="contentSection">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-8">
        <div class="left_content">
          <div class="contact_area">
            <h2>Certificate Type</h2>
            <p>Add new Certificate Type with proper description.</p>
            <form action="" class="contact_form" method="post" name="frmcourse" onsubmit="return validateform()">
            <input  type="hidden" name="sessionid" value="<?php echo $_SESSION['sessionid']; ?>" >
				Certificate Type<font color='red' size='4'><strong>*</strong></font>:
              <input name="certificate_type" class="form-control" type="text" placeholder="Certificate Type" value="<?php echo $rsedit['certificate_type']; ?>">
              <span id="idcertificate_type"></span>
              <br />
              Certificate Type Description
              <textarea name="certificate_type_note" class="form-control" cols="30" rows="10" placeholder="Add Description"><?php echo $rsedit['certificate_type_note']; ?></textarea>
              <br>
              <input name="submit" type="submit" value="Submit">
            </form>
          </div>
        </div>
      </div>
      
    </div>
  </section>
 <?php
 include("footer.php")
 ?>
 <script type="application/javascript">
 function validateform()
 {
	 var validatecondtion = 0;
	 document.getElementById("idcertificate_type").innerHTML ="";
	 if(document.frmcourse.certificate_type.value=="")
	 {
		 document.getElementById("idcertificate_type").innerHTML ="<font color='red'>Kindly add certificate type..</font>";
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
<?php
include("header.php");  
if(isset($_POST['submit']))
{
	$sql = "UPDATE certificate SET status='" . $_POST['status'] . "',note='" . $_POST['certificatetitle'] ."' WHERE certificate_id ='$_GET[certificate_id]'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Certificate record updated successfully..');</script>";
	}
}
$sql="SELECT * FROM certificate WHERE certificate_id ='$_GET[certificate_id]'";
$qsql=mysqli_query($con,$sql);
$rsrec = mysqli_fetch_array($qsql);

?>
  <section id="contentSection">
    <div class="row">
	
          <center><h2>Student detail</h2></center>
	<table border="1" border="1" class="table table-striped table-bordered" cellspacing="0" style="width:100%;">
    <thead>        
  <tr>
    <th scope="col">Image</th>
    <th scope="col">Student Name</th>
    <th scope="col">Batch</th>
    <th scope="col">Roll No</th>
    <th scope="col">Course</th>
    <th scope="col">About Student</th>
    <th scope="col">Email ID</th>
    <th scope="col">Mobile No</th>
  </tr>
  </thead>
  <tbody>
  <?php  
  $sql ="SELECT * FROM student WHERE student_id='" . $rsrec['student_id'] . "'";
  $qsql = mysqli_query($con, $sql);
 while($rssrec = mysqli_fetch_array($qsql))
  {
	  $sqlcourse = "SELECT * FROM course WHERE course_id='$rssrec[course_id]'";
	  $qsqlcourse = mysqli_query($con,$sqlcourse);
	  $rscourse = mysqli_fetch_array($qsqlcourse);
    echo "<tr>
    <td>&nbsp;<img src='studentimages/$rssrec[student_img]' width='50' height='50' ></td>
    <td>&nbsp;$rssrec[student_name]</td>
    <td>&nbsp;$rssrec[batch]</td>
    <td>&nbsp;$rssrec[roll_no]</td>
    <td>&nbsp;$rscourse[course]</td>
    <td>&nbsp;$rssrec[about_student]</td>
    <td>&nbsp;$rssrec[email_id]</td>
    <td>&nbsp;$rssrec[mob_no]</td>";
	echo " </tr>";
  }
  ?>
  </tbody>
</table>

<hr>
	
	
          <center><h2>Certificate detail</h2></center>
<?php
	  $sqlcertificate_type = "SELECT * FROM certificate_type WHERE certificate_type_id='$rsrec[certificate_type_id]'";
	  $qsqlcertificate_type = mysqli_query($con,$sqlcertificate_type);
	  $rscertificate_type = mysqli_fetch_array($qsqlcertificate_type);
?>
            <table border="1" class="table table-striped table-bordered" cellspacing="0" style="width:1100px;">
            <thead>
<tr>
    <th scope="col">Certificate Type</th> <td>&nbsp;<?php echo $rscertificate_type['certificate_type']; ?></td>
    <th scope="col">Event name</th> <td>&nbsp;<?php echo $rsrec['event_name']; ?></td>
</tr>

<tr>
    <th scope="col">Certificate Date</th> <td>&nbsp;<?php echo date("d-M-Y",strtotime($rsrec['certificate_date'])); ?></td>
    <th scope="col">Event Place</th> <td>&nbsp;<?php echo $rsrec['cerficate_place']; ?></td>
</tr>
   
<tr>
    <th scope="col">Prize Won</th> <td colspan="3">&nbsp;<?php echo $rsrec['price_won']; ?></td>
</tr>
   
<tr>
    <th scope="col">About Certificate</th> <td colspan="3">&nbsp;<?php echo $rsrec['certificate_detail']; ?></td>
</tr>
   
   
<tr>
    <th scope="col" style="vertical-align: top;">Certificate</th> <td colspan="3">&nbsp;
	<center><a href="certificate_file/<?php echo $rsrec['certificate_file']; ?>" class="btn btn-info" download>Download Certificate</a></center>
	<hr>
	<embed src="certificate_file/<?php echo $rsrec['certificate_file']; ?>" style='width: 100%;height: 600px;'
 type="application/pdf">
	</td>
</tr>
<?php
if(isset($_SESSION['student_id']))
{
?>
<tr>
    <th scope="col">Staff message</th> <td colspan="3">&nbsp;<?php echo $rsrec['note']; ?></td>
</tr>
<?php
}
?>
  </tbody>
</table>

<hr>
      <?php  
	  	if(isset($_SESSION['user_id']))
        { 
		?>
  <section id="contentSection">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="left_content">
          <div class="contact_area">
            <h2>Accept / Reject Certificate</h2>
            <form action="" class="contact_form" method="post" name="frmcourse" onsubmit="return validateform()">
            <input  type="hidden" name="certificate_id" value="<?php echo $_GET['certificate_id']; ?>" >
            Any note<font color='red' size='4'><strong>*</strong></font>:
              <input name="certificatetitle" class="form-control" type="text" placeholder="Enter note *" value="<?php echo $rsrec['note']; ?>">
              <span id="idcoursetitle"></span>
              <br />             
			 Select Verification Status:
              <select name="status" class="form-control">
              <option value="">Select Status</option>
              <?php
			  $arr = array("Accept","Reject");
			  foreach($arr as $val)
			  {
				   if($val == $rsrec['status'])
				   {
				  echo "<option value='$val' selected>$val</option>";
				   }
				   else
				   {
				  echo "<option value='$val'>$val</option>";
				   }
			  }
			  ?>
              </select>
              <br />
              <input name="submit" type="submit" value="Submit">
            </form>
          </div>
        </div>
      </div>
      
    </div>
  </section>
		<?php
		}
		?>
  
    </div>
  </section>
<?php
include("footer.php");
include("datatables.php");
?>
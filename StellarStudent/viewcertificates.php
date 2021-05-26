<?php
include("header.php");
if(isset($_GET['del_certificate_id']))
{
	$sql = "DELETE FROM certificate WHERE certificate_id ='$_GET[del_certificate_id]'";
	$qsql = mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Certificate record deleted successfully..');</script>";
	}
}
?>
  <section id="contentSection">
    <div class="row">
          <h2>View Certificates</h2><br>
          <p>Here you can view all the certificates that you uploaded.</p>
          <p>To upload a new certificate go to "Add new certificate" page.</p>
		        <?php  
	  	if(isset($_SESSION['user_id']))
        { 
		?>
		  <hr>
	<form method="get" action="" >
	<?php
	if(isset($_GET['status']))
	{
	?>
	<input type="hidden" name="status" id="status" value="<?php echo $_GET['status']; ?>" >
    <?php
	}
	?>
	<table border="1" class="table table-striped table-bordered" cellspacing="0" style="width:1100px;">
		<tr>
			<th scope="col">Course
			    <select name="course" id="course" class="form-control"  >
				<option value="">Select Course</option>
              	<?php
				$sqlcourse =  "SELECT * FROM course WHERE status='Active'";
				$qsqlcourse = mysqli_query($con,$sqlcourse);
				while($rscourse = mysqli_fetch_array($qsqlcourse))
				{
					if($rscourse['course_id'] == $_GET['course'])
					{
					echo "<option value='$rscourse[course_id]' selected>$rscourse[course]</option>";
					}
					else
					{					
					echo "<option value='$rscourse[course_id]' ";
					echo ">$rscourse[course]</option>";
					}
				}
				?>
				</select>
			</th>
			
			<th scope="col">Batch
			<input name="batch" id="batch" class="form-control" type="number" placeholder="Enter Year" value="<?php echo $_GET['batch']; ?>" min="1950" max="<?php echo date("Y"); ?>" />
			</th>
			<th scope="col">Certificate Category
			              <select name="certificate_type_id" class="form-control">
              	<option value="">Select Certificate Type</option>
              <?php
				  $sql ="SELECT * FROM certificate_type";
				  $qsql = mysqli_query($con, $sql);
				  echo mysqli_error($con);
				  while($rsrec = mysqli_fetch_array($qsql))
				{
					if($rsrec['certificate_type_id'] == $_GET['certificate_type_id'])
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
			</th>
			<th scope="col"><br><input type="submit" name="submitsearch" value="Search Record" class="btn btn-warning" ></th>
		</tr>
	</table>
	</form>
	<?php
		}
		?>
		  <hr>
            <table border="1" id="example" class="table table-striped table-bordered" cellspacing="0" style="width:1100px;">
            <thead>
  <tr>
    <th scope="col">Student</th>
    <th scope="col">Certificate Type</th>
    <th scope="col">Event name</th>
    <th scope="col">Certificate Date</th>
    <th scope="col">Place</th>
    <th scope="col">Prize Won</th>
    <th scope="col">Status</th>
<?php
 if(isset($_SESSION['student_id']))
		  { 
?>	
    <th scope="col">View</th>
<?php
		  }
if(isset($_SESSION['user_type']))
		  { 
?>
    <th scope="col">Action</th>
<?php
		  }
?>
  </tr>
  </thead>
  <tbody>
  <?php
  $sql="SELECT *, certificate.status as certificatestatus FROM certificate left join student ON certificate.student_id=student.student_id LEFT JOIN course ON student.course_id=course.course_id WHERE certificate.certificate_id!='0' ";
   if(isset($_SESSION['student_id']))
	  {
		$sql = $sql . " AND certificate.student_id='" . $_SESSION['student_id'] . "'";			  
	  }
	  if(isset($_GET['status']))
	  {
		  $sql = $sql . " AND certificate.status='$_GET[status]' ";
	  }
	  if($_GET['course'] != "")
	  {
		  $sql = $sql . " AND student.course_id='$_GET[course]' ";
	  }
	  if($_GET['batch'] != "")
	  {
		  $sql = $sql . " AND student.batch='$_GET[batch]' ";
	  }
	  if($_GET['certificate_type_id'] != "")
	  {
		  $sql = $sql . " AND certificate.certificate_type_id='$_GET[certificate_type_id]' ";
	  }
	  
  $qsql=mysqli_query($con,$sql);
   while($rsrec = mysqli_fetch_array($qsql))
  {
	  $sqlstudent = "SELECT * FROM student WHERE student_id='$rsrec[student_id]'";
	  $qsqlstudent = mysqli_query($con,$sqlstudent);
	  $rsstudent = mysqli_fetch_array($qsqlstudent);
	  $sqlcourse = "SELECT * FROM course WHERE course_id='$rsstudent[course_id]'";
	  $qsqlcourse = mysqli_query($con,$sqlcourse);
	  $rscourse = mysqli_fetch_array($qsqlcourse);
	  $sqlcertificate_type = "SELECT * FROM certificate_type WHERE certificate_type_id='$rsrec[certificate_type_id]'";
	  $qsqlcertificate_type = mysqli_query($con,$sqlcertificate_type);
	  $rscertificate_type = mysqli_fetch_array($qsqlcertificate_type);
    echo "<tr>
    <td>$rsstudent[student_name] ($rsstudent[roll_no])<Br> 
	Batch: $rsstudent[batch]<br>
	Course: $rscourse[course]
	</td>
    <td>&nbsp;$rscertificate_type[certificate_type]</td>
    <td>&nbsp;$rsrec[event_name]</td>
    <td>&nbsp;" . date("d-m-Y",strtotime($rsrec['certificate_date'])) . "</td>
    <td>&nbsp;$rsrec[cerficate_place]</td>
    <td>&nbsp;$rsrec[price_won]</td>";
	if($rsrec['certificatestatus'] == "Accept")
	{
    echo "<td>&nbsp;Verified</td>";
	}
	else if($rsrec['certificatestatus'] == "Reject")
	{
    echo "<td>&nbsp;" . $rsrec['certificatestatus'] . "ed</td>";
	}
	else
	{
    echo "<td>&nbsp;" . $rsrec['certificatestatus'] . "</td>";
	}
		if(isset($_SESSION['student_id']))
		  { 
				if($rsrec['status'] == "Pending")
				{
					echo "<td>&nbsp;<button type='button' class='btn btn-warning' onclick='alert(`You cannot view this certificate. This certificate not verified yet.`);'>Not Verified yet</button></td>";
				}
				else if($rsrec['status'] == "Reject")
				{
					echo "<td><b style='color: red;'>" . $rsrec['status'] ."ed</b>&nbsp;<br>" . $rsrec['note'] ." </td>";
				}
				else 
				{
					echo "<td>&nbsp;<a href='displaycertificate.php?certificate_id=$rsrec[0]' class='btn btn-info' >View</a></td>";
				}	
		  }
	if(isset($_SESSION['user_type']))
	{
		if($rsrec['status'] == "Pending" || $rsrec['status'] == "Rejected")
		{
			echo "<td>&nbsp;<a href='displaycertificate.php?certificate_id=$rsrec[0]' class='btn btn-info' >Verify</a> | <a href='viewcertificates.php?del_certificate_id=$rsrec[0]' onclick='return deleteconfirm()' class='btn btn-danger' >Delete</a></td>";
		}
		else
		{
			echo "<td>&nbsp;<a href='displaycertificate.php?certificate_id=$rsrec[0]' class='btn btn-info' >View</a></td>";
		}
	}
    echo "</tr>";
  }
  ?>
  </tbody>
</table>
    </div>
  </section>
 <?php
 include("footer.php")
 ?>
  <script type="application/javascript">
function deleteconfirm()
{
	if(confirm("Are you sure want to delete this record?") == true)
	{
		return true;
	}
	else
	{
		return false;
	}
}
 </script>
 <?php
 include("datatables.php");
 ?>
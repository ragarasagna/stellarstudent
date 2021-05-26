<?php
include("header.php");
if(!isset($_SESSION['user_id']))
{
	echo "<script>window.location='userlogin.php';</script>";
}
if(isset($_GET['st']))
{
	$sql = "UPDATE student SET status='" . $_GET['st'] . "' WHERE student_id='" . $_GET['student_id'] . "'";
	$qsql = mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		//##############################################
		if($_GET['st'] == "Active")
		{
			$sql = "SELECT * FROM student WHERE student_id='" . $_GET['student_id'] . "'";
			$qsql = mysqli_query($con,$sql);
			if(!$qsql)
			{
				echo mysqli_error($con);
			}
			if(mysqli_num_rows($qsql) == 1)
			{
				$rs = mysqli_fetch_array($qsql);
				$_SESSION['sessionid'] = rand(11111111,99999999);
				include("sendmail.php");
				$msgq = "<b>Hello $rs[student_name], </b><br><br>
				Thanks for registering in StellarStudent. The registered Roll number is : $rs[roll_no]<br><br>
				This Email notifies that your account has been Activated successfully..<br><br>
				<b>Best Regards,<br>
				- StellarStudent</b>";
				sendmail($rs['email_id'],"Account Activation Mail..",$msgq,$rs['student_name']);
				//$msg =  "<p><font color='green'><strong>Kindly check your mail to recover password...</strong></font></ p>";
				//echo '<script>alert("Mail sent...");</script>';
			}
			else
			{
				$msg =  "<p><font color='red'><strong>Invalid Login credentials entered...</strong></font></ p>";
			}
		}
		//##############################################
		echo "<script>alert('Student Account " . $_GET['st'] . "d successfully..');</script>";
		echo "<script>window.location='viewstudentprofile.php';</script>";
	}
}
if(isset($_GET['delid']))
{
	$sqltimeline = "SELECT * FROM timeline WHERE student_id='$_GET[delid]'";
    $qsqltimeline = mysqli_query($con,$sqltimeline);
    $rstimeline = mysqli_fetch_array($qsqltimeline);
	
	$sqltimelinecm = "SELECT * FROM timeline_comments WHERE student_id='$_GET[delid]'";
    $qsqltimelinecm = mysqli_query($con,$sqltimelinecm);
    $rstimelinecm = mysqli_fetch_array($qsqltimelinecm);
	
	$sqldiscussion = "SELECT * FROM discussion WHERE student_id='$_GET[delid]'";
    $qsqldiscussion = mysqli_query($con,$sqldiscussion);
    $rsdiscussion = mysqli_fetch_array($qsqldiscussion);
	
	$sqldiscussionreply = "SELECT * FROM discussion_reply WHERE student_id='$_GET[delid]'";
    $qsqldiscussionreply = mysqli_query($con,$sqldiscussionreply);
    $rsdiscussionreply = mysqli_fetch_array($qsqldiscussionreply);
	
	$sqlquizresult = "SELECT * FROM quiz_result WHERE student_id='$_GET[delid]'";
    $qsqlquizresult = mysqli_query($con,$sqlquizresult);
    $rsquizresult = mysqli_fetch_array($qsqlquizresult);
	
	$sql = "DELETE FROM student WHERE student_id='$_GET[delid]'";
	$qsql = mysqli_query($con,$sql);
	
		$sqli="DELETE FROM timeline WHERE student_id='$rstimeline[student_id]'";
		$qsqli= mysqli_query($con,$sqli);
		
		$sqlicm="DELETE FROM timeline_comments WHERE student_id='$rstimelinecm[student_id]'";
		$qsqlicm= mysqli_query($con,$sqlicm);
		
		$sqlidiscussion="DELETE FROM discussion WHERE student_id='$rsdiscussion[student_id]'";
		$qsqlidiscussion= mysqli_query($con,$sqlidiscussion);
		
     	$sqlidiscussionreply="DELETE FROM discussion_reply WHERE student_id='$rsdiscussionreply[student_id]'";
		$qsqlidiscussionreply= mysqli_query($con,$sqlidiscussionreply);
		
		$sqliquizresult="DELETE FROM quiz_result WHERE student_id='$rsquizresult[student_id]'";
		$qsqliquizresult= mysqli_query($con,$sqliquizresult);
	    
	 if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Student record deleted successfully..');</script>";
		echo "<script>window.location='viewstudentprofile.php';</script>";
	}
	
}

if(isset($_POST['btndelete']))
{
	$strec =$_POST['check'];
	for($i=0; $i < count($strec); $i++)
	{
			$sql = "DELETE FROM student WHERE student_id='$strec[$i]'";
			$qsql = mysqli_query($con,$sql);
	}
	echo "<script>alert('Student records deleted successfully..');</script>";
		echo "<script>window.location='viewstudentprofile.php';</script>";
}
?>
  <section id="contentSection">
    <div class="row">
            <h2>View Student</h2><br>
            <p>View all the students details.</p>
<?php
/*
<form action="" class="contact_form" method="get" name="frmstudent">
<div class="row">
  <div class="col-sm-4"><select name="semester" class="form-control" onChange="" >
                  <option value="">Select semester</option>
                  <?php
                  $arr = array("First Semester","Second Semester","Third Semester","Fourth Semester","Fifth Semester","Sixth Semester");
                  foreach($arr as $val)
                  {
                       if($val == $_GET['semester'])
                       {
                            echo "<option value='$val' selected>$val</option>";
                       }
                       else
                       {
                            echo "<option value='$val' >$val</option>";
                       }
                  }
                  ?>
               </select></div>
  <div class="col-sm-8"><input type="submit" name="btnsemester" value="Select semester" ></div>
</div>      
</form>
<hr>
*/
?>
<form action="" class="contact_form" method="post" name="frmstudent">            

            <table border="1" border="1" id="example" class="table table-striped table-bordered" cellspacing="0" style="width:100%;">
    <thead>        
  <tr>
    <th scope="col"><input type="checkbox" name="select_all" id="select_all" onClick="checkall()"></th>
    <th scope="col">Image</th>
    <th scope="col">Student Name</th>
    <th scope="col">Batch</th>
    <th scope="col">Roll No</th>
    <th scope="col">Course</th>
    <th scope="col">Contact details</th>
    <th scope="col">Status</th>
    <th scope="col" style='width: 75px;'>Action</th>
  </tr>
  </thead>
  <tbody>
  <?php  
	$sql ="SELECT * FROM student WHERE student_id!='0' ";
	  if(isset($_GET['semester']))
	  {
		  $sql = $sql . " AND semester='$_GET[semester]'";
	  }
	  if(isset($_GET['st']))
	  {
		  $sql = $sql . " AND status='" . $_GET['st'] . "'";
	  }
	$qsql = mysqli_query($con, $sql);
	echo mysqli_error($con);
	while($rsrec = mysqli_fetch_array($qsql))
	{
	$sqlcourse = "SELECT * FROM course WHERE course_id='" . $rsrec['course_id'] ."'";
	$qsqlcourse = mysqli_query($con,$sqlcourse);
	$rscourse = mysqli_fetch_array($qsqlcourse);
    echo "<tr>
    <td>&nbsp;<input type='checkbox' class='checkbox' name='check[]' value='$rsrec[0]'></td>
    <td>&nbsp;<img src='studentimages/$rsrec[student_img]' style='width: 70px; height: 75px;' ></td>
    <td>$rsrec[student_name]
	<br>
	<button type='button' onclick='alert(`" . $rsrec['about_student'] ."`);'><i class='fa fa-eye' aria-hidden='true'></i> About</button>
	</td>
    <td>&nbsp;$rsrec[batch]</td>
    <td>&nbsp;$rsrec[roll_no]</td>
    <td>&nbsp;$rscourse[course] </td>
    <td>&nbsp;<i class='fa fa-envelope-o' aria-hidden='true'></i> $rsrec[email_id] <br>&nbsp;<i class='fa fa-phone-square' aria-hidden='true'></i> $rsrec[mob_no]</td>
    <td>&nbsp;$rsrec[status]<br>";
	if($rsrec['status'] == "Active")
	{
	echo "<a href='viewstudentprofile.php?student_id=$rsrec[student_id]&st=Inactive' onclick='return statusconfirm()'  class='btn btn-warning' >Deactivate</a>";
	}
	else
	{
	echo "<a href='viewstudentprofile.php?student_id=$rsrec[student_id]&st=Active' onclick='return statusconfirm()'  class='btn btn-success' >Activate</a>";
	}
	echo "</td>
	<td><a href='addstudentprofile.php?editid=$rsrec[student_id]' class='btn btn-info' style='width: 75px;' >Edit</a><br><a href='viewstudentprofile.php?delid=$rsrec[student_id]' onclick='return deleteconfirm()'  style='width: 75px;' class='btn btn-danger' >Delete</a></td>
  </tr>";
  }
  ?>
  </tbody>
</table>
<hr>

<div class="row">
  <div class="col-sm-4"><input type="submit" name="btndelete" value="Delete Record" ></div>
  <div class="col-sm-6"></div>
  <div class="col-sm-2"></div>
</div>
<br><br>
</form>
    </div>
  </section>
 <?php
 include("footer.php")
 ?>
  <script type="application/javascript">
function statusconfirm()
{
	if(confirm("Are you sure want to change the status?") == true)
	{
		return true;
	}
	else
	{
		return false;
	}
}
 </script>
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
<script type="application/javascript">
function checkall()
{
	var select_all = document.getElementById("select_all"); //select all checkbox
	var checkboxes = document.getElementsByClassName("checkbox"); //checkbox items
	
	//select all checkboxes
	select_all.addEventListener("change", function(e){
		for (i = 0; i < checkboxes.length; i++) { 
			checkboxes[i].checked = select_all.checked;
		}
	});
	
	
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].addEventListener('change', function(e){ //".checkbox" change 
			//uncheck "select all", if one of the listed checkbox item is unchecked
			if(this.checked == false){
				select_all.checked = false;
			}
			//check "select all" if all checkbox items are checked
			if(document.querySelectorAll('.checkbox:checked').length == checkboxes.length){
				select_all.checked = true;
			}
		});
	}
}
 </script>
 <?php
 include("datatables.php");
 ?>
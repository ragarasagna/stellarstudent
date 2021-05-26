<?php
include("header.php");
if(isset($_GET['delid']))
{
  $sql = "DELETE FROM study_material WHERE study_material_id='$_GET[delid]'";
  $qsql = mysqli_query($con,$sql);
  if(mysqli_affected_rows($con) == 1)
  {
    echo "<script>alert('Study Material record deleted successfully..');</script>";
  }
}
?>
  <section id="contentSection">
    <div class="row">
           <h2>View Study Material</h2><br>
            <p>View all uploaded study meterials.</p>
            <table border="1" id="example" class="table table-striped table-bordered" cellspacing="0" style="width:100%;">
  <thead>
  <tr>
    <th scope="col">Course</th>
    <th scope="col">Subject</th>
    <th scope="col">User</th>
    <th scope="col">Description</th>
    <th scope="col">Date Time</th>
    <th scope="col">Study material</th>
    <th scope="col">Action</th>
  </tr>
  </thead>
  <tbody>
  <?php  
  $sql ="SELECT * FROM study_material";
  $qsql = mysqli_query($con, $sql);
   while($rsrec = mysqli_fetch_array($qsql))
  {
    $sqluser = "SELECT * FROM user WHERE user_id='$rsrec[user_id]'";
    $qsqluser = mysqli_query($con,$sqluser);
    $rsuser = mysqli_fetch_array($qsqluser);
      $sqlcourse = "SELECT * FROM course WHERE course_id='$rsrec[course_id]'";
    $qsqlcourse = mysqli_query($con,$sqlcourse);
    $rscourse = mysqli_fetch_array($qsqlcourse);
      $sqlsubject = "SELECT * FROM subject WHERE subject_id='$rsrec[subject_id]'";
    $qsqlsubject = mysqli_query($con,$sqlsubject);
    $rssubject= mysqli_fetch_array($qsqlsubject);
    echo "<tr>
    <td>&nbsp;$rscourse[course]</td>
    <td>&nbsp;$rssubject[subject]</td>
    <td>&nbsp;$rsuser[name]</td>
    <td>&nbsp;<b>$rsrec[title]</b><br>$rsrec[description]</td>
    
  <td>&nbsp; " . date("d-m-Y h:i",strtotime($rsrec['date_time'])) . "</td>
    <td>&nbsp;<a href='studymaterialimages/$rsrec[uploads]' download><img src='images/download.png' width='100'></img></a></td>
    <td>&nbsp;<a href='studymaterial.php?editid=$rsrec[study_material_id]' class='btn btn-info' >Edit</a><br><a href='viewstudymaterial.php?delid=$rsrec[study_material_id]' onclick='return deleteconfirm()' class='btn btn-danger' >Delete</a></td>
    </tr>";
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
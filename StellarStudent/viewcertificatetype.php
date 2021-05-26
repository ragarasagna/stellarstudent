<?php
include("header.php");
if(isset($_GET['delid']))
{
	$sql = "DELETE FROM certificate_type WHERE certificate_type_id='$_GET[delid]'";
	$qsql = mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Certificate Type  deleted successfully..');</script>";
	}
}
?>
  <section id="contentSection">
    <div class="row">
            <h2>View Certificate Type</h2><br>
            <p>View existing Certificate Types.</p>
            <p>To add new certificate type, go to "Add Certificate Type" page.</p>
<table border="1" id="example" class="table table-striped table-bordered" cellspacing="0" style="width:1100px;" >
<thead>
  <tr>
    <th width="49" scope="col">Certificate Type</th>
    <th width="94" scope="col">Certificate Type description </th>
    <th width="144" scope="col">Action</th>
  </tr>
  </thead>
  <tbody>
<?php  
  $sql ="SELECT * FROM certificate_type";
  $qsql = mysqli_query($con, $sql);
  echo mysqli_error($con);
  while($rsrec = mysqli_fetch_array($qsql))
  {
  echo "<tr>
    <td>&nbsp;$rsrec[certificate_type]</td>
    <td>&nbsp;$rsrec[certificate_type_note]</td>
    <td>&nbsp;<a href='certificatetype.php?editid=$rsrec[0]' class='btn btn-info' >Edit</a> | <a href='viewcertificatetype.php?delid=$rsrec[0]' onclick='return deleteconfirm()' class='btn btn-danger' >Delete</a></td>
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
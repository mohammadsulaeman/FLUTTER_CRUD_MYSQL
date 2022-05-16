<?php
include 'conn.php';

$queryResult = $connect->query("SELECT * FROM tb_item");

$result=array();
while($fetchDataResult = $queryResult->fetch_assoc()){
    $result[] = $fetchDataResult;
}
echo json_encode($result);
?>
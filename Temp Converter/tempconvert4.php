<!--tempconvert.php-->
<!DOCTYPE html>
<html> 
<head>
<title>Temperature Converter</title>
</head>
    
<body> 
<style>
  
    h2 {
    color:#2F4F4F;   
    font-family: cursive;
    }    
    
</style>
    
    
<h2>Let's Convert the Temperature</h2>

<form action = "<?php echo htmlspecialchars ($_SERVER['PHP_SELF']); ?>"
method="post"> 
<input type="text" name="temperature">
<span class ="error"> <?php echo $tempErr;?></span>
<input type = "submit" name = "submit" value="Temperature Converter"> 
 </form> 
 <br/><br/>
<!--    
<form action = "<?php echo $_SERVER['PHP_SELF']; ?>"
method="post">
<input type="text" name="temperature2">
<input type = "submit" name = "submit" value="Fahrenheit Converter"> 
 </form>    

    
<form action = "<?php echo $_SERVER['PHP_SELF']; ?>"
method="post">
<input type="text" name="temperature3">
<input type = "submit" name = "submit" value="Kelvin Converter"> 
 </form>  -->

<?php 
 /*  
$tempErr = "";
$temp = "";
 
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
    if (empty($_POST["temperature"])) {
        $tempErr = "Numeric entry required"; 
} else {
        $temp = test_input($_POST["temperature"]);
        }
} */
 
    

    
 if(isset($_POST['submit'])){
     
     $celcius = $_POST['temperature'];
     $fahrenheit = ($celcius * 1.8) + 32;
     $kelvin = $celcius + 273.15;
     echo "<div style ='font:16px Arial; color:#8B008B'>$celcius Celcius is $fahrenheit Fahrenheit <br/>";
     echo "<div style ='font:16px Arial; color:#8B008B'>$celcius Celcius is  $kelvin Kelvin<br/><br/>";
 }

        
 if(isset($_POST['submit'])){ 
     
/*  $format = number_format($fahrenheit, 2, '.', '');   
  $format = number_format($celcius, 2, '.', '');  
  $format = number_format($kelvin, 2, '.', '');  */
     
     $fahrenheit = $_POST['temperature'];
     $celcius = ($fahrenheit - 32) / 1.8;
     $kelvin = (($fahrenheit - 32)/1.8 )+ 273.15;
     echo "<div style ='font:16px Arial; color:#2F4F4F'>$fahrenheit Fahrenheit is  $celcius Celcius <br/>";
     echo "<div style ='font:16px Arial; color:#2F4F4F'>$fahrenheit Fahrenheit is  $kelvin Kelvin <br/><br/>";
     
    // echo $format;
 }
 
 if(isset($_POST['submit'])){
     
     $kelvin = $_POST['temperature'];
     $celcius = $kelvin - 273.15;
     $fahrenheit = (($kelvin - 273.15) * 1.8 )+ 32;
     echo "<div style ='font:16px Arial; color:#8B0000'>$kelvin Kelvin is  $celcius Celcius <br/>";
     echo "<div style ='font:16px Arial; color:#8B0000'>$kelvin Kelvin is  $fahrenheit Fahrenheit ";
     
  
 }    
   

    
?>    
    
 </body>   
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" href="style/guestmaster.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<link href="style/bootstrap.css" type="text/css" rel="stylesheet"/>
<style>
    #btn
    {
        font-family: cursive;
        font-size: 20px;
        
    }
</style>
</head>

<body>



<div id="main">
<div id="wrapper">
	<div id="banner">
    	<img class="strip_img" src="images/922671.jpg" width="1000" height="200" />
    </div>
    <div  id="menu">
    
    	<!-- Start css3menu.com BODY section -->
        
        <script type="text/javascript">
function find_book(str)
{
	var xmlhttp;
	if (str.length==0)
  	{ 
  		document.getElementById("s1").innerHTML="";
  		return;
  	}
	if (window.XMLHttpRequest)
  	{// code for IE7+, Firefox, Chrome, Opera, Safari
  		xmlhttp=new XMLHttpRequest();
  	}
	else
  	{// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    		{
    				document.getElementById("s1").innerHTML=xmlhttp.responseText;
    		}
  	}
	xmlhttp.open("GET","search_book.jsp?q="+str,true);
        
	xmlhttp.send();
}
</script>

        
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="index.jsp" style="height:32px;line-height:32px;"><img src="styles/home.png" alt=""/>Home</a></li>
	<li class="topmenu"><a href="About.jsp" style="height:32px;line-height:32px;">About</a></li>
	
	<li class="topmenu"><a href="Contact.jsp" style="height:32px;line-height:32px;">Contact</a></li>      
    <li class="topmenu"><a href="UserReg.jsp" style="height:32px;line-height:32px;">Sign Up</a></li>
    
    <li class="topmenu"><a href="LoginForm.jsp" style="height:32px;line-height:32px;">Sign In</a></li>
   
</ul>
    </div>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="kota" -->
        
        	<h1>Welcome to Book Store</h1>
                <img class="strip_img" src="images/blue_strip.jpg" width="600" height="4" />
               <!-- <img class="strip_img" src="images/Argosy-Cropped.avif" width="770" height="400" style="position: inherit;" /> -->
               <input type="text" onkeyup="find_book(this.value)" value="Search Book"style="height:32px;line-height:32px; margin-left: 15px; margin-top: 25px;"></input>
        <p> <span id="s1"></span></p></li>
               <!-- InstanceEndEditable -->        
        </div><!-- end of content -->
        <div id="ad">
        	<img src="images/ad2.jpg" width="190" height="200"  />
                
        </div> <!-- end of ad div -->
    </div> <!-- End of middle -->
    <div id="bottom">
        
    </div>
</div>
</div>


</body>
<!-- InstanceEnd --></html>

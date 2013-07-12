<?php
require("facebook.php");   
class User
{
	var $username;
	var $password;
	var $email_id;
	var $facebook_token;
	var $twitter_token;

	function register_via_username($pass,$email)
	{
        
        $this->password=md5($pass);
        $this->email_id=$email;

	}
	function register_via_facebook($app_id,$app_secret)
	{
         # We require the library  

    # Creating the facebook object  
    $facebook = new Facebook(array(  
        'appId'  => $app_id,  
        'secret' => $app_secret,  
        'cookie' => true  
    ));  
      
    # Let's see if we have an active session 
    //$session = $facebook->getSession(); 
     
    if(!empty($session)) { 
        # Active session, let's try getting the user id (getUser()) and user info (api->('/me'))  
        try{  
            $uid = $facebook->getUser();  
            $user = $facebook->api('/me');  
        } catch (Exception $e){}  
      
        if(!empty($user)){  
            # User info ok? Let's print it (Here we will be adding the login and registering routines) 
            print_r($user); 
        } else { 
            # For testing purposes, if there was an error, let's kill the script  
            die("There was an error.");  
        }  
    } else {  
        # There's no active session, let's generate one  
        $login_url = $facebook->getLoginUrl();  
        header("Location: ".$login_url);  
    }  
	}
	function register_via_twitter($twitter)
	{
		$this->twitter_token=$twitter;
		//then dump these values in database
	}
	function login_via_username($email,$pass,$dbh)
	{
       $this->email_id=$email;
       $this->password=md5($pass); 
       $query="SELECT `email_id`,`password` FROM `user` WHERE `email_id`='$this->email_id' AND `password`='$this->password';";
       $stmt=$dbh->prepare($query);
       $stmt->execute();
       $rslt=$stmt->fetch(PDO::FETCH_ASSOC);
       if(empty($rslt))
       {
       	echo "Login Failed";
       }
       else
       {
       	echo "Login Successful";
       }

    }
	function login_via_facebook($face)
	{
		//check against database
	}
	function login_via_twitter()
	{
		//check against database
	}  
}

?>
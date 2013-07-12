<?php
require_once('user.php');
require_once('index.php');
$conn = new PDO("$dbtype:host=$hostname;dbname=$dbname", $username, $password);

class Employer extends User
{
	var $company_name;
	var $address;
	var $phone_number;
    public $internships;

    function register_via_username1($pass,$email,$com,$add,$num,$dbh)
    {
        parent::register_via_username($pass,$email);
        $this->company_name=$com;
        $this->address=$add;
        $this->phone_number=$num;
        $query="SELECT `email_id` FROM `user` WHERE `email_id`='$email';";
        $stmt=$dbh->prepare($query);
        $stmt->execute();
        $rslt=$stmt->fetch(PDO::FETCH_ASSOC);
        if(empty($rslt))
        {
            $query1="INSERT INTO `user` (`email_id`,`password`,`status`) VALUES ('$this->email_id','$this->password','emp');";
            $stmt1 = $dbh->prepare($query1);
            $stmt1->execute();
            $query2="INSERT INTO `employer` (`status`,`company_name`,`address`,`phone_num`) VALUES ('emp','$this->company_name','$this->address','$this->phone_number');";
            $stmt2 = $dbh->prepare($query2);
            $stmt2->execute();
            echo "Successful Registration";
        }
        else
        {
            echo "The email id already exists";
        }
    }
    public function _construct()
    {
    	$internships=array();
    	//load up the internships from the database
    }
   
	function create_internship($comp,$add,$phone)
	{
        $this->company_name=$comp;
        $this->address=$add;
        $this->phone_number=$phone;
        //store in database

	}
}

$a=new Employer();
//uncomment the line below for register
//$a->register_via_username1("dave","a@a.com","micro","a/b4-5","123456",$conn);
//$a->login_via_username("a@a.com","dave",$conn);
$a->register_via_facebook($app_id,$app_secret);
?>
<?php
class User_model extends CI_Model{
	public function user_login($username, $password){
		$query = $this->db->get_where("customers", array('username'=>$username,'passw'=>md5($password)), 1);
		if($query->num_rows()==1){ // Username ditemukan
			return ($query->row());
		} else{
			return false;
		}
	}
}

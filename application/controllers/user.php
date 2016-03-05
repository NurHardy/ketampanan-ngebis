<?php
class User extends CI_Controller{
	public function index()
	{
		if($this->session->userdata['username']){ // Sudah login?
			redirect("user/home");
		} else{ // Belum login?
			redirect("user/get_user_login");
		}
	}
	public function get_user_login(){
	    // Jika user sudah login maka langsung diredirect ke home.
	    if($this->session->userdata('username')){
			redirect("user/home");
			return;
	    }
		$data['pageTitle'] = "Login";
		
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		
		if (!empty($username) && !empty($password)) {
			$this->load->model('user_model');
			$hasil = $this->user_model->user_login($username,$password);
			
			//if($hasil==true){
			if($hasil){ // Row ditemukan...
				$this->session->set_userdata('username',$hasil->username);
				$this->session->set_userdata('fullname',$hasil->name);
				redirect("user/home");
				return;
			} else { // Row tidak ditemukan....
				$data['kesalahan'] = "Username/password salah.";
			}
		}
		$this->load->view('form_login', $data); // Tampilkan form login
	}
	public function user_logout(){
		$this->session->unset_userdata('username');
		redirect('user/get_user_login');
	}
	
	//=========== Area Login =========================
	public function home(){
	    // Nah ini... Perlu dicek sessionnya
	    if(!$this->session->userdata['username']){ // Belum Login?
	        redirect("user/get_user_login");
	        return;
	    }
		
		$data['loggedInFullname'] = $this->session->userdata('fullname');
		$this->load->view('user_home', $data); // Ini adalah area login
	}
	//===============================================
}
?>
<?php
class Manage_tipe_bus extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	
	public function daftar_kendaraan(){
		$crud = new grocery_CRUD();
	
		$crud->set_table('tbl_montor')
		->where('companyId', $this->session->userdata('companyId'))
		->set_subject("Daftar Bus")
		->unset_print()
		->unset_export()
		->columns("companyId", "licenseNumber", "image", 'vehicleTypeId', 'busFasilities', 'position')
		->fields("licenseNumber", "image", 'vehicleTypeId', 'busFasilities')
		->field_type("licenseNumber", "string")
		->field_type("vehicleTypeId", "dropdown")
		->display_as("companyId", "Nama Perusahaan")
		->display_as("licenseNumber", "Nomor Kendaraan")
		->display_as("image", "Gambar")
		->display_as("vehicleTypeId", "Tipe Kendaraan")
		->display_as("busFasilities", "Fasilitas Kendaraan")
		->display_as("position", "Posisi")
		->set_field_upload('image', 'assets/uploads/images/')
		->required_fields('licenseNumber', 'vehicleTypeId', 'busFasilities')
		->set_relation('companyId','tbl_autobuscompany','companyName')
		->set_relation('vehicleTypeId','tbl_tipe_montor','name');
	
		$output = $crud->render();
	}
}
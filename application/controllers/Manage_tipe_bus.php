<?php
class Manage_tipe_bus extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	
	public function daftar_tipe(){
		$crud = new grocery_CRUD();
		
		$crud->set_table('tabel_berita')
		->where('companyId', $this->session->userdata('companyId'))
		->set_subject("Tipe Bus")
		->unset_print()
		->unset_export()
		->columns("companyId", "name", "seatsId")
		->fields("name", "seatsId")
		->field_type("name", "string")
		->field_type("seatsId", "dropdown")
		->display_as("name", "Nama Tipe")
		->display_as("companyId", "Nama Perusahaan")
		->display_as("seatsId", "Tipe Tempat Duduk")
		->required_fields('name', 'seatsId')
		->set_relation('seatsId','tbl_lungguhan','seatsId')
		->set_relation('companyId','tbl_autobuscompany','companyName');
		
		// Callback
		$crud->callback_add_field('seatsId', array($this, '_callback_seats'))
		->callback_edit_field('seatsId', array($this, '_callback_seats'));
		
		$output = $crud->render();
	}
	
	public function _callback_seats(){
		$this->load->model('lungguhan_model');
		
		$data = $this->lungguhan_model->getLungguhan('seatsId', '', 'seatsId');
		$hasil ='<select name="seatsId">';
		foreach($data as $row)
		{
			$hasil .='<option value="'.$row->seatsId.'">'.$row->seatsId.'</option>';
		}
		return $hasil.'</select>';
	}
}
<?php
class Lungguhan_model extends CI_Model{
	public function getLungguhan($field = '*', $cond = '', $group = ''){
		$this->db->select($field);
		$this->db->from('tbl_lungguhan');
		if(!empty($cond)) $this->db->where($cond);
		if(!empty($group)) $this->db->group_by($group);
		return $this->db->get()->result();
	}
}
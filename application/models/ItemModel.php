<?php
class ItemModel extends CI_Model{
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
    public function listall(){
        $query=$this->db->get("item");
        return $query->result_array();
    }
}
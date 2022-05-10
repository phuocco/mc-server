<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Detail extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_all_item_comment(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_all_item_comment(?,?)";
        $result = $this->db->query($query, array('p_item_id'=>$item_id,'p_limit_count' => $limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function create_item_comment(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $user_id = $this->input->post('user_id');
        $message = $this->input->post('message');
        $query = "CALL create_item_comment(?,?,?)";
        $result = $this->db->query($query, array('p_item_id'=>$item_id,'p_user_id' => $user_id,'p_message'=>$message));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function like_comment(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $comment_id = $this->input->post('comment_id');
        $query = "CALL like_comment(?,?)";
        $result = $this->db->query($query, array('p_user_id' => $user_id,'p_comment_id'=>$comment_id));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function download_item(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $query = "CALL download_item(?)";
        $result = $this->db->query($query, array('p_item_id' => $item_id));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function report_corrupted_item(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $query = "CALL report_corrupted_item(?)";
        $result = $this->db->query($query, array('p_item_id' => $item_id));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
        public function get_related_items(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_related_item(?,?)";
        $result = $this->db->query($query, array('p_item_id' => $item_id,'p_limit_amount'=>$limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
        public function buy_item(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $user_id = $this->input->post('user_id');
        $query = "CALL buy_item(?,?)";
        $result = $this->db->query($query, array('p_user_id'=>$user_id,'p_item_id' => $item_id));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
        public function get_unlocked_items(){
                $this->load->database();
        $user_id = $this->input->post('user_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_unlocked_items(?,?)";
        $result = $this->db->query($query, array('p_user_id'=>$user_id,'p_limit_amount' => $limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function check_unlock(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $item_id = $this->input->post('item_id');
        $query = "CALL check_unlock_item(?,?)";
        $result = $this->db->query($query, array('p_user_id'=>$user_id,'p_item_id' => $item_id));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
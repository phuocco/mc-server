<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class News extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function create_news_comment(){
          $this->load->database();            
            $news_id = $this->input->post('news_id');
            $user_id = $this->input->post('user_id');
            $comment_message = $this->input->post('comment_message');
            $query = "CALL create_news_comment(?,?,?)";
            $result = $this->db->query($query, array('p_news_id'=>$news_id,'p_user_id' => $user_id,'p_comment_message'=> $comment_message));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function get_news_comment(){
        $this->load->database();            
            $news_id = $this->input->post('news_id');
            $limit_amount = $this->input->post('limit_amount');
            $query = "CALL get_news_comment(?,?)";
            $result = $this->db->query($query, array('p_news_id'=>$news_id,'p_limit_amount'=>$limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
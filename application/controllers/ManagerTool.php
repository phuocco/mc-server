<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class ManagerTool extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function admin_authentication(){
          $this->load->database();            
            $username = $this->input->post('username');
            $password = $this->input->post('password');
           
            $query = "CALL admin_authentication(?,?)";
            $result = $this->db->query($query, array('p_username'=>$username,'p_password' => $password));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    
    public function add_new_upload_item(){
            $this->load->database();
            $type_id = $this->input->post('type_id');
            $category_id = $this->input->post('category_id');
            $item_name = $this->input->post('item_name');
            $file_url = $this->input->post('file_url');
            $image_url = $this->input->post('image_url');
            $thumb_url = $this->input->post('thumb_url');
            $author_name = $this->input->post('author_name');
            $version = $this->input->post('version');
            $size = $this->input->post('size');
            $description = $this->input->post('description');
            $html_description = $this->input->post('html_description');
            $short_description = $this->input->post('short_description');
            
            $hot_priority = $this->input->post('hot_priority');
            $video_code = $this->input->post('video_code');
            $download_count = $this->input->post('download_count');
            $is_verify = $this->input->post('is_verify');
            $price = $this->input->post('price');
            
            $query = "CALL add_new_upload_item(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $result = $this->db->query($query,array('p_type_id'=> $type_id,'p_category_id'=> $category_id,'p_item_name'=> $item_name,'p_file_url'=> $file_url,'p_image_url'=> $image_url,'p_thumb_url'=> $thumb_url,'p_author_name'=> $author_name,'p_version'=> $version,'p_size'=> $size,'p_description'=> $description,'p_html_description'=> $html_description,'p_short_description'=> $short_description,'p_hot_priority'=> $hot_priority,'p_video_code'=> $video_code,'p_download_count'=> $download_count,'p_is_verify'=> $is_verify,'p_price'=> $price));
              echo json_encode($result->result_array());
             $this->db->close();
   }
   
   public function get_all_categories(){
        $this->load->database();
         
        $query = "CALL get_all_categories()";
        $result = $this->db->query($query);
        echo json_encode($result->result_array());
        $this->db->close();
   }
   
   public function get_all_item_type(){
        $this->load->database();
          
        $query = "CALL get_all_item_type()";
        $result = $this->db->query($query);
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
    public function update_upload_item(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $type_id = $this->input->post('type_id');
        $category_id = $this->input->post('category_id');
        $item_name = $this->input->post('item_name');
        $file_url = $this->input->post('file_url');
        $image_url = $this->input->post('image_url');
        $thumb_url = $this->input->post('thumb_url');
        $author_name = $this->input->post('author_name');
        $version = $this->input->post('version');
        $size = $this->input->post('size');
        $description = $this->input->post('description');
        $html_description = $this->input->post('html_description');
        $short_description = $this->input->post('short_description');
        $hot_priority = $this->input->post('hot_priority');
        $video_code = $this->input->post('video_code');
        $download_count = $this->input->post('download_count');
        $price = $this->input->post('price');
        
        $query = "CALL update_upload_item(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $result = $this->db->query($query,array('p_item_id'=> $item_id,'p_type_id'=> $type_id,'p_category_id'=> $category_id,'p_item_name'=> $item_name,'p_file_url'=> $file_url,'p_image_url'=> $image_url,'p_thumb_url'=> $thumb_url,'p_author_name'=> $author_name,'p_version'=> $version,'p_size'=> $size,'p_description'=> $description,'p_html_description'=> $html_description,'p_short_description'=> $short_description,'p_hot_priority'=> $hot_priority,'p_video_code'=> $video_code,'p_download_count'=> $download_count,'p_price'=> $price));
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
    public function get_all_upload_item(){
        $this->load->database();
        $start_datetime = $this->input->post('start_datetime');
        $end_datetime = $this->input->post('end_datetime');
        
        $query = "CALL get_all_upload_item(?,?)";
        $result = $this->db->query($query,array('p_start_datetime'=> $start_datetime,'p_end_datetime'=> $end_datetime));
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
    public function verify_upload_item(){
        $this->load->database();
        $upload_item_id = $this->input->post('upload_item_id');
        
        $query = "CALL verify_upload_item(?)";
        $result = $this->db->query($query,array('p_upload_item_id'=> $upload_item_id));
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
     public function get_item_by_id(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        
        $query = "CALL get_item_by_id(?)";
        $result = $this->db->query($query,array('p_item_id'=> $item_id));
        echo json_encode($result->result_array());
        $this->db->close();
    }

    
    public function delete_upload_item(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        
        $query = "CALL delete_upload_item(?)";
        $result = $this->db->query($query,array('p_item_id'=> $item_id));
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
    public function get_admin_role(){
        $this->load->database();
        $user_name = $this->input->post('user_name');
        
        $query = "CALL get_admin_role(?)";
        $result = $this->db->query($query,array('p_user_name'=> $user_name));
        echo json_encode($result->result_array());
        $this->db->close();
    }
    
}
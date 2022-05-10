<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Spin extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}
        public function do_spin()
        {
            $user_id = $this->input->post('user_id');
            $this->load->database();    
            $query = "CALL do_spin(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function reset_spin_datetime(){
            $user_id = $this->input->post('user_id');
            $this->load->database();    
            $query = "CALL reset_spin_datetime(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function get_reward_list(){
            $this->load->database();    
            $query = "CALL get_reward_list()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function send_reward_info(){
            $user_id = $this->input->post('user_id');
            $email = $this->input->post('email');
            $nation_name = $this->input->post('nation_name');
            $this->load->database();    
            $query = "CALL send_reward_info(?,?,?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id,'p_email'=>$email,'p_nation_name'=>$nation_name));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function check_spin_status(){
            $user_id = $this->input->post('user_id');
            $this->load->database();    
            $query = "CALL check_spin_state(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function check_next_spin_turn(){
            $this->load->database();    
            $user_id = $this->input->post('user_id');
            $query = "CALL check_next_spin_turn(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
        public function get_spin_duration(){
            $this->load->database();    
            $query = "CALL get_spin_duration()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
        }
}
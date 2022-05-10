<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class General extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_data_version(){
          $this->load->database();
            $query = "SELECT data_version FROM mine_craft_mods.config;";
            $result = $this->db->query($query);
            print($result->result()[0] -> data_version);
            $this->db->close();
    }

    public function update_video_url(){
          $item_name = $this->input->post('item_name');
          $video_code = $this->input->post('video_code');
          $this->load->database();
	      $query = "UPDATE mine_craft_mods.item SET mine_craft_mods.item.video_code='$video_code' WHERE mine_craft_mods.item.item_name = '$item_name'";
            $result = $this->db->query($query);
            print($result);
          $this->db->close();
    }

    public function get_all_item(){
        $limit_amount = $this->input->post('limit_amount');
          $this->load->database();
            $query = "CALL get_all_item(?)";
            $result = $this->db->query($query,array('p_amount' => $limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function get_all_categories(){
        print("[{\"category_id\":\"1\",\"category_name\":\"Adventure\"},{\"category_id\":\"2\",\"category_name\":\"Creation\"},{\"category_id\":\"3\",\"category_name\":\"CTM\"},{\"category_id\":\"4\",\"category_name\":\"Custom Terrain\"},{\"category_id\":\"5\",\"category_name\":\"Minigame\"},{\"category_id\":\"6\",\"category_name\":\"Parkour\"},{\"category_id\":\"7\",\"category_name\":\"Puzzle\"},{\"category_id\":\"8\",\"category_name\":\"PvP\"},{\"category_id\":\"9\",\"category_name\":\"Redstone\"},{\"category_id\":\"10\",\"category_name\":\"Roller Coaster\"},{\"category_id\":\"11\",\"category_name\":\"Survival\"},{\"category_id\":\"12\",\"category_name\":\"People\"},{\"category_id\":\"13\",\"category_name\":\"None\"},{\"category_id\":\"14\",\"category_name\":\"Movies\"},{\"category_id\":\"15\",\"category_name\":\"TV\"},{\"category_id\":\"16\",\"category_name\":\"Games\"},{\"category_id\":\"17\",\"category_name\":\"Fantasy\"},{\"category_id\":\"18\",\"category_name\":\"Mods\"},{\"category_id\":\"19\",\"category_name\":\"Other\"}]");
        /*$this->load->database();
            $query = "CALL get_all_categories()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();*/
    }
    public function get_all_item_type(){
        print("[{\"type_id\":\"1\",\"type_name\":\"AddOn\"},{\"type_id\":\"2\",\"type_name\":\"Mod\"},{\"type_id\":\"3\",\"type_name\":\"Map\"},{\"type_id\":\"4\",\"type_name\":\"Skin\"},{\"type_id\":\"5\",\"type_name\":\"Texture\"},{\"type_id\":\"6\",\"type_name\":\"Seed\"}]");
        /*
        $this->load->database();
            $query = "CALL get_all_item_type()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();*/
    }
    public function get_item_by_type(){
        $this->load->database();
        $type_id = $this->input->post('type_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_item_by_type(?,?)";
        $result = $this->db->query($query, array('p_item_type_id'=>$type_id,'p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }

    public function get_item_by_type_v2(){
        $this->load->database();
        $type_id = $this->input->post('type_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_item_by_type_v2(?,?)";
        $result = $this->db->query($query, array('p_item_type_id'=>$type_id,'p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }

public function get_item_by_type_v3(){
        $this->load->database();
        $type_id = $this->input->get('type_id');
        $limit_amount = $this->input->get('limit_amount');
        $query = "CALL get_item_by_type(?,?)";
        $result = $this->db->query($query, array('p_item_type_id'=>$type_id,'p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }

    public function get_all_newest_news(){
        $this->load->database();
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_all_news_items(?)";
        $result = $this->db->query($query, array('p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function get_coin(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $query = "CALL get_coin(?)";
        $result = $this->db->query($query, array('p_user_id' => $user_id));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function buy_coin_package(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $coin_package_id = $this->input->post('cp_id');
        $order_id = $this->input->post('order_id');
        $query = "CALL buy_coin_package(?,?,?)";
        $result = $this->db->query($query, array('p_user_id' => $user_id,'p_coin_package_id'=>$coin_package_id,'p_order_id'=>$order_id));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function get_all_coin_package(){
        $this->load->database();    
            $query = "CALL get_all_coin_package()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
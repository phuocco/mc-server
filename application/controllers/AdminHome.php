<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AdminHome extends CI_Controller {

	public function index()
	{
                $this->load->view('template/navigation');
                $this->load->view('template/header');
		$this->load->view('admin/upload_items');
                $this->load->view('template/footer');
	}
        public function test(){
            print("sa");
        }
}

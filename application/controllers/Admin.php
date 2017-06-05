<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property Admin_model $Admin_model
 */
class Admin extends CI_Controller
{
    function __construct()
    {
        parent::__construct();

        $this->load->model('Admin_model', '', TRUE);

    }

    public function index()
    {
        echo "Access Denied";
    }

    function login()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('password');


        $response['isSuccess'] = false;
        $response['message'] = "Username atau Password salah ...";

        $nb = $this->Admin_model->login($username, $password);

        if ($nb != null) {
            $response['isSuccess'] = true;
            $response['message'] = "berhasil login";
        }


        echo json_encode($response);
    }


}

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property Validasi_Mustahiq_model $Validasi_Mustahiq_model
 * @property Mustahiq_model $Mustahiq_model
 */
class Validasi_mustahiq extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Validasi_Mustahiq_model', '', TRUE);
        $this->load->model('Mustahiq_model', '', TRUE);
    }


    public function index()
    {
        echo "Access Denied";
    }


    function addvalidasi()
    {

        $id_mustahiq = $this->input->post('id_mustahiq');
        $id_user = $this->input->post('id_user');


        $response['isSuccess'] = false;
        $response['message'] = "Error";

        if ($id_mustahiq != null
        ) {

            $validasi = array(
                'id_mustahiq' => $id_mustahiq,
                'id_user' => $id_user,
            );
            $action_validasi = $this->Validasi_Mustahiq_model->insertvalidasi($validasi);

            if ($action_validasi) {
                $response['isSuccess'] = true;
                $response['message'] = "Mustahiq telah divalidasi";
                $detail_mustahiq = $this->Mustahiq_model->getmustahiqById($id_mustahiq);
                $response['mustahiq'] = $detail_mustahiq;

            } else {
                $response['message'] = "Validasi gagal";
            }


        }
        echo json_encode($response);
    }


}

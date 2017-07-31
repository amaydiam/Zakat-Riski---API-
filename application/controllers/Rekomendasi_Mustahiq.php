<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property Rekomendasi_Mustahiq_model $Rekomendasi_Mustahiq_model
 * @property Mustahiq_model $Mustahiq_model
 */
class Rekomendasi_mustahiq extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Rekomendasi_Mustahiq_model', '', TRUE);
        $this->load->model('Mustahiq_model', '', TRUE);
    }


    public function index()
    {
        echo "Access Denied";
    }


    function addrekomendasi()
    {

        $id_mustahiq = $this->input->post('id_mustahiq');
        $id_user = $this->input->post('id_user');


        $response['isSuccess'] = false;
        $response['message'] = "Error";

        if ($id_mustahiq != null
        ) {

            $rekomendasi = array(
                'id_mustahiq' => $id_mustahiq,
                'id_user' => $id_user,
            );
            $action_rekomendasi = $this->Rekomendasi_Mustahiq_model->insertrekomendasi($rekomendasi);

            if ($action_rekomendasi) {
                $response['isSuccess'] = true;
                $response['message'] = "Mustahiq telah direkomendasi";
                $detail_mustahiq = $this->Mustahiq_model->getmustahiqById($id_mustahiq);
                $response['mustahiq'] = $detail_mustahiq;

            } else {
                $response['message'] = "Rekomendasi gagal";
            }


        }
        echo json_encode($response);
    }


}

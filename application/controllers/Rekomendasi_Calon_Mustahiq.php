<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property Rekomendasi_Calon_Mustahiq_model $Rekomendasi_Calon_Mustahiq_model
 * @property Calon_Mustahiq_model $Calon_Mustahiq_model
 */
class Rekomendasi_calon_mustahiq extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Rekomendasi_Calon_Mustahiq_model', '', TRUE);
        $this->load->model('Calon_Mustahiq_model', '', TRUE);
    }


    public function index()
    {
        echo "Access Denied";
    }


    function addrekomendasi()
    {

        $id_calon_mustahiq = $this->input->post('id_calon_mustahiq');
        $id_user = $this->input->post('id_user');

        $response['isSuccess'] = false;
        $response['message'] = "Error";

        if ($id_calon_mustahiq != null
        ) {

            $detail_rekomendasi_calon_mustahiq = $this->Rekomendasi_Calon_Mustahiq_model->getRekomendasiByIdCalon_MustahiqAndIdUser($id_calon_mustahiq, $id_user);
            if ($detail_rekomendasi_calon_mustahiq != null) {
                $response['message'] = "Rekomendasi gagal, Anda sudah memrekomendasi calon_mustahiq ini";
            } else {
                $rekomendasi = array(
                    'id_calon_mustahiq' => $id_calon_mustahiq,
                    'id_user' => $id_user,
                );

                $action_rekomendasi = $this->Rekomendasi_Calon_Mustahiq_model->insertrekomendasi($rekomendasi);

                if ($action_rekomendasi) {
                    $response['isSuccess'] = true;
                    $response['message'] = "Calon_Mustahiq telah direkomendasi";
                    $detail_calon_mustahiq = $this->Calon_Mustahiq_model->getcalon_mustahiqById($id_calon_mustahiq);
                    $response['calon_mustahiq'] = $detail_calon_mustahiq;

                } else {
                    $response['message'] = "Rekomendasi gagal";
                }
            }

        }
        echo json_encode($response);
    }


}

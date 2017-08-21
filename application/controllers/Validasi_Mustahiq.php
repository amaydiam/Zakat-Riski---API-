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

        $id_calon_mustahiq = $this->input->post('id_calon_mustahiq');
        $id_amil_zakat = $this->input->post('id_amil_zakat');


        $response['isSuccess'] = false;
        $response['message'] = "Error";

        if ($id_calon_mustahiq != null
        ) {

            $detail_mustahiq = $this->Mustahiq_model->getmustahiqByIdCalonMustahiq($id_calon_mustahiq);

            if ($detail_mustahiq != null) {

                $detail_validasi_mustahiq = $this->Validasi_Mustahiq_model->getValidasiByIdMustahiqAndIdAmilZakat($detail_mustahiq["id_mustahiq"], $id_amil_zakat);
                if ($detail_validasi_mustahiq != null) {
                    $response['message'] = "Validasi gagal, Anda sudah memvalidasi mustahiq ini";
                } else {
                    $validasi = array(
                        'id_mustahiq' => $detail_mustahiq["id_mustahiq"],
                        'id_amil_zakat' => $id_amil_zakat,
                    );

                    $action_validasi = $this->Validasi_Mustahiq_model->insertvalidasi($validasi);

                    if ($action_validasi) {
                        $response['isSuccess'] = true;
                        $response['message'] = "Mustahiq telah divalidasi";
                        $detail_mustahiq = $this->Mustahiq_model->getmustahiqById($detail_mustahiq["id_mustahiq"]);
                        $response['mustahiq'] = $detail_mustahiq;

                    } else {
                        $response['message'] = "Validasi gagal";
                    }
                }
            } else {


                $mustahiq = array(
                    'id_calon_mustahiq' => $id_calon_mustahiq,
                    'id_amil_zakat' => $id_amil_zakat,
                );

                $action_mustahiq = $this->Mustahiq_model->insertmustahiq($mustahiq);

                if ($action_mustahiq) {

                    $detail_mustahiq = $this->Mustahiq_model->getLastmustahiq();

                    $validasi = array(
                        'id_mustahiq' => $detail_mustahiq["id_mustahiq"],
                        'id_amil_zakat' => $id_amil_zakat,
                    );

                    $action_validasi = $this->Validasi_Mustahiq_model->insertvalidasi($validasi);

                    if ($action_validasi) {
                        $response['isSuccess'] = true;
                        $response['message'] = "Mustahiq telah divalidasi";
                        $response['mustahiq'] = $detail_mustahiq;

                    } else {
                        $response['message'] = "Validasi gagal";
                    }
                } else {
                    $response['message'] = "Validasi gagal";
                }
            }

        }
        echo json_encode($response);
    }


}

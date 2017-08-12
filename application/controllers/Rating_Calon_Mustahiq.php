<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property Rating_Calon_Mustahiq_model $Rating_Calon_Mustahiq_model
 * @property Calon_Mustahiq_model $Calon_Mustahiq_model
 */
class Rating_calon_mustahiq extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Rating_Calon_Mustahiq_model', '', TRUE);
        $this->load->model('Calon_Mustahiq_model', '', TRUE);
    }


    public function index()
    {
        echo "Access Denied";
    }


    function addrating()
    {

        $id_calon_mustahiq = $this->input->post('id_calon_mustahiq');
        $rating = $this->input->post('rating');
        $id_user = $this->input->post('id_user');


        $response['isSuccess'] = false;
        $response['message'] = "Error";

        if ($id_calon_mustahiq != null
            && $rating != null
        ) {

            $rating = array(
                'id_calon_mustahiq' => $id_calon_mustahiq,
                'rating' => $rating,
                'id_user' => $id_user,
            );
            $action_rating = $this->Rating_Calon_Mustahiq_model->insertrating($rating);

            if ($action_rating) {
                $response['isSuccess'] = true;
                $response['message'] = "Rating telah dikirim";
                $detail_calon_mustahiq = $this->Calon_Mustahiq_model->getcalon_mustahiqById($id_calon_mustahiq);
                $response['calon_mustahiq'] = $detail_calon_mustahiq;

            } else {
                $response['message'] = "Rating gagal";
            }


        }
        echo json_encode($response);
    }


}

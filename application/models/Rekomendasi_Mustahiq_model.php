<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Rekomendasi_Mustahiq_model $Rekomendasi_Mustahiq_model
 */
class Rekomendasi_Mustahiq_model extends CI_Model
{


    public function insertrekomendasi($rekomendasi)
    {
        $query = $this->db->insert('rekomendasi_mustahiq', $rekomendasi);
        return $query;
    }



}